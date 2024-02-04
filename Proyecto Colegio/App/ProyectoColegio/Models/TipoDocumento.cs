namespace ProyectoColegio.Models
{
    public class TipoDocumento
    {
        private List<string> _tipoDocumento { get; set; }

        public List<string> TpDocumento
        {
            get { return _tipoDocumento; }
            set { _tipoDocumento = value; }
        }

    }
}
