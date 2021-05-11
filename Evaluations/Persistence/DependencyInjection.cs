using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Persistence.Context;
using Application.Interfaces;
using MongoDB.Driver;
using Microsoft.Extensions.Options;
using Persistence.Repository.v1;
namespace Persistence
{
    public static class DependencyInjection
    {
        public static void AddPersistence(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<EvaluationDatabaseSettings>(configuration.GetSection("EvaluationDatabaseSettings"));

            services.AddSingleton<IEvaluationDatabaseSettings>(sp =>
                sp.GetRequiredService<IOptions<EvaluationDatabaseSettings>>().Value);

            services.AddScoped<IApplicationDbContext, ApplicationDbContext>();
            services.AddScoped<IEvaluationRepository, EvaluationRepository>();


            var mongoCon = configuration.GetSection("EvaluationDatabaseSettings")["ConnectionString"];
            services.AddSingleton<IMongoClient>(new MongoClient(mongoCon));

        }
    }
}
