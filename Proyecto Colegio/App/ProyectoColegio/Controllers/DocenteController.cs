using DocumentFormat.OpenXml.Spreadsheet;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Office.Interop.Excel;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using System.Globalization;
using System.Web.Helpers;
using static IronPython.Modules._ast;
using static iText.Layout.Borders.Border;
using System.Linq;

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


        public ActionResult HorarioDocente() { return View(); }

        public List<string> JornadaLista(string jornadaSelect)
        {
            List<string> rangoHorario = new List<string>();

            if (jornadaSelect != null)
            {
                if (jornadaSelect == "AM")
                {
                    rangoHorario = new List<string> { "06:00-07:00", "07:00-08:00", "08:00-09:00", "09:00-10:00", "10:00-11:00", "11:00-12:00" };
                }
                else if (jornadaSelect == "PM")
                {
                    rangoHorario = new List<string> { "12:00-01:00", "01:00-02:00", "02:00-03:00", "03:00-04:00", "04:00-05:00", "05:00-06:00" };
                }
                else if(jornadaSelect == "completa")
                {
                    rangoHorario = new List<string> { "06:00-07:00", "07:00-08:00", "08:00-09:00", "09:00-10:00", "10:00-11:00", "11:00-12:00", "12:00-01:00", "01:00-02:00", "02:00-03:00", "03:00-04:00", "04:00-05:00", "05:00-06:00" };
                }
            }

            return rangoHorario;
        }
        
        public JsonResult HorarioDocenteH()
        {
            List<string> rangos = JornadaLista("completa");
            List<string> lisdias = new List<string> { "Lunes", "Martes", "Miercoles", "Jueves", "Viernes" };
            List<Clase> clases = new List<Clase>();

            foreach (string rango in rangos)
            {
                List<Dia> dias = new List<Dia>();

                foreach (string dia in lisdias)
                {
                    var resultadoBd = variablesGlobales.InfoDetalleHorarioDocente(Convert.ToUInt32(DatosCompartidos.MiDato), DatosCompartidos.SedeUsuario, rango, dia, _contexto.Conexion);
                    
                    Dia diasemana = new Dia
                    {
                        diaSemana = dia,
                        detalleH = new Detalle()
                    };

                    if (resultadoBd.FirstOrDefault() != null)
                    {
                        foreach (List<Object> item in resultadoBd)
                        {
                            diasemana.detalleH.MateriaHorario = "Asignatura: " + Convert.ToString(item[3]);
                            diasemana.detalleH.DocenteHorario = "Detalle:" + Convert.ToString(item[2]); // "grado: 6  grupo: 601"
                        }
                    }

                    else
                    {
                        diasemana.detalleH.MateriaHorario = "";
                        diasemana.detalleH.DocenteHorario = "";
                    }

                    dias.Add(diasemana);
                }

                clases.Add(new Clase
                {
                    rango = rango,
                    dias = dias
                });
            }

            return Json(clases);
        }

        public JsonResult ListarDocenteAsignaturas(string grado, string grupo)
        {
            var DocentesAsignatura = variablesGlobales.GradosGruposAsignaturasDocentes(DatosCompartidos.SedeUsuario, grado, grupo, _contexto.Conexion);
            List<object> docentes = new List<object>();
            List<object> docente = new List<object>();
            long documentoDocente = Convert.ToInt32(DatosCompartidos.MiDato);

            foreach (var item in DocentesAsignatura)
            {
                docentes.Add(item);
            }

            foreach (List<object> item in docentes)
            {
                if (Convert.ToInt32(item[2]) == documentoDocente)
                {
                    docente.Add(item);
                }
            }

            if (docente.Count > 0)
            {
                return Json(docente);
            }

            return Json(docentes);
        }
       
        public JsonResult ListarEstudiantesSedeGrupo(string grado, string grupo, string identificacion)
        {
            List<object> estudiantes = new List<object>();
            List<Usuario> usuarios = new List<Usuario>();
            Usuario usuario = new Usuario();


            if (DatosCompartidos.SedeUsuario != null)
            {

                if (grado != "null")
                {
                    estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(DatosCompartidos.SedeUsuario), null, grado);
                }
                else if (grupo != "null")
                {
                    estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(DatosCompartidos.SedeUsuario), Convert.ToString(grupo), null);
                }
                else
                {
                    estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(DatosCompartidos.SedeUsuario), null, null);
                }

            }
            else
            {
                estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, null, null, null);
            }

            //organiza los resultados
            foreach (List<string> item in estudiantes)
            {
                usuario = new Usuario();
                usuario.Identificacion = (Convert.ToInt64(item[0]));
                usuario.NombreUsuario = Convert.ToString(item[1]) + ' ' + Convert.ToString(item[2]) + ' ' + Convert.ToString(item[3]) + ' ' + Convert.ToString(item[4]);
                usuario.SegundoNombreUsuario = Convert.ToString(item[2]);
                usuario.ApellidoUsuario = Convert.ToString(item[3]);
                usuario.SegundoApellidoUsuario = Convert.ToString(item[4]);
                usuario.Edad = Convert.ToInt16(item[5]);
                usuario.TelefonoCelular = Convert.ToString(item[6]);
                usuario.TelefonoFijo = Convert.ToString(item[7]);
                usuario.Correo = Convert.ToString(item[8]);
                usuario.Direccion = Convert.ToString(item[9]);
                usuario.Barrio = Convert.ToString(item[10]);
                usuario.FechaNacimiento = Convert.ToString(item[11]);
                usuario.TipoSangre = Convert.ToString(item[12]);
                usuario.TipoDocumento = Convert.ToString(item[13]);
                usuario.Discapacidad = Convert.ToString(item[14]);
                usuario.Sisben = Convert.ToString(item[15]);
                usuario.Genero = Convert.ToString(item[16]);
                usuario.EPS = Convert.ToString(item[17]);
                usuario.Estrato = Convert.ToString(item[18]);
                usuario.codigoEstudiante = Convert.ToString(item[19]);
                usuario.Grado = Convert.ToString(item[20]);
                usuario.Grupo = Convert.ToString(item[21]);
                usuarios.Add(usuario);

                if (identificacion != "null" && identificacion == item[0])
                {
                    usuarios = new List<Usuario>();
                    usuarios.Add(usuario);
                    Console.WriteLine(usuario);
                    return Json(usuarios);
                }
            }

            return Json(usuarios);
        }

        
        public JsonResult ListarInformeNotasEstudiantesSedeGrupo(string GrupoRef, string asignaturaRef, string periodoRef)
        {
            var resultados = new List<object>();
            EstudianteNotas estudiante = new EstudianteNotas();
            List<EstudianteNotas> estudiantes = new List<EstudianteNotas>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                    { "GrupoRef", GrupoRef },
                    { "asignaturaRef", asignaturaRef },
                    { "periodoRef", periodoRef },
            };

            int parametrosRecividos = 4;
            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerNotasInasistenciasEstudiantesTodosXGrupo2", parametros, parametrosRecividos, _contexto.Conexion);

            foreach (List<object> item in resultados)
            {
                estudiante.nombreCompleto = Convert.ToString(item[0]);
                estudiante.identificacion = Convert.ToInt32(item[1]);
                estudiante.nota = Convert.ToSingle(item[3]);
                estudiante.fallas = Convert.ToInt16(item[2]);
                estudiantes.Add(estudiante);
                estudiante = new EstudianteNotas();
            }

            return Json(estudiantes);
        }
        //https://localhost:7227/Docente/ListarEstudiantesTodosXGrupo/?GrupoRef=601&asignaturaRef=Matem%C3%A1ticas&periodoRef=Primer%20Periodo
        public JsonResult ListarEstudiantesTodosXGrupo(string GrupoRef, string asignaturaRef, string periodoRef)
        {
            var resultados = new List<object>();
            List<string> estudiantes = new List<string>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                    { "GrupoRef", GrupoRef },
                    { "asignaturaRef", asignaturaRef },
                    { "periodoRef", periodoRef },
            };

            int parametrosRecividos = 1;
            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerEstudiantesTodosXGrupo", parametros, parametrosRecividos, _contexto.Conexion);

            foreach (var item in resultados)
            {
                estudiantes.Add(Convert.ToString(item));
                DatosCompartidos.ListaEstudiantesXGrupo.Add(Convert.ToString(item));
            }

            return Json(estudiantes);
        }

        public string ListaEstudiantesXGrupoListado(string GrupoRef, string asignaturaRef, string periodoRef)
        {
            var resultados = new List<object>();
            List<string> estudiantes = new List<string>();
            string bandera = ""; 

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                    { "GrupoRef", GrupoRef },
                    { "asignaturaRef", asignaturaRef },
                    { "periodoRef", periodoRef },
            };

            int parametrosRecividos = 1;
            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerEstudiantesTodosXGrupo", parametros, parametrosRecividos, _contexto.Conexion);
            DatosCompartidos.ListaEstudiantesXGrupo = new List<string>();
            if (resultados.Count > 0) {
                foreach (var item in resultados)
                {                    
                    estudiantes.Add(Convert.ToString(item));
                    DatosCompartidos.ListaEstudiantesXGrupo.Add(Convert.ToString(item));
                }
                bandera = "1";  
            }
            else {
            
                 bandera= "0";
            }
           

            return bandera;
        }

        //[HttpPost]
        public IActionResult Index() { 

            return View();
        
        
        }


        public string GuardarDocente(DocenteInfo docente) {


            return "";  
        
        }       

        public IActionResult Principal()
        {
            //trae los datos del usuario logeado
            var identificacion = TempData["identificacion"];
            ViewBag.idetificacionUs = identificacion;
            var rol = TempData["rol"];
            ViewBag.rol = rol;
            var habilitarCargueNotaFinal = TempData["habilitarCargueNotaFinal"];
            ViewBag.HabilitacionNotaFinal = habilitarCargueNotaFinal;

            var sede = TempData["sede"];
            var grupo = TempData["grupo"];

            if (sede != null && grupo != null)
            {
                ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), Convert.ToString(grupo), null);
                ViewBag.GrupoSeleccionado = grupo;
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
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificacion, numeroAtributos, _contexto.Conexion);
            string sede = "";
            foreach (var item in resultados)
            {
                sede = Convert.ToString(item);
            }
            
            return sede;
        }

        //https://localhost:7227/Docente/GestionNotasAsistencia/?grupoRef=601&asignaturaRef=Matemáticas&periodoRef=Primer Periodo        
        public JsonResult GestionNotasAsistencia(string grupoRef, string asignaturaRef, string periodoRef)
        {
            List<object> estudiantes = ObtenerRegistroNotasEstudiantes(grupoRef, asignaturaRef, periodoRef);
            List<EstudianteEvaluado> estudiantesEvaluados = new List<EstudianteEvaluado>();
            List<EstudianteEvaluado> estudiantesOrdenados = new List<EstudianteEvaluado>();
            int count = 0;

            foreach (List<object> item in estudiantes)
            {
                if (Convert.ToString(item[2]) != "Sin registro")
                {
                    string dato = Convert.ToString(item[2]);
                    decimal numero = decimal.Parse(dato, CultureInfo.InvariantCulture);
                    count++;
                    EstudianteEvaluado estudiante = new EstudianteEvaluado();
                    estudiante.Numero = count;
                    estudiante.Identificador = Convert.ToInt32(item[1]);
                    estudiante.Nota = Convert.ToSingle(numero);
                    estudiantesEvaluados.Add(estudiante);
                }
            }

            // Ordenar la lista de estudiantes por la nota de mayor a menor
            estudiantesEvaluados = estudiantesEvaluados.OrderByDescending(e => e.Nota).ToList();
            count = 0;

            foreach (EstudianteEvaluado item in estudiantesEvaluados)
            {                  
                    count++;
                    EstudianteEvaluado estudiante = new EstudianteEvaluado();
                    estudiante.Numero = count;
                    estudiante.Identificador = item.Identificador;
                    estudiante.Nota = item.Nota;
                    estudiantesOrdenados.Add(estudiante);
            }

            return Json(estudiantesOrdenados);
        }

        public List<EstudianteEvaluado> GestionNotasAsistenciaRetorno(string grupoRef, string asignaturaRef, string periodoRef)
        {
            List<object> estudiantes = ObtenerRegistroNotasEstudiantes(grupoRef, asignaturaRef, periodoRef);
            List<EstudianteEvaluado> estudiantesEvaluados = new List<EstudianteEvaluado>();
            List<EstudianteEvaluado> estudiantesOrdenados = new List<EstudianteEvaluado>();
            int count = 0;

            foreach (List<object> item in estudiantes)
            {
                if (Convert.ToString(item[2]) != "Sin registro")
                {
                    string dato = Convert.ToString(item[2]);
                    decimal numero = decimal.Parse(dato, CultureInfo.InvariantCulture);
                    count++;
                    EstudianteEvaluado estudiante = new EstudianteEvaluado();
                    estudiante.Numero = count;
                    estudiante.Identificador = Convert.ToInt32(item[1]);
                    estudiante.Nota = Convert.ToSingle(numero);
                    estudiantesEvaluados.Add(estudiante);
                }
            }

            // Ordenar la lista de estudiantes por la nota de mayor a menor
            estudiantesEvaluados = estudiantesEvaluados.OrderByDescending(e => e.Nota).ToList();
            count = 0;

            foreach (EstudianteEvaluado item in estudiantesEvaluados)
            {
                count++;
                EstudianteEvaluado estudiante = new EstudianteEvaluado();
                estudiante.Numero = count;
                estudiante.Identificador = item.Identificador;
                estudiante.Nota = item.Nota;
                estudiantesOrdenados.Add(estudiante);
            }

            return estudiantesOrdenados;
        }

        public string registrarNotaAsistenciaEstudiante( string grupo, string asignatura, int idEstudiante, string periodoNota, string nota, int Fallas)
        {
            int retorno = 0;
            
            if (!string.IsNullOrEmpty(asignatura) && idEstudiante != 0 && !string.IsNullOrEmpty(periodoNota))
            {                

                try
                {

                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "asignatura", asignatura },
                        { "docEstudiante", idEstudiante },
                        { "PeriodoNota", periodoNota },
                        { "nota", nota },
                        { "nFallasRef", Fallas },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarDocenteNotasAsistenciasPeriodo", parametros, _contexto.Conexion);
                    retorno = 1;

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }

                foreach (EstudianteEvaluado item in GestionNotasAsistenciaRetorno(grupo, asignatura, periodoNota))
                {
                    int nuevoPuesto = Convert.ToInt16(item.Numero);
                    long identificadorEstudiante = Convert.ToInt32(item.Identificador);
                    actualizarPuestoEstudiante(identificadorEstudiante, nuevoPuesto, asignatura, periodoNota);
                }

            }           

            return "" + retorno;
        }

        public List<Object> ObtenerRegistroNotasEstudiantes(string grupoRef, string asignaturaRef, string periodoRef)
        {
            List<object> estudiantes = new List<object>();
            object estudiante = new object();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "grupoRef", grupoRef },
                 { "asignaturaRef", asignaturaRef },
                 { "periodoRef", periodoRef },                 
            };

            int grupoAtributosEsperadosDocente = 8;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerEstudiantesNotasXGrupo", parametros, grupoAtributosEsperadosDocente, _contexto.Conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                estudiante = item;
                estudiantes.Add(estudiante);
                estudiante = new List<object>();
            }
         

            return estudiantes;
        }

        public void actualizarPuestoEstudiante(long idEstudianteRef , int puestoRef, string asignatura, string periodoNota)
        {
            if (idEstudianteRef != 0 && puestoRef != 0)
            {
                try
                {

                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "idEstudianteRef", idEstudianteRef },
                        { "puestoRef", puestoRef },
                        { "asignaturaRef", asignatura },
                        { "periodoRef", periodoNota },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("ActualizarPosicionEstudiantes", parametros, _contexto.Conexion);


                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }
        }
        
        public string actualizarConvivencia(int idEstudiante, string periodo, float nota, string grupoRef)
        {
            string retorno = "0";

            if (idEstudiante != 0 && nota != 0 && !string.IsNullOrEmpty(periodo) && !string.IsNullOrEmpty(grupoRef))
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "idEstudiante", idEstudiante },
                        { "periodo", periodo },
                        { "nota", nota },
                        { "docDocente", Convert.ToInt32(DatosCompartidos.MiDato) },
                        { "grupoRef", grupoRef },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("ActualizarNotaConvivencia", parametros, _contexto.Conexion);
                    retorno = "1";

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
                
            }
            return retorno;
        }

        public List<string> ObtenerPeriodosHabilitados()
        {
            List<string> periodo = new List<string>();

            Dictionary<string, Type> atributosPeriodo = new Dictionary<string, Type>
            {
                { "Periodo", typeof(string) },
            };

            List<Object> resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerPeriodoHabilitado", atributosPeriodo, _contexto.Conexion);

            foreach (var item in resultados)
            {
                periodo.Add(Convert.ToString(item));
            }

            return periodo;
            
        }


        public JsonResult ObtenerGrupoDelTitular()
        {
            List<Object> grupos = new List<Object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "idDocenteRef", Convert.ToInt32(DatosCompartidos.MiDato) },
            };

            int grupoAtributosEsperadosGrupo = 3;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerGrupoDelTitular", parametros, grupoAtributosEsperadosGrupo, _contexto.Conexion);

            foreach (var item in resultados)
            {
                grupos.Add(item);
            }

            return Json(grupos);
        }


        public ActionResult ConvivenciaEstudiantesTitular() { return View(); }  


    }

    public class EstudianteEvaluado
    {
        public int Numero { get; set; }
        public long Identificador { get; set; }
        public float Nota { get; set; }
    }
}
