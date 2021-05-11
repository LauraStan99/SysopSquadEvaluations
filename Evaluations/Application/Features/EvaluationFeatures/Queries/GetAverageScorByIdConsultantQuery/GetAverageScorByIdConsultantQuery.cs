using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.EvaluationFeatures.Queries.GetAverageScorByIdConsultantQuery
{
    public class GetAverageScorByIdConsultantQuery : IRequest<float>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;

        public GetAverageScorByIdConsultantQuery(string id)
        {
            Id = id;
        }
    }
}
