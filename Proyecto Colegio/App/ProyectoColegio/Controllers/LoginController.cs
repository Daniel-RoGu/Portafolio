using DocumentFormat.OpenXml.Drawing;
using DocumentFormat.OpenXml.Wordprocessing;
using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models; // Asegúrate de importar el espacio de nombres del modelo

namespace ProyectoColegio.Controllers
{
    public class LoginController : Controller
    {
        private readonly Contexto _contexto;
        ConsultasValidacionesBD consultasValidacionesBD = new ConsultasValidacionesBD();
        VariablesGlobales variablesGlobales = new VariablesGlobales();

        public LoginController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public IActionResult Inicio()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Inicio(Login model)
        {

            if (model != null && model.UserName != "" && model.Password != "")
            {
                Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "idUsuario", model.UserName },
                        { "passUsuario", model.Password },
                     };

                bool existe = false;

                List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("existeUsuarioLogin", parametros, 1, _contexto.Conexion);

                foreach (Object obj in resultados)
                {
                    existe = Convert.ToBoolean(Convert.ToInt16(obj));
                }

                rotacionInfoUsuario(existe, model.Password);
                // En el primer controlador
                TempData["identificacion"] = model.Password;            

                if (existe)
                {
                    //Identificar el rol del usuario y redireccionar
                    return RedirectToAction("CargarCsv", "Funcionario");
                }
                else
                {
                    return View();
                }

            }

            // Si llegamos aquí, algo salió mal, vuelve a mostrar la vista con los errores
            Console.WriteLine("Datos del usuario incompletos");
            return View("Inicio", "Login");
        }

        public void rotacionInfoUsuario(bool estado, string identificacion)
        {
            ViewBag.estado = estado;
            TempData["estado"] = estado;
            //ViewBag.identificacion = identificacion;
        }

    }
}
