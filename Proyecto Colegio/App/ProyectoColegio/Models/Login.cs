using System.ComponentModel.DataAnnotations;

namespace ProyectoColegio.Models
{
    public class Login
    {
        [Required(ErrorMessage = "El nombre de usuario es obligatorio.")]
        private string UserName { get; set; }

        [Required(ErrorMessage = "La contraseña es obligatoria.")]
        [DataType(DataType.Password)]
        private string Password { get; set; }
    }
}

