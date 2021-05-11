using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.EvaluationFeatures.Queries.GetAllEvaluationsQuery
{
    public class GetAllEvaluationsQueryHandler : IRequestHandler<GetAllEvaluationsQuery, IEnumerable<Evaluation>>
    {
        private readonly IEvaluationRepository _repository;

        public GetAllEvaluationsQueryHandler(IEvaluationRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<Evaluation>> Handle(GetAllEvaluationsQuery request, CancellationToken cancellationToken)
        {
            return await _repository.GetAllAsync();
        }

    }
}
