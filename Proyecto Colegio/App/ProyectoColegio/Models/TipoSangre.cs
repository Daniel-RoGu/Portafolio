namespace ProyectoColegio.Models
{
    public class TipoSangre
    {
        private List<string>? _tipoSangre { get; set; }

        public List<string> TpSangre
        {
            get { return _tipoSangre; }
            set { _tipoSangre = value; }
        }
    }
}
