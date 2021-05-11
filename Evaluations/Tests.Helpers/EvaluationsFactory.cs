using Application.Interfaces;
using Domain.Entities;

namespace Tests.Helpers
{
    public static class EvaluationsFactory
    {
        public static Evaluation ValidEvaluation()
        {
            return new Evaluation
            {   
                Scor = 5,
                UserId = "608333233b69f6fd370f0bda",
                ConsultantId = "607efc4963711f901124c912"
            };
        }
        public static Evaluation AddedEvaluation(IApplicationDbContext context)
        {
            var evaluation = ValidEvaluation();
            context.GetCollection<Evaluation>().InsertOne(evaluation);
            return evaluation;
        }

        public static Evaluation Added2Evaluations(IApplicationDbContext context)
        {
            var evaluation1 = ValidEvaluation();
            var evaluation2 = ValidEvaluation();
            context.GetCollection<Evaluation>().InsertOne(evaluation1);
            context.GetCollection<Evaluation>().InsertOne(evaluation2);
            return evaluation1;
        }

        public static Evaluation UpdateScorValidEvaluation(string id)
        {
            return new Evaluation
            {
                Id = id,
                Scor = 4           
            };
        }
    }
}
