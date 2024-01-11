namespace ProyectoColegio.Models
{
    public class TipoDocumento
    {
        private List<string>? tipoDocumento { get; set; }

        public List<string> getTipoDocumento()
        {
            return this.tipoDocumento;
        }

        public void setTipoDocumento(List<string> datos)
        {
            this.tipoDocumento = datos;
        }
    }
}
