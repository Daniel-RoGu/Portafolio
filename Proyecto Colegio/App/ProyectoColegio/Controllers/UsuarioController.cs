using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly Contexto _contexto;

        public UsuarioController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public IActionResult RegistrarEstudiante()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RegistrarEstudiante(Estudiante estudiante)
        {
            return View();
        }


    }
}
