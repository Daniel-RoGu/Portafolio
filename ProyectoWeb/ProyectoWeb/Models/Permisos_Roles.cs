namespace ProyectoWeb.Models
{
    public class Permisos_Roles
    {
        public Permisos? fk_idPermisos { get; set; }

        public Roles? fk_idRol { get; set; }

        public String url { get; set; }
    }
}
