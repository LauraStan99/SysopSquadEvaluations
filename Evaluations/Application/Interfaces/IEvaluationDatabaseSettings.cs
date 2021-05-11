namespace Application.Interfaces
{
    public interface IEvaluationDatabaseSettings
    {
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}
