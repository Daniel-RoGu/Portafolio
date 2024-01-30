using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class FuncionarioController : Controller
    {
        Funcionario funcionario = new Funcionario();
        public IActionResult Index()
        {
            return View();
        }
    }
}
