namespace ProyectoColegio.Models
{
    public class TipoNota
    {
        private List<string>? _tpNotas { get; set; }

        public List<string> TipoNotas
        {
            get { return _tpNotas; }
            set { _tpNotas = value; }
        }
    }
}
