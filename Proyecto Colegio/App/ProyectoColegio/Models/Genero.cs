namespace ProyectoColegio.Models
{
    public class Genero
    {
        private List<string>? Generos { get; set; }

        public List<string> getGeneros()
        {
            return this.Generos;
        }

        public void setGeneros(List<string> datos)
        {
            this.Generos = datos;
        }
    }
}
