namespace ProyectoColegio.Models
{
    public class Usuario
    {
        private int identificacion {  get; set; }
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
        private String estadoUsuario { get; set; }
        private TipoDocumento tpDocumento { get; set; }
        private TipoSangre tipoSangre { get; set; }
        private Discapacidad discapacidad { get; set; }
        private Sisben sisben { get; set;}
        private Rol rol { get; set; }
        private Estrato estrato { get; set; }
        private EPS eps { get; set; }
        private Genero genero { get; set; }

        public int Identificacion
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

        public TipoDocumento TipoDocumento
        {
            get { return tpDocumento; }
            set { tpDocumento = value; }
        }

        public TipoSangre TipoSangre
        {
            get { return tipoSangre; }
            set { tipoSangre = value; }
        }

        public Discapacidad Discapacidad
        {
            get { return discapacidad; }
            set { discapacidad = value; }
        }

        public Sisben Sisben
        {
            get { return sisben; }
            set { sisben = value; }
        }

        public Rol Rol
        {
            get { return rol; }
            set { rol = value; }
        }

        public Estrato Estrato
        {
            get { return estrato; }
            set { estrato = value; }
        }

        public EPS EPS
        {
            get { return eps; }
            set { eps = value; }
        }

        public Genero Genero
        {
            get { return genero; }
            set { genero = value; }
        }

    }
}
