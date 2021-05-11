using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.ComponentModel.DataAnnotations;
using Application.Helpers;

namespace Application.Features.EvaluationFeatures.Commands.CreateEvaluationCommand
{
    public class CreateEvaluationCommand : CommandModelHelper, IRequest<Evaluation>
    {
    }
}
