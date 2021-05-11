using Application.Interfaces;

namespace Persistence.Context
{
    public class EvaluationDatabaseSettings : IEvaluationDatabaseSettings
    {
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }
}
