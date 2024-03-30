using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Hosting;
using CsvHelper;
using CsvHelper.Configuration.Attributes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.VisualBasic.FileIO;
using System.Text;
using CsvHelper.Configuration;
using System.Globalization;
using DocumentFormat.OpenXml.EMMA;
using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Cms;
using DocumentFormat.OpenXml.Wordprocessing;
using Microsoft.AspNetCore.Http.Extensions;
using Rotativa.AspNetCore;
using DinkToPdf;
using DinkToPdf.Contracts;
using System.Linq;
using static iText.Layout.Borders.Border;

namespace ProyectoColegio.Controllers
{
    public class FuncionarioController : Controller
    {
        //Funcionario funcionario = new Funcionario();
        private readonly Contexto _contexto;
        ManejoProcedimientos manejoProcedimientos = new ManejoProcedimientos();
        ConsultasValidacionesBD consultasValidacionesBD = new ConsultasValidacionesBD();
        VariablesGlobales variablesGlobales = new VariablesGlobales();
        ConsultasGlobales consultasGlobales = new ConsultasGlobales();

        public FuncionarioController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public JsonResult ListarSedes()
        {
            List<object> sedes = variablesGlobales.Sedes(_contexto.Conexion);

            return Json(sedes);
        }

        public JsonResult ListarGrados()
        {
            List<object> grados = variablesGlobales.Grados(_contexto.Conexion);

            return Json(grados);
        }
        
        public JsonResult ListarGrupos()
        {
            List<object> grupos = variablesGlobales.GruposGrado(_contexto.Conexion);

            return Json(grupos);
        }

        public JsonResult ListarGruposGradoSede(string sede, string grado)
        {
            List<object> grupos = variablesGlobales.GruposGradoSede(sede, grado, _contexto.Conexion);
            return Json(grupos);
        }

        public JsonResult ListarGruposDocente(string grado)
        {
            List<object> grupos = variablesGlobales.GruposDocente(DatosCompartidos.SedeUsuario, grado, Convert.ToInt64(DatosCompartidos.MiDato), _contexto.Conexion);
            return Json(grupos);
        }

        public JsonResult ListarGradosDocente()
        {
            List<object> grupos = variablesGlobales.GradosDocente(DatosCompartidos.SedeUsuario, Convert.ToInt64(DatosCompartidos.MiDato), _contexto.Conexion);
            return Json(grupos);
        }

        public JsonResult ListarGradoSede(string sede)
        {
            List<object> grado = variablesGlobales.GradoSede(sede, _contexto.Conexion);

           return Json(grado);
        }

        public JsonResult Jornada(string jornadaSelect)
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
               
                
            }

