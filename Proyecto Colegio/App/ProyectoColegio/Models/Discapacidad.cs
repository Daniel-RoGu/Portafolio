namespace ProyectoColegio.Models
{
    public class Discapacidad
    {
        private List<string>? Discapacidades { get; set; }

        public List<string> getDiscapacidades()
        {
            return this.Discapacidades;
        }

        public void setDiscapacidades(List<string> datos)
        {
            this.Discapacidades = datos;
        }
    }
}
