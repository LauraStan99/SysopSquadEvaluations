using Application.Features.EvaluationFeatures.Commands.CreateEvaluationCommand;
using FluentValidation;

namespace WebAPI.Validators
{
    public class CreateEvaluationCommandValidator : AbstractValidator<CreateEvaluationCommand>
    {
        public CreateEvaluationCommandValidator()
        {
            const string idRegex = "^[a-f\\d]{24}$";

            RuleFor(evaluation => evaluation.UserId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyUserId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);

            RuleFor(evaluation => evaluation.ConsultantId)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyConsultantId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure);

            RuleFor(evaluation => evaluation.Scor)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyScor)
                .InclusiveBetween(1, 5).WithMessage(ValidationErrors.InvalidScor);
        }
    }
}