            return Json(rangoHorario);
        }


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
            }

            return rangoHorario;
        }

        //https://localhost:7227/Funcionario/horarioDiego/?sede=Central&grupogrado=1202&jornada=AM
        public JsonResult HorarioAcademico(string sede, string grupogrado, string jornada)
        {
            List<string> rangos = JornadaLista(jornada);
            List<string> lisdias = new List<string> { "Lunes", "Martes", "Miercoles", "Jueves", "Viernes" };
            List<Clase> clases = new List<Clase>();

            foreach (string rango in rangos)
            {
                List<Dia> dias = new List<Dia>();

                foreach (string dia in lisdias)
                {
                    var resultadoBd = variablesGlobales.InfoDetalleHorarioFuncionario2(sede, grupogrado, rango, dia, _contexto.Conexion);
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
                            diasemana.detalleH.DocenteHorario = "Docente: " + Convert.ToString(item[2]); // "grado: 6  grupo: 601"
                        }
                    }
                    
                    else
                    {
                        diasemana.detalleH.MateriaHorario = "Asignatura sin definir";
                        diasemana.detalleH.DocenteHorario = "Docente sin definir";
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

        public JsonResult ListarTiposDeSangre()
        {
            List<object> tiposSangre = variablesGlobales.TiposSangre(_contexto.Conexion);

            return Json(tiposSangre);
        }
        
        public JsonResult ListarTiposDeDocumento()
        {
            List<object> tiposDocumento = variablesGlobales.TiposDocumento(_contexto.Conexion);

            return Json(tiposDocumento);
        }
         
        public JsonResult ListarDiscapacidades()
        {
            List<object> tiposDiscapacidades = variablesGlobales.Discapacidades(_contexto.Conexion);

            return Json(tiposDiscapacidades);
        }
         
        public JsonResult ListarSisben()
        {
            List<object> tiposSisben = variablesGlobales.Sisbens(_contexto.Conexion);

            return Json(tiposSisben);
        }
         
        public JsonResult ListarGeneros()
        {
            List<object> tiposGenero = variablesGlobales.Generos(_contexto.Conexion);

            return Json(tiposGenero);
        }
         
        public JsonResult ListarEPS()
        {
            List<object> tiposEPS = variablesGlobales.EPSs(_contexto.Conexion);

            return Json(tiposEPS);
        }
         
        public JsonResult ListarEstratos()
        {
            List<object> tiposEstrato = variablesGlobales.Estratos(_contexto.Conexion);

            return Json(tiposEstrato);
        }
         
        public JsonResult ListarAsignaturas()
        {
            List<object> tiposAsignaturas = variablesGlobales.Asignaturas(_contexto.Conexion);

            return Json(tiposAsignaturas);
        }
         
        public JsonResult ListarDocentesSedeInfoCompleta(string sede)
        {
            List<DocenteInfo> listaDocentes = new List<DocenteInfo>();
            DocenteInfo docente = new DocenteInfo();
            List<object> tiposDocentes = variablesGlobales.DocentesSedeInfoCompleta(sede, _contexto.Conexion);

            foreach (List<string> item in tiposDocentes)
            {
                docente.IdDocente = Convert.ToString(item[0]);
                docente.nombreDocente = Convert.ToString(item[1]);
                docente.Identificacion = Convert.ToString(item[2]);
                docente.TipoSangre = Convert.ToString(item[3]);
                docente.Genero = Convert.ToString(item[4]);
                docente.TelefonoFijo = Convert.ToString(item[5]);
                docente.Direccion = Convert.ToString(item[6]);
                docente.TelefonoCelular = Convert.ToString(item[7]);
                docente.Correo = Convert.ToString(item[8]);
                docente.Sede = Convert.ToString(item[9]);
                docente.HorasTrabajo = Convert.ToString(item[10]);
                docente.Discapacidad = Convert.ToString(item[11]);
                docente.Sisben = Convert.ToString(item[12]);
                docente.Estrato = Convert.ToString(item[13]);
                docente.EPS = Convert.ToString(item[14]);
                listaDocentes.Add(docente);
                docente = new DocenteInfo();
            }

            return Json(listaDocentes);
        }

        //https://localhost:7227/funcionario/ListarEstudiantesSedeGrupo/?sede=NIEVES%20ARRIBA%20KM.%2018&grupo=201 //para pruebas
        public JsonResult ListarEstudiantesSedeGrupo(string sede, string grupo, string grado,string identificacion)
        {
            List<object> estudiantes = new List<object>();
            List<Usuario> usuarios = new List<Usuario>();
            Usuario usuario = new Usuario();


            if (sede != "null" && !string.IsNullOrEmpty(sede))
            {
                
                if (grado != "null" && !string.IsNullOrEmpty(grado))
                {
                    estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), null, Convert.ToString(grado));
                }
                else if (grupo != "null" && !string.IsNullOrEmpty(grupo))
                {
                    estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), Convert.ToString(grupo), null);
                }
                else
                {
                    estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), null, null);
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
                usuario.NombreUsuario = Convert.ToString(item[1]) +' ' + Convert.ToString(item[2]) + ' '+ Convert.ToString(item[3]) + ' ' + Convert.ToString(item[4]);
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

        public JsonResult obtenerInfoEstudiantePrincipalFamiliar (string identificacion)
        {
            List<object> estudiantes = new List<object>();
            List<string> usuarios = new List<string>();

            estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, null, null, null);           

            //organiza los resultados
            foreach (List<string> item in estudiantes)
            {
                usuarios = new List<string>();
                usuarios.Add(Convert.ToString(item[1]) + ' ' + Convert.ToString(item[2]) + ' ' + Convert.ToString(item[3]) + ' ' + Convert.ToString(item[4]));
                usuarios.Add(Convert.ToString(item[19]));

                if (identificacion != "null" && identificacion == item[0])
                {
                    return Json(usuarios);
                }
            }

            return Json(usuarios);
        }

        public JsonResult ListarDocentesSede(string sede)
        {
            List<object> tiposDocentes = variablesGlobales.DocentesSede(sede, _contexto.Conexion);

            return Json(tiposDocentes);
        }

        public JsonResult ListarDocentes()
        {
            List<object> tiposDocentes = variablesGlobales.Docentes(_contexto.Conexion);

            return Json(tiposDocentes);
        }
        
        public JsonResult ListarDocentesTodos(string identificacion, string sede, string grado)
        {
            List<DocenteInfo> docentes = new List<DocenteInfo>();
            List<DocenteInfo> docenteSede = new List<DocenteInfo>();
            List<object> tiposDocentes = new List<object>();
            
            if (sede != "null" && sede != null && grado != "null" && grado != null) // != "Null" por que se envia ese valor desde el JS para validad que null
            {
                tiposDocentes = variablesGlobales.DocentesSedeGrupoInfoCompleta(sede, grado, _contexto.Conexion);
            }
            else
            {
                tiposDocentes = variablesGlobales.DocentesTodos(_contexto.Conexion);
            }

            foreach (List<Object> item in tiposDocentes)
            {
                DocenteInfo datos = new DocenteInfo();

                datos.IdDocente = (Convert.ToString(item[0]));
                datos.nombreDocente = (Convert.ToString(item[1]));
                datos.Identificacion = (Convert.ToString(item[2]));
                datos.TipoSangre = (Convert.ToString(item[3]));
                datos.Genero = (Convert.ToString(item[4]));
                datos.TelefonoFijo = (Convert.ToString(item[5]));
                datos.Direccion = (Convert.ToString(item[6]));
                datos.TelefonoCelular = (Convert.ToString(item[7]));
                datos.Correo = (Convert.ToString(item[8]));
                datos.Sede = (Convert.ToString(item[9]));
                datos.HorasTrabajo = (Convert.ToString(item[10]));
                datos.Discapacidad = (Convert.ToString(item[11]));
                datos.Sisben = (Convert.ToString(item[12]));
                datos.Estrato = (Convert.ToString(item[13]));
                datos.EPS = (Convert.ToString(item[14]));
                docentes.Add(datos);

                if(sede != "null" && sede != null && sede == Convert.ToString(item[9]))
                {
                    docenteSede.Add(datos);
                }
                if (identificacion != "null" && identificacion != null && Convert.ToString(item[2]) == identificacion)
                {
                    docentes = new List<DocenteInfo>();
                    docentes.Add(datos);
                    return Json(docentes);
                }
            }

            if (docenteSede.Count > 0 && (grado == "null" || grado == null))
            {
                return Json(docenteSede);
            }

            return Json(docentes);
        }

        public JsonResult ListarDocentesSedeGrupo(string sede, string grupo)
        {
            List<string> tiposDocentes = variablesGlobales.DocentesSedeGrupo(sede, grupo, _contexto.Conexion);

            return Json(tiposDocentes);
        }

        public JsonResult ListarAsignaturasGrupo(string sede, int grado)
        {
            List<string> asignaturasGrado = variablesGlobales.AsignaturasGrado(sede, grado, _contexto.Conexion);

            return Json(asignaturasGrado);
        }

        //https://localhost:7227/Funcionario/ListarDocentesAsignaturasGrupo/?sede=Central&grado=207010&asignatura=Español
        public JsonResult ListarDocentesAsignaturasGrupo(string sede, int grado, string asignatura)
        {
            var DocentesAsignatura = variablesGlobales.DocentesAsignaturasGrupo(sede, grado, asignatura, _contexto.Conexion);
            List<object> docentes = new List<object>();
            
            foreach (var item in DocentesAsignatura)
            {
                docentes.Add(item);
            }

            return Json(docentes);
        }

        public JsonResult ListarDocentesSedeGrupoInfoCompleta(string sede, string grupo)
        {
            List<object> tiposDocentes = variablesGlobales.DocentesSedeGrupoInfoCompleta(sede, grupo, _contexto.Conexion);

            return Json(tiposDocentes);
        }
        
        public JsonResult ListarDocentesSedeGrupoInfoParcial(int idRef)
        {
            List<object> tiposDocentes = variablesGlobales.DocenteSedeInfoParcial(idRef, _contexto.Conexion);

            return Json(tiposDocentes);
        }
        
        public JsonResult ListarDocenteSedeInfoGradoAsignatura(int idRef)
        {
            List<object> tiposDocentes = variablesGlobales.DocenteSedeInfoGradoAsignatura(idRef, _contexto.Conexion);
            List<DocenteGrupoAsignaturas> infoDocenteGradoAsignatura = new List<DocenteGrupoAsignaturas>();
            DocenteGrupoAsignaturas docenteGradoAsignatura = new DocenteGrupoAsignaturas();

            foreach (List<string> item in tiposDocentes)
            {
                docenteGradoAsignatura.Asignatura = Convert.ToString(item[0]);
                docenteGradoAsignatura.Grado = Convert.ToString(item[1]);
                infoDocenteGradoAsignatura.Add(docenteGradoAsignatura);
                docenteGradoAsignatura = new DocenteGrupoAsignaturas();
            }

            return Json(infoDocenteGradoAsignatura);
        }

        public JsonResult ListarTiposFamiliarEstudiante (string identificacion)
        {
            List<string> parentezcos = new List<string> { "Padre", "Madre", "Abuelo", "Abuela", "Tio", "Tia", "Hermano", "Hermana" };

            if (!string.IsNullOrEmpty(identificacion))
            {
                List<string> registroTipoFamiliar = new List<string>();

                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "identificacionEst", identificacion },
                };

                List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerFamiliaresEstudiante", parametros, 3, _contexto.Conexion);

                foreach (List<Object> item in resultados)
                {
                    registroTipoFamiliar.Add(Convert.ToString(item[1]));
                }
                Console.WriteLine(registroTipoFamiliar);
                List<string> elementosUnicos = parentezcos.Except(registroTipoFamiliar).ToList();
                registroTipoFamiliar = new List<string>();

                foreach (var item in elementosUnicos)
                {
                    registroTipoFamiliar.Add(item);
                }
                Console.WriteLine(registroTipoFamiliar);
                return Json(registroTipoFamiliar);
            }
                
            return Json(parentezcos);                       
           
        }

        public JsonResult retornarFamiliaresEstudiante (string identificacion)
        {
            if (!string.IsNullOrEmpty(identificacion))
            {
                 
                List<Familiar> familiaresEst = new List<Familiar>();

                Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                { "identificacionEst", identificacion },
            };

                List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerFamiliaresEstudiante", parametros, 3, _contexto.Conexion);

                foreach (List<Object> item in resultados)
                {
                    Familiar datos = new Familiar();

                    datos.nombresFamiliar = (Convert.ToString(item[0]));
                    datos.parentescoFamiliar = (Convert.ToString(item[1]));
                    datos.estadoAcudiente = (Convert.ToString(item[2]));
                    familiaresEst.Add(datos);

                }

                return Json(familiaresEst);
            }
            else
            {
                return Json(null);
            }
            
        }
        //https://localhost:7227/Funcionario/retornarInfoFamiliaresEstudianteXCertificados/?identificacion=106600
        public JsonResult retornarInfoFamiliaresEstudianteXCertificados (int identificacion) //idEstudiante - codigo
        {
            if (identificacion != 0)
            {                
                List<object> familiaresEst = new List<object>();

                Dictionary<string, object> parametrosConsulta = new Dictionary<string, object>
                {
                    { "identificacionEst", identificacion },
                };
                int parametrosEsperados = 27;
                List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerInfoFamiliaresEstudiante_Certificados", parametrosConsulta, parametrosEsperados, _contexto.Conexion);

                foreach (var item in resultados)
                {
                    object familiarEst = new object();
                    familiarEst = item;
                    familiaresEst.Add(familiarEst);

                }

                return Json(familiaresEst);
            }
            else
            {
                return Json(null);
            }
            
        }

        public string RegistrarDocenteRetorno(Docente docente)
        {
            string retorno = "";

            try
            {

                if (docente.Usuario.Identificacion == null || consultasValidacionesBD.ExisteDocente(docente.Usuario.Identificacion, _contexto.Conexion) == true)
                {
                    retorno = "0";
                }
                else
                {

                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "horasTrabaja", docente.HorasLabora },
                        { "nomSede", docente.NombreSede }, //para seleccionar
                        { "documento", Convert.ToString(docente.identificacion) },
                        { "lugarExpedicionDoc", Convert.ToString(docente.lugarNacimiento) },
                        { "nomUsuario", docente.nombreUsuario },
                        { "nom2Usuario", docente.segundoNombreUsuario },
                        { "apellidoUsuario", docente.apellidoUsuario },
                        { "apellido2Usuario", docente.segundoApellidoUsuario },
                        { "edad", Convert.ToInt16(docente.edad) },
                        { "telCelular", docente.telefonoCelular },
                        { "telFijo", docente.telefonoFijo },
                        { "correoUss", docente.correo },
                        { "direccionUss", docente.direccion },
                        { "barrioUss", docente.barrio },
                        { "fechaNacimientoUss", docente.fechaNacimiento },
                        { "tipoSangre", docente.tipoSangre }, //para seleccionar
                        { "tipoDocumento", docente.tpDocumento }, //para seleccionar
                        { "nombreDiscapacidad", docente.discapacidad }, //para seleccionar
                        { "nombreSisben", docente.sisben }, //para seleccionar
                        { "nombreGenero", docente.genero }, //para seleccionar
                        { "nombreEps", docente.eps }, //para seleccionar
                        { "nombreEstrato", docente.estrato }, //para seleccionar
                     };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarDocente", parametros, _contexto.Conexion);
                    retorno = "1";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                retorno = "0";
            }

            return retorno;
        }

        public string RegistrarDocenteGradoAsignaturaRetorno(int idDocenteRef, int idGradoRef, string asignaturaRef)
        {
            string retorno = "";
            if (idDocenteRef != null && idGradoRef != null && asignaturaRef != null)
            {
                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "idDocenteRef", idDocenteRef },
                    { "idGradoRef", idGradoRef }, //para seleccionar
                    { "asignaturaRef", asignaturaRef }
                };

                var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("RegistrarAsignaturaGrupoDocente", parametros, 1, _contexto.Conexion);
                
                foreach (var item in resultados)
                {
                    retorno = Convert.ToString(item);
                }
            }
            return retorno;
        }

        public string RegistrarHorarioRetorno(Horario horario)
        {
            string retorno = "";

            if (horario != null)
            {
                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "nombreSedeRH", horario.nombreSede },
                    { "nomAsignatura", horario.nomAsignatura }, 
                    { "nomGrupo", horario.nomGrupo },
                    { "identificacionDocente", horario.identificacionDocente },
                    { "diaHorarioClase", horario.diaHorarioClase },
                    { "rangoHorario", horario.rangoHorario },
                };

                int numeroParametrosRetornados = 1; 
                var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("RegistrarHorario", parametros, numeroParametrosRetornados, _contexto.Conexion);

                foreach (var item in resultados)
                {
                    retorno = Convert.ToString(item);
                }
            }

            return retorno;
        }

        public IActionResult CargarCsv()
        {
            //var gruposSede = variablesGlobales.GruposGradoSede("Central", _contexto.Conexion);
            // En el segundo controlador
            var identificacion = TempData["identificacion"];
            ViewBag.idetificacionUs = identificacion;
            var rol = TempData["rol"];
            ViewBag.rol = rol;

            var sede = TempData["sede"];
            var grupo = TempData["grupo"];
            var identificacionEst = TempData["IdentificacionEst"];

            if (variablesGlobales.Sedes(_contexto.Conexion) != null && variablesGlobales.GruposGrado(_contexto.Conexion) != null)
            {
                ViewBag.GruposGrado = variablesGlobales.GruposGrado(_contexto.Conexion);
                ViewBag.Sedes = variablesGlobales.Sedes(_contexto.Conexion);
                ViewBag.IdentificacionEst = identificacionEst;
                //muestra todos los estudiantes de la institucion
                ViewBag.ListaEstudiante = consultasGlobales.mostrarCsv(_contexto.Conexion, null, null, null);
            }

            if (sede != null)
            {
                //muestra los estudiantes por sede
                ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), null, null);
                //ViewBag.GruposGrado = variablesGlobales.GruposGradoSede(Convert.ToString(sede), _contexto.Conexion);
                ViewBag.SedeSeleccionada = sede;

                if (grupo != null)
                {
                    //muestra los estudiantes por grupo de sede
                    ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), Convert.ToString(grupo), null);
                    ViewBag.GrupoSeleccionado = grupo;
                }

            }

            return View();
        }

        public IActionResult Index() {                
         return View();
        }

        //[HttpPost]
        //public IActionResult CargarCsv(IFormFile file)
        //{
        //    var tempFilePath = "";

        //    if (file != null && file.Length > 0)
        //    {
        //        // Crear un archivo temporal
        //        tempFilePath = Path.GetTempFileName();

        //        // Guardar el contenido del archivo en el archivo temporal
        //        using (var stream = new FileStream(tempFilePath, FileMode.Create))
        //        {
        //            file.CopyTo(stream);
        //        }

        //    }

        //    // Lista para almacenar los datos
        //    List<InfoSimat> info = new List<InfoSimat>();

        //    var csvConfig = new CsvConfiguration(CultureInfo.InvariantCulture)
        //    {
        //        Delimiter = ";", // Establece el delimitador como ;
        //        HasHeaderRecord = true,
        //        Encoding = Encoding.GetEncoding("iso-8859-1")
        //    };

        //    // Leer el archivo CSV usando CsvHelper
        //    using (var reader = new StreamReader(tempFilePath, Encoding.GetEncoding("iso-8859-1")))
        //    using (var csv = new CsvReader(reader, csvConfig))
        //    {
        //        // Lee todos los registros a la vez
        //        var records = csv.GetRecords<InfoSimat>().ToList();

        //        // Agrega los registros a la lista
        //        info.AddRange(records);
        //    }
        //    Console.WriteLine(info);
        //    // Eliminar el archivo temporal después de procesarlo si es necesario
        //    System.IO.File.Delete(tempFilePath);

        //    // Procesa la informacion en base de datos
        //    actualizarSistema(info);
        //    UsarCsv(info);
        //    actualizarInfoEstudianteSede(info);

        //    //return RedirectToAction("Index", "Home");
        //    return RedirectToAction("CargarCsv", "Funcionario");

        //}

        [HttpPost]
        public IActionResult CargarCsv(IFormFile file)
        {
            var tempFilePath = "";

            if (file != null && file.Length > 0)
            {
                // Crear un archivo temporal
                tempFilePath = Path.GetTempFileName();

                // Guardar el contenido del archivo en el archivo temporal
                using (var stream = new FileStream(tempFilePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
            }

            // Lista para almacenar los datos
            List<InfoSimat> info = new List<InfoSimat>();

            var csvConfig = new CsvConfiguration(CultureInfo.InvariantCulture)
            {
                Delimiter = ";", // Establece el delimitador como ;
                HasHeaderRecord = true, // Indica que la primera fila contiene los encabezados de las columnas
                Encoding = Encoding.GetEncoding("iso-8859-1"),
                // Elimina los espacios en blanco alrededor de los campos
                TrimOptions = TrimOptions.Trim,
                IgnoreBlankLines = true // Ignora las líneas en blanco en el archivo CSV
            };

            // Leer el archivo CSV usando CsvHelper
            using (var reader = new StreamReader(tempFilePath, Encoding.GetEncoding("iso-8859-1")))
            using (var csv = new CsvReader(reader, csvConfig))
            {
                string line;
                // Leer cada línea del archivo CSV
                while ((line = reader.ReadLine()) != null)
                {
                    // Dividir la línea en campos usando el delimitador ;
                    var fields = line.Split(';');

                    // Crear un nuevo objeto InfoSimat y asignar los valores
                    var record = new InfoSimat
                    {
                        ANO = fields[0],
                        ETC = fields[1],
                        ESTADO = fields[2],
                        JERARQUIA = fields[3],
                        INSTITUCION = fields[4],
                        DANE = fields[5],
                        CALENDARIO = fields[6],
                        SECTOR = fields[7],
                        SEDE = fields[8],
                        CODIGO_DANE_SEDE = fields[9],
                        CONSECUTIVO = fields[10],
                        ZONA_SEDE = fields[11],
                        JORNADA = fields[12],
                        GRADO_COD = fields[13],
                        GRUPO = fields[14],
                        MODELO = fields[15],
                        MOTIVO = fields[16],
                        FECHAINI = fields[17],
                        FECHAFIN = fields[18],
                        NUI = fields[19],
                        ESTRATO = fields[20],
                        SISBEN_IV = fields[21],
                        PER_ID = fields[22],
                        DOC = fields[23],
                        TIPODOC = fields[24],
                        APELLIDO1 = fields[25],
                        APELLIDO2 = fields[26],
                        NOMBRE1 = fields[27],
                        NOMBRE2 = fields[28],
                        GENERO = fields[29],
                        FECHA_NACIMIENTO = fields[30],
                        BARRIO = fields[31],
                        EPS = fields[32],
                        TIPO_DE_SANGRE = fields[33],
                        MATRICULACONTRATADA = fields[34],
                        FUENTE_RECURSOS = fields[35],
                        INTERNADO = fields[36],
                        APOYO_ACADEMICO_ESPECIAL = fields[37],
                        SRPA = fields[38],
                        DISCAPACIDAD = fields[39],
                        PAIS_ORIGEN = fields[40],
                        CORREO = fields[41],
                    };

                    // Agregar el objeto InfoSimat a la lista
                    info.Add(record);
                }
            }

            Console.WriteLine(info);

            // Eliminar el archivo temporal después de procesarlo si es necesario
            System.IO.File.Delete(tempFilePath);

            // Procesa la informacion en base de datos
            actualizarSistema(info);
            UsarCsv(info);
            actualizarInfoEstudianteSede(info);

            //return RedirectToAction("Index", "Home");
            return RedirectToAction("CargarCsv", "Funcionario");
        }




        public void UsarCsv(List<InfoSimat> datos)
        {   
            
            try
            {
                foreach (InfoSimat dato in datos)
                {
                    if (dato == datos[0])
                    {
                        //Son encabezados
                    }
                    else
                    {
                        if (consultasValidacionesBD.ExisteEstudiante(Convert.ToInt64(dato.DOC), _contexto.Conexion) == true)
                        {
                            //Construir mecanismo de alerta para generar el aviso ("Ya esta registrado");
                        }
                        else
                        {
                            Dictionary<string, object> parametros = new Dictionary<string, object>
                        {
                            { "documento", Convert.ToInt64(dato.DOC) },
                            { "nomUsuario", dato.NOMBRE1 },
                            { "nom2Usuario", dato.NOMBRE2 ?? "Sin_Registro"},
                            { "apellidoUsuario", dato.APELLIDO1 },
                            { "apellido2Usuario", dato.APELLIDO2 },
                            { "edad", ManejoBaseDatos.CalcularEdad(dato.FECHA_NACIMIENTO) },
                            { "telCelular", "Sin_Registro" },
                            { "telFijo", "Sin_Registro" },
                            { "correoUss", dato.CORREO ?? "Sin_Registro"},
                            { "direccionUss", "Sin_Registro" },
                            { "barrioUss", dato.BARRIO ?? "Sin_Registro"},
                            { "fechaNacimientoUss", dato.FECHA_NACIMIENTO },
                            { "tipoSangre", dato.TIPO_DE_SANGRE ?? "Sin_Registro"},
                            { "tipoDocumento", dato.TIPODOC ?? "Sin_Registro"},
                            { "nombreDiscapacidad", dato.DISCAPACIDAD ?? "Sin_Registro"},
                            { "nombreSisben", dato.SISBEN_IV ?? "Sin_Registro"},
                            { "nombreGenero", dato.GENERO ?? "Sin_Registro"},
                            { "nombreEps", dato.EPS ?? "Sin_Registro"},
                            { "nombreEstrato", dato.ESTRATO ?? "Sin_Registro"},
                            { "codigoStudent", dato.PER_ID },
                            { "ciudadNacimientoEs", "Sin_Registro" },
                            { "ciudadResidenciaEs", "Sin_Registro" },
                            { "ciudadExpedicionDocumentoEs", "Sin_Registro" },
                            { "paisOrigenEs", dato.PAIS_ORIGEN ?? "Sin_Registro"},
                            { "asistenciaAcademicaEspecialEs", dato.APOYO_ACADEMICO_ESPECIAL ?? "No_Aplica"},
                            { "desplazadoEstadoEs", "Sin_Registro" },
                        };
                            ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarEstudiante", parametros, _contexto.Conexion);
                        }
                    }                   

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        public void actualizarSistema(List<InfoSimat> datos)
        {
            //var datos = TempData["info"];
            foreach (InfoSimat dato in datos)
            {
                if (dato != datos[0])
                {
                    VerificacionRegistrosEPS(dato.EPS);
                    VerificacionRegistrosTipoSangre(dato.TIPO_DE_SANGRE);
                    VerificacionRegistrosTipoDocumento(dato.TIPODOC);
                    VerificacionRegistrosDiscapacidades(dato.DISCAPACIDAD);
                    VerificacionRegistrosGenero(dato.GENERO);
                    VerificacionRegistrosSisben(dato.SISBEN_IV);
                    VerificacionRegistrosSede(dato.SEDE);
                    registrarModalidadEducativa(dato.MODELO);
                    VerificacionRegistrosGrado(Convert.ToString(dato.GRADO_COD));
                }                              
            }
        }

        public void actualizarInfoEstudianteSede(List<InfoSimat> datos)
        {
            foreach (InfoSimat dato in datos)
            {
                if (dato != datos[0])
                {
                    VerificacionRegistrosSedeGrado(dato.SEDE, Convert.ToString(dato.GRADO_COD));
                    VerificacionRegistrosGrupoGrado(Convert.ToString(dato.GRADO_COD), Convert.ToString(dato.GRUPO));
                    registrarMatricula(dato.JORNADA, dato.FECHAINI, dato.FECHAFIN, dato.INTERNADO, Convert.ToString(dato.GRADO_COD), Convert.ToString(dato.GRUPO), dato.DOC, dato.SEDE);
                    VerificacionRegistrosEstudianteGrupoGrado(dato.DOC, Convert.ToString(dato.GRUPO));
                }
                
            }
        }
              

        public void registrarMatricula(string jornada, string fechaInicio, string fechaFin, string estaInternado, string grado, string grupo, string identificacionEst, string sede)
        {
            //string identificacion = Convert.ToString(TempData["identificacion"]);
            string identificacion = DatosCompartidos.MiDato;
            try
            {
                //Tener en cuenta que se debe cambiar la manera en que se esta usando la identificacion del coordinador "12368974"                                                                                                           
                if (identificacionEst == "" || sede == "" || consultasValidacionesBD.ExisteMatricula(identificacionEst, identificacion, sede, _contexto.Conexion) == true)
                {
                    return;
                }
                else
                {
                    
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "jornadaEs", jornada },
                        { "fechaInicioM", fechaInicio },
                        { "fechaFinM", fechaFin },
                        { "esInternado", estaInternado },
                        { "gradoEst", grado },
                        { "grupoEst", grupo },
                        { "identificacionEst", identificacionEst },
                        { "identificacionFuncionario", identificacion }, //Se debe obtener el id del funcionario al iniciar seccion
                        { "nombreSede", sede },

                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarMatricula", parametros, _contexto.Conexion);
                    
                }                             

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }

        [HttpPost]
        public IActionResult obtenerEstudiantesGrupoSede(string Sede, string Grupo)
        {
            if (!string.IsNullOrEmpty(Sede))
            {
                TempData["grupo"] = Grupo;
                TempData["sede"] = Sede;
            }

            return RedirectToAction("CargarCsv", "Funcionario");
        }

        public void registrarModalidadEducativa(string modalidad)
        {
            try
            {
                if (modalidad == "" || consultasValidacionesBD.ExisteModalidadEducativa(modalidad, _contexto.Conexion) == true)
                {
                    return;
                }
                else
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "nomModalidadEducativa", modalidad}
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarModalidadEducativa", parametros, _contexto.Conexion);
                }                                 

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }

        public IActionResult registrarFamiliar(long identificacion)
        {
            var registroTipoFamiliar = TempData["RegistroTipoFamiliares"];
            ViewBag.RegistroTipoFamiliar = registroTipoFamiliar;
            ViewBag.Identificacion = Convert.ToInt64(identificacion);
            return View();
        }


        public string GuardarFamiliarEstudiante(Familiar familiar) 
        {
            string retorno = "";

            if (familiar.parentescoFamiliar == "Madre" || familiar.parentescoFamiliar == "Tia" || familiar.parentescoFamiliar == "Abuela" || familiar.parentescoFamiliar == "Hermana")
            {
                familiar.genero = "Femenino";
            }
            else
            {
                familiar.genero = "Masculino";
            }

            try
            {

                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "identificacionFamiliarEs", familiar.identificacionFamiliar },
                    { "nombreFamiliarEs", familiar.nombresFamiliar },
                    { "ocupacionFamiliarEs", familiar.ocupacionFamiliar },
                    { "correoFamiliarEs", null },
                    { "celularFamiliarEs", familiar.celularFamiliar },
                    { "parentescoFamiliarEs", familiar.parentescoFamiliar },
                    { "responsabilidadEconomicaFamiliarEs", familiar.responsabilidadEconomicaEstudiante },
                    { "esAcudiente", familiar.estadoAcudiente },
                    { "esdesplazado", familiar.desplazado },
                    { "fechaNacimientoAcudiente", familiar.fechaNacimiento },
                    { "nivelEscolaridadAcudiente", familiar.nivelEscolaridad },
                    { "ubicacionAcudiente", familiar.ubicacion },
                    { "generoFamiliarEs", familiar.genero },
                    { "identificacionEstudianteEs", familiar.identificacionEstudiante },

                };

                var resultado = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("registrarFamiliar", parametros, 1, _contexto.Conexion);
                retorno = Convert.ToString(resultado[0]);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }

            return retorno;
        }

        [HttpPost]
        public IActionResult registrarFamiliar(string identificacionEst, string nombreCompleto, string documento, string ocupacion, string numeroCelular, string correoElectronico, string esAcudiente, string esResponsableEconomico, string parentezco) 
        {
            string genero = "";
            bool esAcudienteSeleccionado = false;
            bool esResponsableEconomicoSeleccionado = false;
            string esAcudienteEst = "No";
            string esResponsableEconomicoEst = "No";

            if (parentezco == "Madre" || parentezco == "Tia" || parentezco == "Abuela" || parentezco == "Hermana")
            {
                genero = "FEMENINO";
            }
            else
            {
                genero = "MASCULINO";
            }

            if (!string.IsNullOrEmpty(esAcudiente))
            {
                esAcudienteSeleccionado = !string.IsNullOrEmpty(esAcudiente) && esAcudiente.ToLower() == "on";

                if (esAcudienteSeleccionado == true)
                {
                    esAcudienteEst = "Si";
                }

            }
            if (!string.IsNullOrEmpty(esResponsableEconomico))
            {
                esResponsableEconomicoSeleccionado = !string.IsNullOrEmpty(esResponsableEconomico) && esResponsableEconomico.ToLower() == "on";

                if (esResponsableEconomicoSeleccionado == true)
                {
                    esResponsableEconomicoEst = "Si";
                }
            }

            try
            {

                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "identificacionFamiliarEs", documento },
                    { "nombreFamiliarEs", nombreCompleto },
                    { "ocupacionFamiliarEs", ocupacion },
                    { "correoFamiliarEs", correoElectronico },
                    { "celularFamiliarEs", numeroCelular },
                    { "parentescoFamiliarEs", parentezco },
                    { "responsabilidadEconomicaFamiliarEs", esResponsableEconomicoEst },
                    { "esAcudiente", esAcudienteEst },
                    { "generoFamiliarEs", genero },
                    { "identificacionEstudianteEs", identificacionEst },
                            
                };

                ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarFamiliar", parametros, _contexto.Conexion);

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
            return RedirectToAction("CargarCsv", "Funcionario");
        }

        public IActionResult PrincipalFamiliar(long identificacion, string nombreCompleto, string codigoEstudiante)
        {
            //ViewBag.Identificacion = TempData["Identificacion"];
            //ViewBag.NombreCompleto = TempData["NombreCompleto"];
            //ViewBag.CodigoEstudiante = TempData["CodigoEstudiante"];
            //ViewBag.Familiares = TempData["Familiares"];
            ViewBag.Identificacion = Convert.ToInt64(identificacion);
            ViewBag.NombreCompleto = nombreCompleto;
            ViewBag.CodigoEstudiante = codigoEstudiante;
            ViewBag.Familiares = consultarFamiliaresEstudiante(Convert.ToString(identificacion));
            return View();
        }
              

        public List<object> consultarFamiliaresEstudiante(string identificacion)
        {
            
            List<object> familiares = new List<object>();
            List<string> registroTipoFamiliar = new List<string>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                { "identificacionEst", identificacion },
            };

            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerFamiliaresEstudiante", parametros, 3, _contexto.Conexion);

            foreach (List<Object> item in resultados)
            {
                List<string> datos = new List<string>();

                datos.Add(Convert.ToString(item[0]));
                datos.Add(Convert.ToString(item[1]));
                datos.Add(Convert.ToString(item[2]));
                registroTipoFamiliar.Add(Convert.ToString(item[1]));

                familiares.Add(datos);

            }

            TempData["RegistroTipoFamiliares"] = registroTipoFamiliar;
            return familiares;
        }

        public IActionResult registrarObservacion(string identificacionEst)
        {
            //string identificacionFuncionario = Convert.ToString(TempData["identificacion"]);
            string identificacionFuncionario = DatosCompartidos.MiDato;

            ViewBag.IdentificacionEstudiante = Convert.ToInt64(identificacionEst);
            ViewBag.IdentificacionFuncionario = Convert.ToInt64(identificacionFuncionario); //modificar la forma de aignar la identificacion del funcionario
            
            return View();
        }

        [HttpPost]
        public IActionResult registrarObservacion(Observacion observacion)
        {
            try
            {
                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "descripcionObsrv", observacion.Observaciones },
                    { "identificacionEstudiante", observacion.identificacionEstudiante },
                    { "identificacionFuncionario", observacion.identificacionFuncionario },
                };

                ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarObservacionEst", parametros, _contexto.Conexion);

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
            return RedirectToAction("mostrarCsv", "Funcionario");
        }

        public IActionResult principalObservacion(string identificacion)
        {
            return View();
        }

        public IActionResult RegistrarDocente()
        {
            ViewBag.Sedes = variablesGlobales.Sedes(_contexto.Conexion);
            ViewBag.TiposSangre = variablesGlobales.TiposSangre(_contexto.Conexion);
            ViewBag.TiposDocumento = variablesGlobales.TiposDocumento(_contexto.Conexion);
            ViewBag.Discapacidades = variablesGlobales.Discapacidades(_contexto.Conexion);
            ViewBag.Sisbens = variablesGlobales.Sisbens(_contexto.Conexion);
            ViewBag.Generos = variablesGlobales.Generos(_contexto.Conexion);
            ViewBag.EPSs = variablesGlobales.EPSs(_contexto.Conexion);
            ViewBag.Estratos = variablesGlobales.Estratos(_contexto.Conexion);
            var docentesFiltrados = TempData["DocentesFiltrados"];
            ViewBag.PrincipalDocentes = docentesFiltrados;
            return View();
        }

        [HttpPost]
        public IActionResult RegistrarDocente(Docente docente)
        {
            try
            {                

                if (docente.Usuario.Identificacion == null || consultasValidacionesBD.ExisteDocente(docente.Usuario.Identificacion, _contexto.Conexion) == true)
                {
                    //Se podria generar una alerta de que el docente ya existe
                }
                else
                {                  
                
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "horasTrabaja", docente.HorasLabora },
                        { "nomSede", docente.NombreSede }, //para seleccionar
                        { "documento", docente.Usuario.Identificacion },
                        { "nomUsuario", docente.Usuario.NombreUsuario },
                        { "nom2Usuario", docente.Usuario.SegundoNombreUsuario },
                        { "apellidoUsuario", docente.Usuario.ApellidoUsuario },
                        { "apellido2Usuario", docente.Usuario.SegundoApellidoUsuario },
                        { "edad", Convert.ToInt16(docente.Usuario.Edad) },
                        { "telCelular", docente.Usuario.TelefonoCelular },
                        { "telFijo", docente.Usuario.TelefonoFijo },
                        { "correoUss", docente.Usuario.Correo },
                        { "direccionUss", docente.Usuario.Direccion },
                        { "barrioUss", docente.Usuario.Barrio },
                        { "fechaNacimientoUss", docente.Usuario.FechaNacimiento },
                        { "tipoSangre", docente.Usuario.TipoSangre }, //para seleccionar
                        { "tipoDocumento", docente.Usuario.TipoDocumento }, //para seleccionar
                        { "nombreDiscapacidad", docente.Usuario.Discapacidad }, //para seleccionar
                        { "nombreSisben", docente.Usuario.Sisben }, //para seleccionar
                        { "nombreGenero", docente.Usuario.Genero }, //para seleccionar
                        { "nombreEps", docente.Usuario.EPS }, //para seleccionar
                        { "nombreEstrato", docente.Usuario.Estrato }, //para seleccionar
                     };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarDocente", parametros, _contexto.Conexion);
                    
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }

            return RedirectToAction("CargarCsv", "Funcionario");
        }

        public IActionResult principalDocente()
        {
            //ViewBag.GruposGrado = variablesGlobales.GruposGrado(_contexto.Conexion);
            ViewBag.Sedes = variablesGlobales.Sedes(_contexto.Conexion);
            
            var sede = TempData["sede"];
            var grupo = TempData["grupo"];
            List<object> listaDocentes = new List<object>();

            if (sede != null)
            {
                //ViewBag.GruposGrado = variablesGlobales.GruposGradoSede(Convert.ToString(sede), _contexto.Conexion);
                listaDocentes = variablesGlobales.DocentesSedeInfoCompleta(Convert.ToString(sede), _contexto.Conexion);
                

                if (grupo != null)
                {
                    listaDocentes = new List<object>();
                    List<object> docentesRecuperados = variablesGlobales.DocentesSedeGrupoInfoCompleta(Convert.ToString(sede), Convert.ToString(grupo), _contexto.Conexion);                                       

                    foreach (List<object> item in docentesRecuperados)
                    {
                        List<string> listaDocente = new List<string>();
                        listaDocente.Add(Convert.ToString(item[0]));
                        listaDocente.Add(Convert.ToString(item[1]));
                        listaDocente.Add(Convert.ToString(item[2]));
                        listaDocente.Add(Convert.ToString(item[3]));
                        listaDocente.Add(Convert.ToString(item[4]));
                        listaDocente.Add(Convert.ToString(item[5]));
                        listaDocente.Add(Convert.ToString(item[6]));
                        listaDocente.Add(Convert.ToString(item[7]));
                        listaDocente.Add(Convert.ToString(item[9]));
                        listaDocente.Add(Convert.ToString(item[10]));
                        listaDocente.Add(Convert.ToString(item[11]));
                        listaDocente.Add(Convert.ToString(item[12]));
                        listaDocente.Add(Convert.ToString(item[13]));
                        listaDocentes.Add(listaDocente);
                    }
                    //ViewBag.Docentes = variablesGlobales.DocentesSedeGrupoInfoCompleta(Convert.ToString(sede), Convert.ToString(grupo), _contexto.Conexion);
                    //ViewBag.Docentes = listaDocentes;
                    ViewBag.GrupoSeleccionado = grupo;
                }
                else
                {
                    //Necesario para comparar los docentes registrados en la sede respecto a posibles nuevos registros

                    if (listaDocentes != null)
                    {
                        List<string> idDocentesFiltrados = new List<string>();
                        foreach (List<string> item in listaDocentes)
                        {
                            idDocentesFiltrados.Add(Convert.ToString(item[1]));
                        }

                        TempData["DocentesFiltrados"] = idDocentesFiltrados;
                    }
                }

                ViewBag.Docentes = listaDocentes;                
                ViewBag.SedeSeleccionada = sede;                
                
            }

            return View();
        }

        [HttpPost]
        public IActionResult principalDocente(string sede, string grupo)
        {
            if (sede != null)
            {
                TempData["sede"] = sede;
                TempData["grupo"] = grupo;
            }

            return RedirectToAction("principalDocente", "Funcionario");
        }

        public IActionResult registroDocenteGrado(string grupo, string nombreDocente)
        {
            if (!string.IsNullOrEmpty(grupo) && !string.IsNullOrEmpty(nombreDocente))
            {
                try
                {
                    if (consultasValidacionesBD.ExisteDocenteGrado(nombreDocente, grupo, _contexto.Conexion) == true)
                    {
                        //Se podria generar una alerta de que el docente ya existe
                    }
                    else
                    {

                        Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "nombreDocente", nombreDocente },
                        { "nomGrupo", grupo },
                     };

                        ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarDocenteGrado", parametros, _contexto.Conexion);

                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
                
            }

            return RedirectToAction("principalDocente", "Funcionario");

        }

        [HttpPost]
        public IActionResult ObtenerIdentificacionEstudiante(string identificacion)
        {                       
            TempData["IdentificacionEst"] = identificacion;          
            return RedirectToAction("CargarCsv", "Funcionario");
        }

        public IActionResult GestionPeriodoAcademico()
        {
           
            
            return View();
        }

        [HttpPost]
        public IActionResult GestionPeriodoAcademico(string sede, string grupo)
        {
            if (sede != null)
            {
                TempData["sede"] = sede;
                TempData["grupo"] = grupo;
            }
            return RedirectToAction("GestionPeriodoAcademico", "Funcionario");
        }

        public IActionResult controlHabilitacionCargueNotaPeriodo(string habilitarCargueNotaFinal)
        {
            if (habilitarCargueNotaFinal != null)
            {
                DatosCompartidos.HabilitarNotas = Convert.ToBoolean(habilitarCargueNotaFinal);
            }

            return RedirectToAction("Index", "Funcionario");
        }

        [HttpPost]
        public IActionResult GestionAsignaturas(string sede)
        {
            ViewBag.Asignaturas = variablesGlobales.Asignaturas(_contexto.Conexion);
            ViewBag.Docentes = variablesGlobales.DocentesSede(sede, _contexto.Conexion);
            ViewBag.GruposGrado = variablesGlobales.GruposGrado(_contexto.Conexion);
            return View();
        }

        [HttpPost]
        public void RegistrarDocenteAsignatura(string asignaturas, string grupo, string dia, string hora)
        {

        }

        //El metodo se ejecutando desde una peticion AJAX llamada desde la vista en el script ValidacionLogin.js
        [HttpPost]
        public IActionResult GestionAsignaturas(string asignaturaSeleccionada, string docenteSeleccionado, string grupoSeleccionado)
        {

            string vista = "GestionAsignaturas";

            if (!string.IsNullOrEmpty(asignaturaSeleccionada) && !string.IsNullOrEmpty(docenteSeleccionado) && !string.IsNullOrEmpty(grupoSeleccionado))
            {
                ViewBag.AsignaturaSeleccionada = asignaturaSeleccionada;
                ViewBag.DocenteSeleccionado = docenteSeleccionado;
                ViewBag.GrupoSeleccionado = grupoSeleccionado;

                if (consultasValidacionesBD.ExisteDocenteAsignaturaGradoGrupo(docenteSeleccionado, asignaturaSeleccionada, grupoSeleccionado, _contexto.Conexion))
                {
                    //No se hace nada porque el docente ya esta asignado
                }
                else
                {
                    VerificacionRegistrosDocenteGrado(docenteSeleccionado, grupoSeleccionado);
                    VerificacionRegistrosDocenteAsignatura(docenteSeleccionado, asignaturaSeleccionada);
                    VerificacionRegistrosAsignaturaGradoGrupo(asignaturaSeleccionada, grupoSeleccionado);

                    //return RedirectToAction("CargarCsv", "Funcionario");
                    vista = "CargarCsv";
                }

            }

            //no redirecciona a la vista indicada por que el boton que se relaciona al metodo no lo esta ejecutando y esta redireccionando a otra vista
            return RedirectToAction(vista, "Funcionario");

        }

        [HttpPost]
        public IActionResult gestionCompetencias(string nombreCompetencia, string objetivoCompetencia, string detalleComepetencia, string asignaturaSeleccionada)
        {
            if (consultasValidacionesBD.ExisteCompetenciaAsignatura(asignaturaSeleccionada, nombreCompetencia, _contexto.Conexion))
            {
                //No se hace nada porque el docente ya esta asignado
            }
            else
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {                        
                        { "nomCompetencia", nombreCompetencia },
                        { "objCompetencia", objetivoCompetencia },
                        { "competenciaDetalle", detalleComepetencia },
                        { "nomAsignatura", asignaturaSeleccionada },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarCompetenciasAsignatura", parametros, _contexto.Conexion);

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }

            return RedirectToAction("GestionAsignaturas", "Funcionario");
        }

        public IActionResult gestionCertificados()
        {
            //var sede = TempData["sedeGestionCertificado"];
            //var grupo = TempData["grupoGestionCertificado"];

            //if (variablesGlobales.Sedes(_contexto.Conexion) != null && variablesGlobales.GruposGrado(_contexto.Conexion) != null)
            //{
            //    ViewBag.GruposGrado = variablesGlobales.GruposGrado(_contexto.Conexion);
            //    ViewBag.Sedes = variablesGlobales.Sedes(_contexto.Conexion);

            //    //muestra todos los estudiantes de la institucion
            //    ViewBag.ListaEstudiante = consultasGlobales.mostrarCsv(_contexto.Conexion, null, null);
            //}

            //if (sede != null)
            //{
            //    //muestra los estudiantes por sede
            //    ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), null);
            //    //ViewBag.GruposGrado = variablesGlobales.GruposGradoSede(Convert.ToString(sede), _contexto.Conexion);
            //    ViewBag.SedeSeleccionada = sede;

            //    if (grupo != null)
            //    {
            //        //muestra los estudiantes por grupo de sede
            //        ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), Convert.ToString(grupo));
            //        ViewBag.GrupoSeleccionado = grupo;
            //    }

            //    Console.WriteLine("sede: " + temp.algo );
            //    Console.WriteLine(grupo);
            //}

            return View();
        }

        [HttpPost]
        public IActionResult obtenerEstudiantesGestionCertificados(string Sede, string Grupo)
        {
            if (!string.IsNullOrEmpty(Sede))
            {
                TempData["grupoGestionCertificado"] = Grupo;
                TempData["sedeGestionCertificado"] = Sede;
            }

            return RedirectToAction("gestionCertificados", "Funcionario");
        }

        public void obtenerIdentificacionEstudiante(string idEstudiante)
        {
            DatosCompartidos.IdentificacionEstudiante = idEstudiante;
        }

        public List<Object> ObtenerCodigoEstudiante(long identificacion)
        {
            /*Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                // Definir aqui parametros y valores
                { "identificacionUs", identificacion },
                // ...
            };*/

            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                // Definir aqui atributos y tipos esperados
                { "CodigoEstudiante", typeof(long) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;
                                    
            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "obtenerCodigoEstudiantes";
            string nombreParametro = "identificacionUs";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificacion, numeroAtributos, _contexto.Conexion);           
            return resultados;
        }

        public void VerificacionRegistrosEPS(string nombreEps)
        {
            if (nombreEps == "" || consultasValidacionesBD.ExisteEPS(nombreEps, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarEPS", "nomEPS", nombreEps, _contexto.Conexion);
            }
        }

        public void VerificacionRegistrosTipoSangre(string nombreTpSangre)
        {
            if (nombreTpSangre == "" || consultasValidacionesBD.ExisteTipoSangre(nombreTpSangre, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarTipoSangre", "nomTpSangre", nombreTpSangre, _contexto.Conexion);
            }
        }
        
        public void VerificacionRegistrosTipoDocumento(string nombreTpDocumento)
        {
            if (nombreTpDocumento == "" || consultasValidacionesBD.ExisteTipoDocumento(nombreTpDocumento, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarTipoDocumento", "nomTpDocumento", nombreTpDocumento, _contexto.Conexion);
            }
        }

        public void VerificacionRegistrosDiscapacidades(string nombreDiscapacidad)
        {
            if (nombreDiscapacidad == "" || consultasValidacionesBD.ExisteDiscapacidad(nombreDiscapacidad, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarDiscapacidad", "nomDiscapacidad", nombreDiscapacidad, _contexto.Conexion);
            }
        }
        
        public void VerificacionRegistrosGenero(string nombreGenero)
        {
            if (nombreGenero == "" || consultasValidacionesBD.ExisteGenero(nombreGenero, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarGenero", "nomGenero", nombreGenero, _contexto.Conexion);
            }
        }
         
        public void VerificacionRegistrosSisben(string nombreSisben)
        {
            if (nombreSisben == "" || consultasValidacionesBD.ExisteSisben(nombreSisben, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarSisben", "nomSisben", nombreSisben, _contexto.Conexion);
            }
        }
         
        public void VerificacionRegistrosSede(string nombreSede)
        {
            if (nombreSede == "" || consultasValidacionesBD.ExisteSede(nombreSede, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarSede", "nomSede", nombreSede, _contexto.Conexion);
            }
        }
         
        public void VerificacionRegistrosGrado(string nombreGrado)
        {
            string grado = consultasGlobales.organizarValorGradoSimat(nombreGrado);

            if (grado == "" || consultasValidacionesBD.ExisteGrado(grado, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarGrado", "nomGrado", grado, _contexto.Conexion);
            }
        }
         
        public void VerificacionRegistrosGrupoGrado(string nombreGrado, string nombreGradoGrupo)
        {
            string grupo = consultasGlobales.organizarValorGrupoSimat(nombreGradoGrupo);
            string grado = consultasGlobales.organizarValorGradoSimat(nombreGrado);

            if (grupo == "" || grado == "" || consultasValidacionesBD.ExisteGrupoGrado(grupo, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "nomGrado",  grado },
                        { "nomGradoGrupo", grupo }, 
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarGradoGrupo", parametros, _contexto.Conexion);

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
                
                Console.WriteLine(grupo);
            }
        }
         
        public void VerificacionRegistrosSedeGrado(string nombreSede, string nombreGrado)
        {
            string grado = consultasGlobales.organizarValorGradoSimat(nombreGrado);

            if (grado == "" || nombreSede == "" || consultasValidacionesBD.ExisteSedeGrado(nombreSede, grado, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {                        
                        { "nomSede", nombreSede },
                        { "nomGrado", grado },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarSedeGrado", parametros, _contexto.Conexion);

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }
        }
         
        public void VerificacionRegistrosEstudianteGrupoGrado(string identificacionEst, string grupoGrado)
        {
            string grupo = consultasGlobales.organizarValorGrupoSimat(grupoGrado);

            if (identificacionEst == "" || grupo == "" || consultasValidacionesBD.ExisteEstudianteGrupoGrado(identificacionEst, grupo, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {                        
                        { "identificacionEst", identificacionEst },
                        { "grupoGrado", grupo },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarEstudiantesGradoGrupo", parametros, _contexto.Conexion);

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }
        }

         
        public void VerificacionRegistrosDocenteGrado(string nombreDocente, string nomGrupo)
        {
            string grupo = consultasGlobales.organizarValorGrupoSimat(nomGrupo);

            if (nombreDocente == "" || grupo == "" || consultasValidacionesBD.ExisteDocenteGrado(nombreDocente, grupo, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {                        
                        { "nombreDocente", nombreDocente },
                        { "nomGrupo", grupo },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarDocenteGrado", parametros, _contexto.Conexion);

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }
        }
           
        public void VerificacionRegistrosDocenteAsignatura(string nombreDocente, string asignatura)
        {
            if (nombreDocente == "" || asignatura == "" || consultasValidacionesBD.ExisteDocenteAsignatura(nombreDocente, asignatura, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {                        
                        { "nombreDocente", nombreDocente },
                        { "asignatura", asignatura },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarDocenteAsignatura", parametros, _contexto.Conexion);

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }
        }

           
        public void VerificacionRegistrosAsignaturaGradoGrupo(string nomAsignatura, string grupoGrado)
        {
            string grupo = consultasGlobales.organizarValorGrupoSimat(grupoGrado);

            if (nomAsignatura == "" || grupo == "" || consultasValidacionesBD.ExisteAsignaturaGradoGrupo(nomAsignatura, grupo, _contexto.Conexion) == true)
            {
                return;
            }
            else
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {                        
                        { "nomAsignatura", nomAsignatura },
                        { "grupoGrado", grupo },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarAsignaturaGradoGrupo", parametros, _contexto.Conexion);

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }
        }


        public string actualizarTitularGrupo(int documento, string grupoRef)
        {
            string bandera = "";  
            if (documento != 0 && !string.IsNullOrEmpty(grupoRef))
            {
                try
                {

                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "idDocenteRef", documento },
                        { "grupoRef", grupoRef },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("ActualizarDocentesTitularGrupo", parametros, _contexto.Conexion);
                    bandera = "1";  


                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }

            return bandera; 
        }

        public JsonResult ObtenerDocentesTitularGrupo(long documento)
        {
            List<object> grupo = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "documento", documento },
            };

            int grupoAtributosEsperadosGrupo = 2;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerDocentesTitularGrupo", parametros, grupoAtributosEsperadosGrupo, _contexto.Conexion);

            foreach (var item in resultados)
            {
                grupo.Add(item);
            }

            return Json(grupo);
        }

        public JsonResult ObtenerGruposSinTitular(int idGradoRef)
        {
            List<Object> grupos = new List<Object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "idGradoRef", idGradoRef },
            };

            int grupoAtributosEsperadosGrupo = 2;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerGrupoSinTitular", parametros, grupoAtributosEsperadosGrupo, _contexto.Conexion);

            foreach (var item in resultados)
            {
                grupos.Add(item);
            }

            return Json(grupos);
        }
    }

}
