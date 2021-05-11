using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.EvaluationFeatures.Commands.DeleteEvaluationByIdCommand
{
    public class DeleteEvaluationByIdCommand :IRequest<bool>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;
        public DeleteEvaluationByIdCommand(string id)
        {
            Id = id;
        }
    }
}
