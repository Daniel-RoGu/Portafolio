namespace ProyectoWeb.Models
{
    public class Usuario
    {
        public int idUsuario { get; set; }
        public string nombreUsuario { get; set; }
        public string contrasenaUsuario { get; set; }
        public string estadoUsuario { get; set; }
        public Roles? fk_idRol { get; set; }
        public Persona? fk_idPersona { get; set; }
    }

}
