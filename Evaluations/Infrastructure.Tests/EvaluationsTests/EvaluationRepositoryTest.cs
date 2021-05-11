using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Infrastructure.Tests.Helpers;
using Tests.Helpers;
using Xunit;

namespace Infrastructure.Tests.EvaluationsTests
{
    public class EvaluationRepositoryTest : IClassFixture<DatabaseTest>
    {
        private readonly IEvaluationRepository _repository;
        private readonly DatabaseTest _database;

        public EvaluationRepositoryTest(DatabaseTest databaseTest)
        {
            _database = databaseTest;
            _repository = _database.EvaluationRepository;
        }

        [Fact]
        public async Task GivenAnEvaluation_WhenCreateAsync_ThenReturnEvaluationEntity()
        {
            var evaluation = EvaluationsFactory.ValidEvaluation();

            var result = await _repository.CreateAsync(evaluation);
 
            result.Should().BeOfType<Evaluation>();
            result.Scor.Should().Be(evaluation.Scor);
            result.UserId.Should().Be(evaluation.UserId);
            result.ConsultantId.Should().Be(evaluation.ConsultantId);
        }

        [Fact]
        public async Task GivenAListOfEvaluations_WhenGetAllEvaluations_ThenReturnListOfEvaluationEntity()
        {
            var evaluation = EvaluationsFactory.Added2Evaluations(_database.DbContext);

            var result = await _repository.GetAllAsync();

            result.Should().BeOfType<List<Evaluation>>();
            var addedEvaluation = result.FirstOrDefault(e => e.Id == evaluation.Id);
            addedEvaluation.Should().NotBeNull();
        }

        [Fact]
        public async Task GivenAnId_WhenGetByIdAsync_ThenReturnAnEvaluation()
        {
            var evaluation = EvaluationsFactory.AddedEvaluation(_database.DbContext);

            var result = await _repository.GetByIdAsync(evaluation.Id);

            result.Should().BeOfType<Evaluation>();
            result.Scor.Should().Be(5);
            result.Should().NotBeNull();
        }

        [Fact]
        public async Task GivenAnId_WhenDeleteAsync_ThenReturnTrue()
        {
            var evaluation = EvaluationsFactory.AddedEvaluation(_database.DbContext);

            var result = await _repository.DeleteAsync(evaluation.Id);

            result.Should().BeTrue();
        }
    }
}
