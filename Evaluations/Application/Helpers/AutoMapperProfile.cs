using Application.Features.EvaluationFeatures.Commands.UpdateEvaluationByIdCommand;
using Application.Features.EvaluationFeatures.Commands.CreateEvaluationCommand;
using AutoMapper;
using Domain.Entities;

namespace Application.Helpers
{
    public class AutoMapperProfile:Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<UpdateEvaluationByIdCommand, Evaluation>();
            CreateMap<CreateEvaluationCommand, Evaluation>();
        }
    }
}
