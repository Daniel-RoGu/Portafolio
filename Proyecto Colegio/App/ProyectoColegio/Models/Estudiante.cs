namespace ProyectoColegio.Models
{
    public class Estudiante
    {
        private long codigoEstudiante {  get; set; }
        private string ciudadNacimiento {  get; set; }
        private string ciudadResidencia {  get; set; }
        private string ciudadExpedicionDocumento { get; set; }
        private string paisOrigen { get; set; }
        private string asistenciaAcademicaEspecial { get; set; }
        private string desplazadoEstado { get; set; }
        private long identificacion { get; set; }
        private Usuario usuario { get; set; }

        // Constructor
        public Estudiante()
        {
            Usuario = new Usuario(); 
        }

        public long CodigoEstudiante
        {
            get { return codigoEstudiante; }
            set { codigoEstudiante = value; }
        }

        public String CiudadNacimiento
        {
            get { return ciudadNacimiento; }
            set { ciudadNacimiento = value; }
        }
        public String CiudadResidencia
        {
            get { return ciudadResidencia; }
            set { ciudadResidencia = value; }
        }

        public String CiudadExpedicionDocumento
        {
            get { return ciudadExpedicionDocumento; }
            set { ciudadExpedicionDocumento = value; }
        }

        public String PaisOrigen
        {
            get { return paisOrigen; }
            set { paisOrigen = value; }
        }

        public String AsistenciaAcademicaEspecial
        {
            get { return asistenciaAcademicaEspecial; }
            set { asistenciaAcademicaEspecial = value; }
        }

        public String DesplazadoEstado
        {
            get { return desplazadoEstado; }
            set { desplazadoEstado = value; }
        }

        public long Identificacion
        {
            get { return identificacion; }
            set { identificacion = value; }
        }

        public Usuario Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

    }
}
