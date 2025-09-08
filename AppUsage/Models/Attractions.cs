using Microsoft.Extensions.Logging;
using Seido.Utilities.SeedGenerator;

namespace Models
{
    public enum AttracionType { Bakery, Castle, Amusementpark, Museum, Zoo }

    public class Attraction : ISeed<Attraction>
    {
        public int AttractionId { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Country { get; set; }

        public bool Seeded { get; set; } = false;

        public attractSeed Seed(SeedGenerator rnd)
        {
            Address = rnd.StreetAddress();
            
        }
    }
}