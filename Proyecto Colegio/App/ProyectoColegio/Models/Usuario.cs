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
    }
}
