using Application.Interfaces;
using AutoMapper;
using Domain.Entities;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.EvaluationFeatures.Commands.UpdateEvaluationByIdCommand
{
    public class UpdateEvaluationByIdCommandHandler : IRequestHandler<UpdateEvaluationByIdCommand, Evaluation>
    {
        private readonly IEvaluationRepository _repository;
        private readonly IMapper _mapper;
        public UpdateEvaluationByIdCommandHandler(IEvaluationRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }
        public async Task<Evaluation> Handle(UpdateEvaluationByIdCommand request, CancellationToken cancellationToken)
        {
            var evaluation = _mapper.Map<Evaluation>(request);
            var evaluationUpdate = await _repository.UpdateAsync(evaluation);
            if (evaluationUpdate == null)
            {
                throw new ArgumentException("Evaluation cannot be updated. UserId or ConsultantId does not exist.", nameof(request));
            }

            return evaluationUpdate;
        }
    }
}
