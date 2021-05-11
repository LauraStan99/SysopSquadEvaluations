using System.Collections.Generic;
using Application.Features.EvaluationFeatures.Commands.UpdateEvaluationByIdCommand;
using Application.Interfaces;

namespace Tests.Helpers
{
    public static class UpdateEvaluationByIdCommandFactory
    {
        public static UpdateEvaluationByIdCommand ValidUpdateEvaluationCommand(IApplicationDbContext context)
        {
            var evaluation = EvaluationsFactory.AddedEvaluation(context);
            return new()
            {
                Id = evaluation.Id,
                Scor = 3,
                UserId = "608333233b69f6fd370f0bda",
                ConsultantId = "607efc4963711f901124c912"
            };
        }

        public static UpdateEvaluationByIdCommand UpdateEvaluationCommandWithoutId() =>
            new()
            {
                Scor = 5,
                UserId = "608333233b69f6fd370f0bda",
                ConsultantId = "607efc4963711f901124c912"
            };

        public static UpdateEvaluationByIdCommand UpdateEvaluationCommandWithoutScore() =>
            new()
            {
                UserId = "608333233b69f6fd370f0bda",
                ConsultantId = "607efc4963711f901124c912"
            };

        public static UpdateEvaluationByIdCommand UpdateEvaluationCommandWithInvalidIdStructure() =>
            new()
            {
                Id = "aaa93pwodjsdaaaaaaaajjkk",
                Scor = 5,
                UserId = "608333233b69f6fd370f0bda",
                ConsultantId = "607efc4963711f901124c912"
            };

        public static UpdateEvaluationByIdCommand UpdateEvaluationCommandWithInvalidIdLength() =>
            new()
            {
                Id = "error",
                Scor = 5,
                UserId = "608333233b69f6fd370f0bda",
                ConsultantId = "607efc4963711f901124c912"
            };

        public static UpdateEvaluationByIdCommand UpdateEvaluationCommandWithInexistentId() =>
            new()
            {
                Id = "6075e868974ac5357820d428",
                Scor = 5,
                UserId = "608333233b69f6fd370f0bda",
                ConsultantId = "607efc4963711f901124c912"
            };
    }
}
