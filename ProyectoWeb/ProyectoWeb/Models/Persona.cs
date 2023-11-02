namespace ProyectoWeb.Models
{
    
    public class Persona
    {
        public int idPersona { get; set; }
        public String? nombrePersona { get; set; }
        public string? apellidoPersona { get; set; }
        public int edadPersona { get; set; }
        public String? telefonoPersona { get; set; }
        public String? ubicacionPersona { get; set; }
        public String? correoPersona { get; set; }
        public int fk_idTipoDocumento { get; set; }
        public int idUsuario { get; set; }
        public string? nombreUsuario { get; set; }
        public string? contrasenaUsuario { get; set; }
        public string? estadoUsuario { get; set; }
        public int fk_idRol { get; set; }
        public int fk_idPersona { get; set; }

    }
}
