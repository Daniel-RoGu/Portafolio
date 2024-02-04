using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Models; // Asegúrate de importar el espacio de nombres del modelo

namespace ProyectoColegio.Controllers
{
    public class LoginController : Controller
    {
        
        public IActionResult Inicio()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Inicio(Login model)
        {
            if (ModelState.IsValid)
            {
                // Aquí puedes agregar la lógica para verificar el nombre de usuario y la contraseña
                // Puedes usar Entity Framework para acceder a tu base de datos y realizar la autenticación

                // Ejemplo básico:
                if (model.UserName == "usuario" && model.Password == "contraseña")
                {
                    // Autenticación exitosa, puedes redirigir a otra acción o página
                    return RedirectToAction("Inicio", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Nombre de usuario o contraseña incorrectos");
                }
            }

            // Si llegamos aquí, algo salió mal, vuelve a mostrar la vista con los errores
            return View(model);
        }
    }
}
