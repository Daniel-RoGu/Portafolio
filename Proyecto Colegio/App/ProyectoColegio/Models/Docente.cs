namespace ProyectoColegio.Models
{
    public class Docente
    {
        private String? _estadoDocente { set; get; }
        public int _horasSemanalesLaborable { set; get; }
        public String? lugarNacimiento { set; get; }
        private String? _nomSede { set; get; }
        public long? identificacion { get; set; }
        public String? nombreUsuario { get; set; }
        public String? segundoNombreUsuario { get; set; }
        public String? apellidoUsuario { get; set; }
        public String? segundoApellidoUsuario { get; set; }
        public int? edad { get; set; }
        public String? telefonoCelular { get; set; }
        public String? telefonoFijo { get; set; }
        public String? correo { get; set; }
        public String? direccion { get; set; }
        public String? barrio { get; set; }
        public String fechaNacimiento { get; set; }
        public String? estadoUsuario { get; set; }
        public String? tpDocumento { get; set; }
        public String? tipoSangre { get; set; }
        public String? discapacidad { get; set; }
        public String? sisben { get; set; }
        public String? rol { get; set; }
        public String? estrato { get; set; }
        public String? eps { get; set; }
        public String? genero { get; set; }

        private Usuario? _usuario = new Usuario();


        public String EstadoDocente
        {
            get { return _estadoDocente; }
            set { _estadoDocente = value; }
        }

        public int HorasLabora
        {
            get { return _horasSemanalesLaborable; }
            set { _horasSemanalesLaborable = value; }
        }

        public String NombreSede
        {
            get { return _nomSede; }
            set { _nomSede = value; }
        }

        public Usuario Usuario
        {
            get { return _usuario; }
            set { _usuario = value; }
        }

    }
}
