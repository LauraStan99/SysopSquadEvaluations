using Application.Interfaces;
using Persistence.Context;
using Persistence.Repository.v1;
using System;

namespace Presentation.Tests.Helpers
{
    public class DatabaseTest : IDisposable
    {
        private readonly string dbName = "EvaluationsTestDatabase";
        public IApplicationDbContext DbContext { get; }
        public IEvaluationRepository EvaluationRepository { get; }

        public DatabaseTest()
        {
            ConnectionDatabase.DbContextSettings.ConnectionString = ConnectionDatabase.connString;
            ConnectionDatabase.DbContextSettings.DatabaseName = dbName;
            DbContext = new ApplicationDbContext(ConnectionDatabase.DbContextSettings);
            EvaluationRepository = new EvaluationRepository(DbContext);
        }

        public void Dispose()
        {
            DbContext.Client.GetDatabase(dbName).DropCollection("Evaluations");
        }
    }
}
