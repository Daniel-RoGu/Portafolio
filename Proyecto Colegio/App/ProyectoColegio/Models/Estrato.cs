namespace ProyectoColegio.Models
{
    public class Estrato
    {
        private List<string>? Estratos { get; set; }

        public List<string> getEstratos()
        {
            return this.Estratos;
        }

        public void setEstratos(List<string> datos)
        {
            this.Estratos = datos;
        }
    }
}
