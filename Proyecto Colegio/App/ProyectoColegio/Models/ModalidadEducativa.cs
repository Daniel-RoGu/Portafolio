namespace ProyectoColegio.Models
{
    public class ModalidadEducativa
    {
        private List<string>? Modalidad { get; set; }

        public List<string> getModalidad()
        {
            return this.Modalidad;
        }

        public void setModalidad(List<string> datos)
        {
            this.Modalidad = datos;
        }
    }
}
