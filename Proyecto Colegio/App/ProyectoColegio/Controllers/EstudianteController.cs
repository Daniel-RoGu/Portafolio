using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class EstudianteController : Controller
    {
        private readonly Contexto _contexto;
        ConsultasValidacionesBD consultasValidacionesBD = new ConsultasValidacionesBD();
        VariablesGlobales variablesGlobales = new VariablesGlobales();
        ConsultasGlobales consultasGlobales = new ConsultasGlobales();

        public EstudianteController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public IActionResult Index() { return View(); } // horario

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
                else if (jornadaSelect == "completa")
                {
                    rangoHorario = new List<string> { "06:00-07:00", "07:00-08:00", "08:00-09:00", "09:00-10:00", "10:00-11:00", "11:00-12:00", "12:00-01:00", "01:00-02:00", "02:00-03:00", "03:00-04:00", "04:00-05:00", "05:00-06:00" };
                }
            }

            return rangoHorario;
        }

        public JsonResult HorarioEstudianteH()
        {
            List<string> rangos = JornadaLista("completa");
            List<string> lisdias = new List<string> { "Lunes", "Martes", "Miercoles", "Jueves", "Viernes" };
            List<Clase> clases = new List<Clase>();

            foreach (string rango in rangos)
            {
                List<Dia> dias = new List<Dia>();

                foreach (string dia in lisdias)
                {
                    var resultadoBd = variablesGlobales.InfoDetalleHorarioEstudiante(rango, dia, _contexto.Conexion);

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
                            diasemana.detalleH.DocenteHorario = "Docente:" + Convert.ToString(item[0]); 
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

        public List<object> ListarEstudiantesNotasXGrupo(string asignaturaRef, string periodoRef)
        {
            var resultados = new List<object>();
            List<object> estudiantes = new List<object>();
            string grupo = DatosCompartidos.Grupo;

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                    { "GrupoRef", grupo },
                    { "asignaturaRef", asignaturaRef },
                    { "periodoRef", periodoRef },
            };

            int parametrosRecividos = 8;
            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerEstudiantesNotasXGrupo", parametros, parametrosRecividos, _contexto.Conexion);

            foreach (var item in resultados)
            {
                estudiantes.Add(item);
                //DatosCompartidos.ListaEstudiantesXGrupo.Add(Convert.ToString(item));
            }           

            return estudiantes;
        }

        public List<object> ListarEstudianteInfoAsignaturas(string periodoRef)
        {
            var resultados = new List<object>();
            List<object> estudiantes = new List<object>();
            string grupo = DatosCompartidos.Grupo;
            long identificacion = Convert.ToInt32(DatosCompartidos.MiDato);

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                    { "idEstudianteRef", identificacion },
                    { "GrupoRef", grupo },
                    { "periodoRef", periodoRef },
            };

            int parametrosRecividos = 8;
            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerEstudiantesNotasXGrupo2", parametros, parametrosRecividos, _contexto.Conexion);

            foreach (var item in resultados)
            {
                estudiantes.Add(item);
                //DatosCompartidos.ListaEstudiantesXGrupo.Add(Convert.ToString(item));
            }

            return estudiantes;
        }

        public List<object> ObtenerMateriasXEstudianteInfoParcial()
        {
            var resultados = new List<object>();
            List<object> estudiantes = new List<object>();
            string grupo = DatosCompartidos.Grupo;
            long identificacion = Convert.ToInt32(DatosCompartidos.MiDato);

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                    { "DocEstudianteRef", identificacion },
                    { "GrupoRef", grupo },
            };

            int parametrosRecividos = 4;
            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerEstudiantesNotasXGrupoInfoParcial", parametros, parametrosRecividos, _contexto.Conexion);

            foreach (var item in resultados)
            {
                estudiantes.Add(item);
                //DatosCompartidos.ListaEstudiantesXGrupo.Add(Convert.ToString(item));
            }

            return estudiantes;
        }


        //https://localhost:7227/Estudiante/ResultadosXPeriodoEstudiante/?asignaturaRef=Matem%C3%A1ticas&periodoRef=Primer%20Periodo
        public JsonResult ResultadosXPeriodoEstudiante(string asignaturaRef, string periodoRef)
        {
            List<string> resultados = new List<string>();
            List<object> grupoResultados = new List<object>();
            long identificacion = Convert.ToInt32(DatosCompartidos.MiDato);

            foreach (List<object> item in ListarEstudiantesNotasXGrupo(asignaturaRef, periodoRef))
            {
                if (Convert.ToInt32(item[1]) == identificacion)
                {
                    resultados.Add(Convert.ToString(item[0]));
                    resultados.Add(Convert.ToString(item[1]));
                    resultados.Add(Convert.ToString(item[2]));
                    resultados.Add(Convert.ToString(item[3]));
                    resultados.Add(Convert.ToString(item[4]));
                    resultados.Add(Convert.ToString(item[5]));
                    resultados.Add(Convert.ToString(item[6]));
                    resultados.Add(Convert.ToString(item[7]));
                    grupoResultados.Add(resultados);
                    resultados = new List<string>();
                }
            }

            return Json(grupoResultados);
        }

        //https://localhost:7227/Estudiante/ResultadosAsignaturasEstudianteXPeriodo/?periodoRef=Primer%20Periodo
        public JsonResult ResultadosAsignaturasEstudianteXPeriodo(string periodoRef)
        {
            List<string> resultados = new List<string>();
            List<object> grupoResultados = new List<object>();
            long identificacion = Convert.ToInt32(DatosCompartidos.MiDato);

            foreach (List<object> item in ListarEstudianteInfoAsignaturas(periodoRef))
            {
                if (Convert.ToInt32(item[1]) == identificacion)
                {
                    resultados.Add(Convert.ToString(item[2]));
                    resultados.Add(Convert.ToString(item[3]));
                    resultados.Add(Convert.ToString(item[4]));
                    resultados.Add(Convert.ToString(item[5]));
                    resultados.Add(Convert.ToString(item[6]));
                    resultados.Add(Convert.ToString(item[7]));
                    grupoResultados.Add(resultados);
                    resultados = new List<string>();
                }
            }

            return Json(grupoResultados);
        }

        public JsonResult InfoBoletinEstudiante()
        {
            EstudianteBoletin estudianteBoletin = new EstudianteBoletin();
            List<NotasEstudiante> notasEstudiante = new List<NotasEstudiante>();

            List<Object> DatosRef = ObtenerMateriasXEstudianteInfoParcial();
            List<string> periodos = Periodos();


            foreach (List<object> item in DatosRef)
            {
                NotasEstudiante notaEstudiante = new NotasEstudiante();

                List<Periodo> listaPeriodos = new List<Periodo>();

                foreach (string periodo in periodos) {

                    listaPeriodos.Add(new Periodo { Nombre_periodo = periodo, Nota_periodo = NotaXPeriodoXAsignatura(Convert.ToString(item[0]), periodo) });

                }
                notaEstudiante.Materia = Convert.ToString(item[0]);
                notaEstudiante.Carga_Horario = Convert.ToString(item[1]);
                notaEstudiante.Inasistencia = Convert.ToString(item[2]);
                notaEstudiante.Nota_final = Convert.ToString(item[3]);
                notaEstudiante.Periodo = listaPeriodos;
                notasEstudiante.Add(notaEstudiante);

            }

            var resultados = new List<Periodo>();

            foreach (string periodo in periodos) {
                float sumaNotas = 0;
                int cantidadMaterias = 0;

                foreach (var materia in notasEstudiante) {
                    var notaPeriodo = materia.Periodo.FirstOrDefault(p=>p.Nombre_periodo==periodo)?.Nota_periodo;
                    if (notaPeriodo != null)
                    {
                        sumaNotas += Convert.ToSingle(notaPeriodo);
                        cantidadMaterias++;

                    }
                
                }
                if (cantidadMaterias > 0)
                {
                    float promedioPeriodo = sumaNotas / cantidadMaterias;
                    resultados.Add(new Periodo { Nombre_periodo = periodo, Nota_periodo = promedioPeriodo.ToString() });
                }
                else {

                    resultados.Add(new Periodo { Nombre_periodo = periodo, Nota_periodo = "0" });
                }



            }

            float notaFinalPeriodo = 0;
            foreach (var periodo in resultados) {
                notaFinalPeriodo += Convert.ToSingle(periodo.Nota_periodo);
            }

            float promedio_final = notaFinalPeriodo / resultados.Count;
            notasEstudiante.Add(
               new NotasEstudiante
               {
                   Materia = "PROMEDIO Y VALORACION FINAL DE TODAS LAS AREAS",
                   Carga_Horario = "0",
                   Inasistencia = "0",
                   Nota_final = promedio_final.ToString(),
                   Periodo = resultados



               });



            estudianteBoletin.Nombre_estudiante = DatosCompartidos.NombreUsuario;
            estudianteBoletin.Sede = DatosCompartidos.MiDato;
            estudianteBoletin.Grado = DatosCompartidos.Grado; 
            estudianteBoletin.Grupo = DatosCompartidos.Grupo;
            estudianteBoletin.Notas_estudiante = notasEstudiante;     

            return Json(notasEstudiante);         
        }

        public IActionResult NotasEstudiantePreescolar1() { return View(); } // notas1 estudiante de Preescolar
        public IActionResult NotasEstudiantePreescolar2() { return View(); } // notas2 estudiante de Preescolar
        public IActionResult NotasEstudiante() { return View(); } // notas estudiante de 1 a 5        
        public IActionResult NotasEstudianteBachiller() { return View(); } // notas estudiante de 6 a 9
        public IActionResult NotasEstudianteMediaAcademica() { return View(); } // notas estudiante de 10 a 11


        public List<string> Periodos()
        {
            List<string> periodo = new List<string>();

            Dictionary<string, Type> atributosPeriodo = new Dictionary<string, Type>
            {
                { "Periodo", typeof(string) },
            };

            List<Object> resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerPeriodosTodos", atributosPeriodo, _contexto.Conexion);

            foreach (var item in resultados)
            {
                periodo.Add(Convert.ToString(item));
            }

            return periodo;

        }

        public string NotaXPeriodoXAsignatura(string asignaturaRef, string periodoRef)
        {
            var resultados = new List<object>();
            string nota = "0";
            string grupo = DatosCompartidos.Grupo;
            long identificacion = Convert.ToInt32(DatosCompartidos.MiDato);

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                    { "documentoEstudiante", identificacion },
                    { "asignaturaRef", asignaturaRef },
                    { "periodoRef", periodoRef },
            };

            int parametrosRecividos = 1;
            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerNotasEstudiantesXMateria", parametros, parametrosRecividos, _contexto.Conexion);

            foreach (var item in resultados)
            {
                nota = Convert.ToString(item);
            }

            return nota;
        }
        

    }
}
