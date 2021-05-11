using Application.Interfaces;
using AutoMapper;
using Domain.Entities;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.EvaluationFeatures.Commands.CreateEvaluationCommand
{
    public class CreateEvaluationCommandHandler : IRequestHandler<CreateEvaluationCommand, Evaluation>
    {
        private readonly IEvaluationRepository _repository;
        private readonly IMapper _mapper;
        public CreateEvaluationCommandHandler(IEvaluationRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }
        public async Task<Evaluation> Handle(CreateEvaluationCommand request, CancellationToken cancellationToken)
        {
            var user = _mapper.Map<Evaluation>(request);
           
            return await _repository.CreateAsync(user);
        }
    }
}
