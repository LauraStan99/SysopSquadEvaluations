using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Application.Features.EvaluationFeatures.Queries.GetAllEvaluationsQuery;
using Application.Features.EvaluationFeatures.Queries.GetAverageScorByIdConsultantQuery;
using Application.Features.EvaluationFeatures.Queries.GetEvaluationByIdQuery;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Moq;
using Tests.Helpers;
using Xunit;

namespace Core.Tests.EvaluationsTests
{
    public class QueriesTests
    {
        [Fact]
        public async Task GivenAList_WhenGetAllEvaluationsQueryHandler_ThenReturnNotNull()
        {
            var evaluation1 = EvaluationsFactory.ValidEvaluation();
            var evaluation2 = EvaluationsFactory.ValidEvaluation();
            var evaluations = new List<Evaluation> { evaluation1, evaluation2 };
            var command = new GetAllEvaluationsQuery();
            var mockRepo = new Mock<IEvaluationRepository>();
            mockRepo.Setup(db => db.GetAllAsync().Result).Returns(evaluations);
            var handler = new GetAllEvaluationsQueryHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().NotContainNulls();
            result.Should().HaveCount(evaluations.Count);
            result.Should().Contain(evaluation1);
        }

        [Fact]
        public async Task GivenAnId_WhenGetEvaluationByIdQueryHandler_ThenReturnNotNull()
        {
            var evaluation = EvaluationsFactory.ValidEvaluation();
            var command = new GetEvaluationByIdQuery(evaluation.Id);
            var mockRepo = new Mock<IEvaluationRepository>();
            mockRepo.Setup(db => db.GetByIdAsync(command.Id).Result).Returns(evaluation);
            var handler = new GetEvaluationByIdQueryHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().NotBeNull();
            result.Id.Should().Be(evaluation.Id);
            result.Scor.Should().Be(evaluation.Scor);
            result.UserId.Should().Be(evaluation.UserId);
            result.ConsultantId.Should().Be(evaluation.ConsultantId);
        }

        [Fact]
        public async Task GivenAnIdConsultant_WhenGetAverageScorByIdConsultantQueryHandler_ThenReturnNotNull()
        {
            var evaluation1 = EvaluationsFactory.ValidEvaluation();
            var evaluation2 = EvaluationsFactory.ValidEvaluation();
            var evaluations = new List<Evaluation> { evaluation1, evaluation2 };
            var command = new GetAverageScorByIdConsultantQuery(evaluation1.ConsultantId);
            var mockRepo = new Mock<IEvaluationRepository>();
            mockRepo.Setup(db => db.GetAllAsync().Result).Returns(evaluations);
            var handler = new GetAverageScorByIdConsultantQueryHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().NotBe(0);
          
        }
    }
}
