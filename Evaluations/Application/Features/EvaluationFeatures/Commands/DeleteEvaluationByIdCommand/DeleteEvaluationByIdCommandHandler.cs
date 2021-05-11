using MediatR;
using Application.Interfaces;
using System.Threading;
using System.Threading.Tasks;
namespace Application.Features.EvaluationFeatures.Commands.DeleteEvaluationByIdCommand
{
    public class DeleteEvaluationByIdCommandHandler : IRequestHandler<DeleteEvaluationByIdCommand, bool>
    {
        private readonly IEvaluationRepository _repository;

        public DeleteEvaluationByIdCommandHandler(IEvaluationRepository repository)
        {
            _repository = repository;
        }

        public async Task<bool> Handle(DeleteEvaluationByIdCommand request, CancellationToken cancellationToken)
        {
            return await _repository.DeleteAsync(request.Id);
        }
    }
}
