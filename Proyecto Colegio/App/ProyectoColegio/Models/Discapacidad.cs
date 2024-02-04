namespace ProyectoColegio.Models
{
    public class Discapacidad
    {
        private List<string>? _discapacidades { get; set; }

        public List<string> Discapacidades
        {
            get { return _discapacidades; }
            set { _discapacidades = value; }
        }

    }
}
