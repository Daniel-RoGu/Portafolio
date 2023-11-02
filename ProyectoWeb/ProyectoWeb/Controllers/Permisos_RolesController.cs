using Microsoft.AspNetCore.Mvc;
using ProyectoWeb.Data;

namespace ProyectoWeb.Controllers
{
    public class Permisos_RolesController : Controller
    {
        private readonly Contexto _contexto;

        public Permisos_RolesController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public IActionResult Index()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            return View();
        }
    }
}
