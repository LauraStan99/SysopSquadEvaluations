using Application.Features.EvaluationFeatures.Commands.UpdateEvaluationByIdCommand;
using FluentValidation;

namespace WebAPI.Validators
{
    public class UpdateEvaluationCommandValidator : AbstractValidator<UpdateEvaluationByIdCommand>
    {
        public UpdateEvaluationCommandValidator()
        {
            const string idRegex = "^[a-f\\d]{24}$";

            When(evaluation => !string.IsNullOrEmpty(evaluation.UserId), () =>
            {
                RuleFor(evaluation => evaluation.UserId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyUserId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);
            });

            When(evaluation => !string.IsNullOrEmpty(evaluation.ConsultantId), () =>
            {
                RuleFor(evaluation => evaluation.ConsultantId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyConsultantId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);
            });

           
            RuleFor(evaluation => evaluation.Scor)
            .Cascade(CascadeMode.Stop)
            .NotEmpty().WithMessage(ValidationErrors.EmptyScor)
            .InclusiveBetween(1, 5).WithMessage(ValidationErrors.InvalidScor);
        }
    }
}
