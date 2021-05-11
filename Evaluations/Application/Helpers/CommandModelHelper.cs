using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.ComponentModel.DataAnnotations;

namespace Application.Helpers
{
    public class CommandModelHelper
    {
        [Required]
        public int Scor { get; set; }

        [BsonRepresentation(BsonType.ObjectId)]
        [Required]
        public string UserId { get; set; }

        [BsonRepresentation(BsonType.ObjectId)]
        [Required]
        public string ConsultantId { get; set; }
    }
}
