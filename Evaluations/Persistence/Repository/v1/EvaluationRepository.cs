using Application.Interfaces;
using Domain.Entities;

namespace Persistence.Repository.v1
{
    public class EvaluationRepository :Repository<Evaluation>, IEvaluationRepository
    {

        public EvaluationRepository(IApplicationDbContext context) : base(context)
        {
        }
}
}
