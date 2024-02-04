namespace ProyectoColegio.Models
{
    public class Docente
    {
        private String _estadoDocente { set; get; }
        private int _horasSemanalesLaborable { set; get; }
        private Usuario _usuario { set; get; }
        private Sede _sede { set; get; }

        public String EstadoDocente
        {
            get { return _estadoDocente; }
            set { _estadoDocente = value; }
        }

        public int HorasSemanalesLaborales
        {
            get { return _horasSemanalesLaborable; }
            set { _horasSemanalesLaborable = value; }
        }

        public Usuario Usuario
        {
            get { return _usuario; }
            set { _usuario = value; }
        }

        public Sede Sede
        {
            get { return _sede; }
            set { _sede = value; }
        }

    }
}
