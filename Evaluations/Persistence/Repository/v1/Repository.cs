using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Application.Interfaces;
using Domain.Common;
using MongoDB.Driver;


namespace Persistence.Repository.v1
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : BaseEntity
    {
        private readonly IApplicationDbContext _context;

        public Repository(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            try
            {
                return await _context.GetCollection<TEntity>().FindAsync(entity => true).Result.ToListAsync();
            }
            catch (Exception ex)
            {
                throw new ArgumentException($"Couldn't get entities: {ex.Message}");
            }
        }

        public async Task<TEntity> GetByIdAsync(string id)
        {
            
            return await _context.GetCollection<TEntity>().Find<TEntity>(entity => entity.Id == id).FirstOrDefaultAsync();
        }

        
        public async Task<TEntity> CreateAsync(TEntity entity)
        {

            await _context.GetCollection<TEntity>().InsertOneAsync(entity);
            return entity;
        }

        public async Task<TEntity> UpdateAsync(TEntity entity)
        {
            var foundEntity = await GetByIdUserAndIdConsultantAsync(entity.UserId,entity.ConsultantId);
            if (foundEntity == null)
            {
                return null;
            }
            foundEntity.Scor = entity.Scor;
            await _context.GetCollection<TEntity>().ReplaceOneAsync(filter: evaluation => evaluation.Id == foundEntity.Id, replacement: foundEntity);
            return foundEntity;
        }

        public async Task<bool> DeleteAsync(string id)
        {
            var deleteResult = await _context.GetCollection<TEntity>().DeleteOneAsync(user => user.Id == id);

            return deleteResult.IsAcknowledged && deleteResult.DeletedCount > 0;
        }

        public async Task<TEntity> GetByIdUserAndIdConsultantAsync(string userId,string consultantId)
        {
            if (string.IsNullOrEmpty(userId) || string.IsNullOrEmpty(consultantId))
                return null;
            var evaluation = await _context.GetCollection<TEntity>().Find<TEntity>(entity => entity.UserId == userId && entity.ConsultantId == consultantId).FirstOrDefaultAsync();

            if (evaluation == null)
            {
                return null;
            }
            return evaluation;
        }

        public async Task<float> GetAverageScorAsync(string id)
        {
            var listEvaluations= await _context.GetCollection<TEntity>().FindAsync(entity => entity.ConsultantId == id ).Result.ToListAsync();
            if (listEvaluations == null) return 0;
            var sum = 0;
            foreach(var evaluation in listEvaluations)
            {
                sum += evaluation.Scor;
            }

            return ( sum / listEvaluations.Count);
        }
    }
}
