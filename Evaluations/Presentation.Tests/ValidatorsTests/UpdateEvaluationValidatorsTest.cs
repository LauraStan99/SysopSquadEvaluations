using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentAssertions;
using FluentValidation.TestHelper;
using Persistence.Repository.v1;
using Presentation.Tests.Helpers;
using Tests.Helpers;
using WebAPI.Validators;
using Xunit;

namespace Presentation.Tests.ValidatorsTests
{
    public class UpdateEvaluationValidatorsTest : IClassFixture<DatabaseTest>
    {
        private readonly DatabaseTest _database;
        private readonly UpdateEvaluationCommandValidator _validator;

        public UpdateEvaluationValidatorsTest(DatabaseTest database)
        {
            _database = database;
            _validator = new UpdateEvaluationCommandValidator();
        }

        [Fact]
        public void GivenValidData_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateEvaluationByIdCommandFactory.ValidUpdateEvaluationCommand(_database.DbContext);

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithNoScore_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateEvaluationByIdCommandFactory.UpdateEvaluationCommandWithoutScore();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Scor)
                .WithErrorMessage(ValidationErrors.EmptyScor);
            result.ShouldNotHaveValidationErrorFor(evaluation => evaluation.UserId);
            result.ShouldNotHaveValidationErrorFor(evaluation => evaluation.ConsultantId);
        }
    }
}
