using Application.Features.EvaluationFeatures.Commands.DeleteEvaluationByIdCommand;
using Application.Features.EvaluationFeatures.Commands.UpdateEvaluationByIdCommand;
using Application.Features.EvaluationFeatures.Queries.GetAllEvaluationsQuery;
using Application.Features.EvaluationFeatures.Queries.GetEvaluationByIdQuery;
using Application.Features.EvaluationFeatures.Queries.GetAverageScorByIdConsultantQuery;
using Application.Features.EvaluationFeatures.Commands.CreateEvaluationCommand;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System;

namespace WebAPI.Controllers.v1
{
    [ApiVersion("1.0")]
    public class EvaluationsController:BaseApiController
    {
        public EvaluationsController(IMediator mediator) : base(mediator)
        {
        }
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await Mediator.Send(new GetAllEvaluationsQuery()));
        }

        [HttpGet("{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> GetById(string id)
        {
            try
            {
                return Ok(await Mediator.Send(new GetEvaluationByIdQuery(id)));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }
        [HttpGet("average/{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAverageScorById(string id)
        {
            try 
            {
                return Ok(await Mediator.Send(new GetAverageScorByIdConsultantQuery(id)));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
            
        }

        [HttpPost("create")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Create([FromBody] CreateEvaluationCommand command)
        {
            var evaluation = await Mediator.Send(command);
            if (evaluation == null)
                return BadRequest();
            return Ok(new
            {
                evaluation.Scor,
                evaluation.UserId,
                evaluation.ConsultantId

            }) ;
        }

        [HttpPut]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Update(UpdateEvaluationByIdCommand command)
        {
            try
            {
                await Mediator.Send(command);
                return NoContent();
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpDelete("{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(string id)
        {
            var deleted = await Mediator.Send(new DeleteEvaluationByIdCommand(id));
            if (deleted)
                return NoContent();
            return NotFound();
        }

    }
}
