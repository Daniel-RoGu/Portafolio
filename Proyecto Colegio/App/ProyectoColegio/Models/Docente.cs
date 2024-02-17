namespace ProyectoColegio.Models
{
    public class Docente
    {
        private String? _estadoDocente { set; get; }
        private int _horasSemanalesLaborable { set; get; }
        private String _nomSede { set; get; }

        private Usuario _usuario = new Usuario();


        public String EstadoDocente
        {
            get { return _estadoDocente; }
            set { _estadoDocente = value; }
        }

        public int HorasLabora
        {
            get { return _horasSemanalesLaborable; }
            set { _horasSemanalesLaborable = value; }
        }

        public String NombreSede
        {
            get { return _nomSede; }
            set { _nomSede = value; }
        }

        public Usuario Usuario
        {
            get { return _usuario; }
            set { _usuario = value; }
        }

    }
}
