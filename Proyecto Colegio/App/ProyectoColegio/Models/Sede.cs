namespace ProyectoColegio.Models
{
    public class Sede
    {
        private List<string>? _Sede { get; set; }

        public List<string> Sedes
        {
            get { return _Sede; }
            set { _Sede = value; }
        }

    }
}
