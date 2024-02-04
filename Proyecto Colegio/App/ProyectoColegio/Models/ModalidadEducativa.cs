namespace ProyectoColegio.Models
{
    public class ModalidadEducativa
    {
        private List<string> _modalidad { get; set; }

        public List<string> Modalidad
        {
            get { return _modalidad; }
            set { _modalidad = value; }
        }
       
    }
}
