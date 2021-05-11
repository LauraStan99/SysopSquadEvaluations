using Application.Helpers;
using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.ComponentModel.DataAnnotations;

namespace Application.Features.EvaluationFeatures.Commands.UpdateEvaluationByIdCommand
{
    public class UpdateEvaluationByIdCommand : CommandModelHelper, IRequest<Evaluation>
    {
        [BsonRepresentation(BsonType.ObjectId)]
        [Required]
        public string Id { get; set; }
    }
}
