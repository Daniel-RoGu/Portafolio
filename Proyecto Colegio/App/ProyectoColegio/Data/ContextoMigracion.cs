using Microsoft.EntityFrameworkCore;
using ProyectoColegio.Models;

namespace ProyectoColegio.Data
{
    public class ContextoMigracion : DbContext
    {
        // Declarar DbSet para cada tabla       
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Rol> Rol { get; set; }
        public DbSet<Login> UsuarioLogin { get; set; }

        public ContextoMigracion(DbContextOptions<ContextoMigracion> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Aquí puedes agregar configuraciones adicionales para tus entidades
            base.OnModelCreating(modelBuilder);
        }
    }
}
