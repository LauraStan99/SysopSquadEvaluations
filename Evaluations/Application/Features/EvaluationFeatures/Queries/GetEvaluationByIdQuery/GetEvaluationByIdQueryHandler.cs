using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.EvaluationFeatures.Queries.GetEvaluationByIdQuery
{
    public class GetEvaluationByIdQueryHandler : IRequestHandler<GetEvaluationByIdQuery, Evaluation>
    {
        private readonly IEvaluationRepository _repository;

        public GetEvaluationByIdQueryHandler(IEvaluationRepository repository)
        {
            _repository = repository;
        }
        public async Task<Evaluation> Handle(GetEvaluationByIdQuery request, CancellationToken cancellationToken)
        {
            var evaluation = await _repository.GetByIdAsync(request.Id);
            if (evaluation == null)
                throw new ArgumentException("Evaluation Not Found!", nameof(request));
            return evaluation;
        }

       
    }
}
