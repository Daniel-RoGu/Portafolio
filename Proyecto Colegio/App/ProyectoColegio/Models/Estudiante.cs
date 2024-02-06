namespace ProyectoColegio.Models
{
    public class Estudiante
    {
        private int identificacionAcudiente {  get; set; }
        private string nombreAcudiente {  get; set; }
        private string apellidoAcudiente {  get; set; }
        private string generoAcudiente {  get; set; }
        private string correoAcudiente {  get; set; }
        private string celularAcudiente {  get; set; }
        private string parentescoAcudiente {  get; set; }
        private string tipoResponsabilidadEconomicaAcudiente {  get; set; }
        private string codigoEstudiante {  get; set; }
        private string ciudadNacimiento {  get; set; }
        private string ciudadResidencia {  get; set; }
        private string ciudadExpedicionDocumento { get; set; }
        private string paisOrigen { get; set; }
        private string asistenciaAcademicaEspecial { get; set; }
        private string desplazadoEstado { get; set; }
        private int identificacion { get; set; }
        private Usuario usuario { get; set; }

        public int IdentificacionAcudiente
        {
            get { return identificacionAcudiente; }
            set { identificacionAcudiente = value; }
        }

        public String NombreAcudiente
        {
            get { return nombreAcudiente; }
            set { nombreAcudiente = value; }
        }

        public String ApellidoAcudiente
        {
            get { return apellidoAcudiente; }
            set { apellidoAcudiente = value; }
        } 
        
        public String GeneroAcudiente
        {
            get { return generoAcudiente; }
            set { generoAcudiente = value; }
        }

        public String CorreoAcudiente
        {
            get { return correoAcudiente; }
            set { correoAcudiente = value; }
        }

        public String CelularAcudiente
        {
            get { return celularAcudiente; }
            set { celularAcudiente = value; }
        }

        public String ParentescoAcudiente
        {
            get { return parentescoAcudiente; }
            set { parentescoAcudiente = value; }
        }

        public String TipoResponsabilidadEconomicaAcudiente
        {
            get { return tipoResponsabilidadEconomicaAcudiente; }
            set { tipoResponsabilidadEconomicaAcudiente = value; }
        }

        public String CodigoEstudiante
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

        public int Identificacion
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
