using Domain.Entities;
using MediatR;
using System.Collections.Generic;

namespace Application.Features.EvaluationFeatures.Queries.GetAllEvaluationsQuery
{
    public class GetAllEvaluationsQuery : IRequest<IEnumerable<Evaluation>>
    {
    }

}
