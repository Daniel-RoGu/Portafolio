using Microsoft.EntityFrameworkCore;
using WebApiUser.Models;

namespace WebApiUser.Context
{                           //: DbContext  - significa que esta heredando de la clase
    public class AppDBContext: DbContext 
    {
        public AppDBContext(DbContextOptions<AppDBContext> options): base(options)
        {
            
        }

        public DbSet<Person> Persons { get; set; }
    }
}
