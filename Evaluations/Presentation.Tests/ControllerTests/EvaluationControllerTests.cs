using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAPI.Controllers.v1;
using FakeItEasy;
using Xunit;
using Microsoft.AspNetCore.Mvc;
using Application.Features.EvaluationFeatures.Queries.GetAllEvaluationsQuery;
using FluentAssertions;
using MongoDB.Bson;
using Application.Features.EvaluationFeatures.Queries.GetEvaluationByIdQuery;
using Application.Features.EvaluationFeatures.Commands.DeleteEvaluationByIdCommand;
using Tests.Helpers;

namespace Presentation.Tests.ControllerTests
{
    public class EvaluationControllerTests
    {
        private readonly EvaluationsController _controller;
        private readonly IMediator _mediator;
        public EvaluationControllerTests()
        {
            _mediator = A.Fake<IMediator>();
            _controller = new EvaluationsController(_mediator);
        }
        [Fact]
        public async Task GivenEvaluationController_WhenGetAllIsCalled_ThenReturnEvaluationCollection()
        {
            var result = await _controller.GetAll();
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetAllEvaluationsQuery>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenEvaluationController_WhenGetByIdIsCalled_ThenReturnEvaluationWithId()
        {
            var id = ObjectId.GenerateNewId().ToString();

            var result = await _controller.GetById(id);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetEvaluationByIdQuery>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenEvaluationController_WhenDeleteIsCalledWithNewId_ThenReturnNotFound()
        {
            var id = ObjectId.GenerateNewId().ToString();

            var result = await _controller.Delete(id);
            var notFoundResult = result as NotFoundResult;

            notFoundResult.Should().NotBeNull();
            notFoundResult.StatusCode.Should().Be(404);
            A.CallTo(() => _mediator.Send(A<DeleteEvaluationByIdCommand>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenEvaluationController_WhenCreateIsCalled_ThenReturnEvaluation()
        {
            var command = CreateEvaluationCommandFactory.ValidCreateEvaluationCommand();

            var result = await _controller.Create(command);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenEvaluationController_WhenUpdateIsCalled_ThenReturnNoContent()
        {
            var id = ObjectId.GenerateNewId().ToString();
            var command = UpdateEvaluationByIdCommandFactory.ValidUpdateEvaluationByIdCommand(id);

            var result = await _controller.Update(command);
            var noContentResult = result as NoContentResult;

            noContentResult.Should().NotBeNull();
            noContentResult.StatusCode.Should().Be(204);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }
    }
}
