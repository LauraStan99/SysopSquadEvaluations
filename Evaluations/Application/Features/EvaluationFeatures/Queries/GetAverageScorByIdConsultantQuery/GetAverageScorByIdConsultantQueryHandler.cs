using Application.Interfaces;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.EvaluationFeatures.Queries.GetAverageScorByIdConsultantQuery
{
    public class GetAverageScorByIdConsultantQueryHandler:IRequestHandler<GetAverageScorByIdConsultantQuery, float>
    {
       
        private readonly IEvaluationRepository _repository;
        public GetAverageScorByIdConsultantQueryHandler(IEvaluationRepository repository)
        {
            _repository = repository;
        }

        public async Task<float> Handle(GetAverageScorByIdConsultantQuery request, CancellationToken cancellationToken)
        {
            var evaluationAverage = await _repository.GetAverageScorAsync(request.Id);
            if (evaluationAverage == 0)
                throw new ArgumentException("There are no evaluations for this consultant!", nameof(request));
            return evaluationAverage;
        }
    }
}
