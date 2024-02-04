namespace ProyectoColegio.Models
{
    public class Estrato
    {
        private List<string>? _estratos { get; set; }

        public List<string> Estratos
        {
            get { return _estratos; }
            set { _estratos = value; }
        }

    }
}
