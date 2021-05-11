using FluentAssertions;
using FluentValidation.TestHelper;
using Persistence.Repository.v1;
using Presentation.Tests.Helpers;
using Tests.Helpers;
using WebAPI.Validators;
using Xunit;

namespace Presentation.Tests.ValidatorsTests
{
    public class CreateEvaluationValidatorsTest : IClassFixture<DatabaseTest>
    {
        private readonly DatabaseTest _database;
        private readonly CreateEvaluationCommandValidator _validator;

        public CreateEvaluationValidatorsTest(DatabaseTest databaseTest)
        {
            _database = databaseTest;
            _validator = new CreateEvaluationCommandValidator();
        }

        [Fact]
        public void GivenValidData_WhenValidateCreate_ThenReturnNoErrors()
        {
            var command = CreateEvaluationCommandFactory.ValidCreateEvaluationCommand();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenWrongScore_WhenValidateCreate_ThenReturnValidationErrors()
        {
            var command = CreateEvaluationCommandFactory.CreateEvaluationCommandWithWrongScore();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Scor)
                .WithErrorMessage(ValidationErrors.InvalidScor);
            result.ShouldNotHaveValidationErrorFor(evaluation => evaluation.UserId);
            result.ShouldNotHaveValidationErrorFor(evaluation => evaluation.ConsultantId);
        }
    }
}
