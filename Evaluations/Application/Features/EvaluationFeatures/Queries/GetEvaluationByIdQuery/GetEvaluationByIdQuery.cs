using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.EvaluationFeatures.Queries.GetEvaluationByIdQuery
{
    public class GetEvaluationByIdQuery : IRequest<Evaluation>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;

        public GetEvaluationByIdQuery(string id)
        {
            Id = id;
        }
    }
}
