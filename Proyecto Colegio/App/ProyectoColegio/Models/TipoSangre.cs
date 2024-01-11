namespace ProyectoColegio.Models
{
    public class TipoSangre
    {
        private List<string>? tipoSangre { get; set; }

        public List<string> getTipoSangre()
        {
            return this.tipoSangre;
        }

        public void setTipoSangre(List<string> datos)
        {
            this.tipoSangre = datos;
        }
    }
}
