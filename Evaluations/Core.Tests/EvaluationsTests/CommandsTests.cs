using System.Threading;
using System.Threading.Tasks;
using Application.Features.EvaluationFeatures.Commands.DeleteEvaluationByIdCommand;
using Application.Interfaces;
using FluentAssertions;
using Moq;
using Tests.Helpers;
using Xunit;

namespace Core.Tests.UserTests
{
    public class CommandsTests
    {
        [Fact]
        public async Task GivenAnId_WhenDeleteEvaluationByIdCommandHandler_ThenReturnTrue()
        {
            var evaluation = EvaluationsFactory.ValidEvaluation();
            var command = new DeleteEvaluationByIdCommand(evaluation.Id);
            var mockRepo = new Mock<IEvaluationRepository>();
            mockRepo.Setup(db => db.DeleteAsync(command.Id).Result).Returns(true);
            var handler = new DeleteEvaluationByIdCommandHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().BeTrue();
        }
    }
}
