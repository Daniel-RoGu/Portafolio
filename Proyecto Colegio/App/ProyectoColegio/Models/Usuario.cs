namespace ProyectoColegio.Models
{
    public class Usuario
    {
        private long identificacion { get; set; }
        private String nombreUsuario { get; set; }
        private String? segundoNombreUsuario { get; set; }
        private String apellidoUsuario { get; set; }
        private String? segundoApellidoUsuario { get; set; }
        private int edad { get; set; }
        private String? telefonoCelular { get; set; }
        private String? telefonoFijo { get; set; }
        private String? correo { get; set; }
        private String? direccion { get; set; }
        private String? barrio { get; set; }
        private String fechaNacimiento { get; set; }
        private String? estadoUsuario { get; set; }
        private String? tpDocumento { get; set; }
        private String? tipoSangre { get; set; }
        private String? discapacidad { get; set; }
        private String? sisben { get; set; }
        private String? rol { get; set; }
        private String? estrato { get; set; }
        private String? eps { get; set; }
        private String? genero { get; set; }
        public String? codigoEstudiante { get; set; }
        private String? grado { get; set; }
        private String? grupo { get; set; }
        public String? esInternado { get; set; }
        public String? esDesplazado { get; set; }
        public String? SedeEstudiante { get; set; }
        public String? CiudadNacimiento { get; set; }
        public String? CiudadExpedicionDocumento { get; set; }

        public long Identificacion
        {
            get { return identificacion; }
            set { identificacion = value; }
        }

        public string NombreUsuario
        {
            get { return nombreUsuario; }
            set { nombreUsuario = value; }
        }

        public string? SegundoNombreUsuario
        {
            get { return segundoNombreUsuario; }
            set { segundoNombreUsuario = value; }
        }

        public string ApellidoUsuario
        {
            get { return apellidoUsuario; }
            set { apellidoUsuario = value; }
        }

        public string? SegundoApellidoUsuario
        {
            get { return segundoApellidoUsuario; }
            set { segundoApellidoUsuario = value; }
        }

        public int Edad
        {
            get { return edad; }
            set { edad = value; }
        }

        public string? TelefonoCelular
        {
            get { return telefonoCelular; }
            set { telefonoCelular = value; }
        }

        public string? TelefonoFijo
        {
            get { return telefonoFijo; }
            set { telefonoFijo = value; }
        }

        public string? Correo
        {
            get { return correo; }
            set { correo = value; }
        }

        public string? Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        public string? Barrio
        {
            get { return barrio; }
            set { barrio = value; }
        }

        public string FechaNacimiento
        {
            get { return fechaNacimiento; }
            set { fechaNacimiento = value; }
        }

        public string EstadoUsuario
        {
            get { return estadoUsuario; }
            set { estadoUsuario = value; }
        }

        public String? TipoDocumento
        {
            get { return tpDocumento; }
            set { tpDocumento = value; }
        }

        public String? TipoSangre
        {
            get { return tipoSangre; }
            set { tipoSangre = value; }
        }

        public String? Discapacidad
        {
            get { return discapacidad; }
            set { discapacidad = value; }
        }

        public String? Sisben
        {
            get { return sisben; }
            set { sisben = value; }
        }

        public String? Rol
        {
            get { return rol; }
            set { rol = value; }
        }

        public String? Estrato
        {
            get { return estrato; }
            set { estrato = value; }
        }

        public String? EPS
        {
            get { return eps; }
            set { eps = value; }
        }

        public String? Genero
        {
            get { return genero; }
            set { genero = value; }
        }
        public String? Grado
        {
            get { return grado; }
            set { grado = value; }
        }
        public String? Grupo
        {
            get { return grupo; }
            set { grupo = value; }
        }

    }
}
