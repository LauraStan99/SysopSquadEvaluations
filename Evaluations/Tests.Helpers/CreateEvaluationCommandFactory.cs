using Application.Features.EvaluationFeatures.Commands.CreateEvaluationCommand;
using Application.Interfaces;
using Domain.Entities;

namespace Tests.Helpers
{
    public static class CreateEvaluationCommandFactory
    {
        public static CreateEvaluationCommand ValidCreateEvaluationCommand() => new()
        {
            Scor = 4,
            UserId = "608333233b69f6fd370f0bdb",
            ConsultantId = "607efc4963711f901124c910"
        };

        public static CreateEvaluationCommand CreateEvaluationCommandWithWrongScore()
        {
            var createEvaluation = ValidCreateEvaluationCommand();
            createEvaluation.Scor = 11;
            return createEvaluation;
        }

        public static CreateEvaluationCommand CreateEvaluationCommandWithNoData() => new();
    }
}
