using Seido.Utilities.SeedGenerator;

namespace Models
{
    public enum FruitType { Apple, Banana, Orange, Pear, Peach }

    public class Fruit : ISeed<Fruit> , IEquatable<Fruit>
    {
        public int FruitId { get; set; }
        public FruitType Type { get; set; }
        public double Weight { get; set; }
        public bool Seeded { get; set; } = false;

        public bool Equals(Fruit other) => (other != null) ? (Type) == (other.Type) : false;
        public override int GetHashCode()
        {
            return (Type).GetHashCode();
        }
        



        public Fruit Seed(SeedGenerator sg)
        {
            Type = sg.FromEnum<FruitType>();
            Weight = sg.Next(1, 10);

            return this;
        }
    }
}
