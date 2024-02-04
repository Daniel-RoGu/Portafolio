namespace ProyectoColegio.Models
{
    public class Sede
    {
        private String _nombreSede { set; get; }
        private String _esInternado { set; get;}
        private String _estadoSede { set; get; }
        private ModalidadEducativa _modalidadEducativa { set; get; }

        public String NombreSede
        {
            get { return _nombreSede; }
            set { _nombreSede = value; }
        }

         public String EsInternado
        {
            get { return _esInternado; }
            set { _esInternado = value; }
        }

         public String EstadoSede
        {
            get { return _estadoSede; }
            set { _estadoSede = value; }
        }

         public ModalidadEducativa ModalidadEducativa
        {
            get { return _modalidadEducativa; }
            set { _modalidadEducativa = value; }
        }

    }
}
