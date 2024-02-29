using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class DocenteController : Controller
    {
        private readonly Contexto _contexto;
        //ManejoProcedimientos manejoProcedimientos = new ManejoProcedimientos();
        ConsultasValidacionesBD consultasValidacionesBD = new ConsultasValidacionesBD();
        VariablesGlobales variablesGlobales = new VariablesGlobales();
        ConsultasGlobales consultasGlobales = new ConsultasGlobales();

        public DocenteController(Contexto contexto)
        {
            _contexto = contexto;
        }

        //[HttpPost]
        public IActionResult Principal()
        {
            //trae los datos del usuario logeado
            var identificacion = TempData["identificacion"];
            ViewBag.idetificacionUs = identificacion;
            var rol = TempData["rol"];
            ViewBag.rol = rol;

            ViewBag.ListaEstudiante = consultasGlobales.mostrarCsv(_contexto.Conexion, null, null);

            var sede = TempData["sede"];
            var grupo = TempData["grupo"];
            
            if (sede != null && grupo != null)
            {
                ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), Convert.ToString(grupo));
                Console.WriteLine(grupo);
            }            

            //muestra info de asignaturas y grupos por grado desde bd
            ViewBag.Asignaturas = variablesGlobales.Asignaturas(_contexto.Conexion);
            ViewBag.GruposGrado = variablesGlobales.GruposGrado(_contexto.Conexion);

            return View();
        }

        [HttpPost]
        public IActionResult Principal(string Grupo)
        {
            return RedirectToAction("Principal", "Docente");
        }

        [HttpPost]
        public IActionResult obtenerGrupoSeleccionado(string Grupos)
        {
            string identificacion = DatosCompartidos.MiDato;
            string Sede = ObtenerSedeDocente(identificacion);

            if (!string.IsNullOrEmpty(Grupos) && !string.IsNullOrEmpty(Sede))
            {
                //ViewBag.grupo = grupoSeleccionado;
                TempData["grupo"] = Grupos;
                TempData["sede"] = Sede;
            }

            return RedirectToAction("Principal", "Docente");
        }

        public string ObtenerSedeDocente(string identificacion)
        {
            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                // Definir aqui atributos y tipos esperados
                { "Sede", typeof(string) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "obtenerSedeDocente";
            string nombreParametro = "identificacion";

            // Llamar al método
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificacion, numeroAtributos, Conexion);
            
            return Convert.ToString(resultados);
        }
    }
}
