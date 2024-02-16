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

namespace ProyectoColegio.Controllers
{
    public class FuncionarioController : Controller
    {
        //Funcionario funcionario = new Funcionario();
        private readonly Contexto _contexto;
        ManejoProcedimientos manejoProcedimientos = new ManejoProcedimientos();
        ConsultasValidacionesBD consultasValidacionesBD = new ConsultasValidacionesBD();

        public FuncionarioController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public IActionResult CargarCsv()
        {
            return View();
        }

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
                Delimiter = ";",
                HasHeaderRecord = true,
                Encoding = Encoding.GetEncoding("iso-8859-1")
            };

            // Leer el archivo CSV usando CsvHelper
            using (var reader = new StreamReader(tempFilePath, Encoding.GetEncoding("iso-8859-1"))) 
            using (var csv = new CsvReader(reader, csvConfig))
            {
                // Lee todos los registros a la vez
                var records = csv.GetRecords<InfoSimat>().ToList();

                // Agrega los registros a la lista
                info.AddRange(records);
            }

            // Eliminar el archivo temporal después de procesarlo si es necesario
            System.IO.File.Delete(tempFilePath);

            // Procesa la lista
            UsarCsv(info);
            
            //return RedirectToAction("Index", "Home");
            return RedirectToAction("CargarCsv", "Funcionario");

        }


        [HttpGet]
        public IActionResult mostrarCsv()
        {           
            List<Estudiante> Estudiantes = new List<Estudiante>();         
            
            try
            {
                foreach (Usuario item in mostrarInfoSimat())
                {
                    Estudiante Student = new Estudiante();
                    Student.Identificacion = item.Identificacion;
                    Student.Usuario.NombreUsuario = item.NombreUsuario;
                    Student.Usuario.SegundoNombreUsuario = item.SegundoNombreUsuario;
                    Student.Usuario.ApellidoUsuario = item.ApellidoUsuario;
                    Student.Usuario.SegundoApellidoUsuario = item.SegundoNombreUsuario;
                    Student.Usuario.Edad = item.Edad;
                    Student.Usuario.TelefonoCelular = item.TelefonoCelular;
                    Student.Usuario.TelefonoFijo = item.TelefonoFijo;
                    Student.Usuario.Correo = item.Correo;
                    Student.Usuario.Direccion = item.Direccion;
                    Student.Usuario.Barrio = item.Barrio;
                    Student.Usuario.FechaNacimiento = item.FechaNacimiento;
                    foreach (Object obj in ObtenerCodigoEstudiante(item.Identificacion))
                    {
                        Student.CodigoEstudiante = Convert.ToInt64(obj);
                    }                    
                    Student.Usuario.TipoSangre = item.TipoSangre;
                    Student.Usuario.TipoDocumento = item.TipoDocumento;
                    Student.Usuario.Discapacidad = item.Discapacidad;
                    Student.Usuario.Sisben = item.Sisben;
                    Student.Usuario.Genero = item.Genero;
                    Student.Usuario.EPS = item.EPS;
                    Student.Usuario.Estrato = item.Estrato;

                    Estudiantes.Add(Student);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            ViewBag.ListaEstudiante = Estudiantes;
            Console.WriteLine(Estudiantes);
            //return View("mostrarCsv", Estudiantes);
            return View();
        }


        public void UsarCsv(List<InfoSimat> datos)
        {           
            try
            {
                foreach (InfoSimat dato in datos)
                {
                    VerificacionRegistrosEPS(dato.EPS);
                    VerificacionRegistrosTipoSangre(dato.TIPO_DE_SANGRE);
                    VerificacionRegistrosTipoDocumento(dato.TIPODOC);
                    VerificacionRegistrosDiscapacidades(dato.DISCAPACIDAD);
                    VerificacionRegistrosGenero(dato.GENERO);
                    VerificacionRegistrosSisben(dato.SISBEN_IV);

                    if (consultasValidacionesBD.ExisteEstudiante(Convert.ToInt64(dato.DOC), _contexto.Conexion) == true)
                    {
                        //Construir mecanismo de alerta para generar el aviso ("Ya esta registrado");
                        return;
                    }
                    else
                    {
                        Dictionary<string, object> parametros = new Dictionary<string, object>
                        {
                            { "documento", dato.DOC },
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
                            { "asistenciaAcademicaEspecialEs", dato.APOYO_ACADEMICO_ESPECIAL ?? "Sin_Registro"},
                            { "desplazadoEstadoEs", "Sin_Registro" },
                        };                       
                        ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarEstudiante", parametros, _contexto.Conexion);
                    }                 
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        
        public List<Usuario> mostrarInfoSimat()
        {
            List<Usuario> usuarios = new List<Usuario>();

            Dictionary<string, Type> atributosEstudiante = new Dictionary<string, Type>
            {
                { "documento", typeof(long) },
                { "nomUsuario", typeof(string) },
                { "nom2Usuario", typeof(string) },
                { "apellidoUsuario", typeof(string) },
                { "apellido2Usuario", typeof(string) },
                { "edad", typeof(int) },
                { "telCelular", typeof(string) },
                { "telFijo", typeof(string) },
                { "correoUss", typeof(string) },
                { "direccionUss", typeof(string)  },
                { "barrioUss", typeof(string)  },
                { "fechaNacimientoUss", typeof(string) },
                { "estadoUss", typeof(string) },
                { "tipoSangre", typeof(string)  },
                { "tipoDocumento", typeof(string)  },
                { "nombreDiscapacidad", typeof(string)  },
                { "nombreSisben", typeof(string)  },
                { "nombreGenero", typeof(string)  },
                { "nombreEps", typeof(string)  },
                { "nombreEstrato", typeof(string)  },
                //{ "codigoStudent", typeof(string) },
                //{ "ciudadNacimientoEs", typeof(string)  },
                //{ "ciudadResidenciaEs", typeof(string)  },
                ////{ "ciudadExpedicionDocumentoEs", typeof(string)  },
                ////{ "paisOrigenEs", typeof(string)  },
                //{ "asistenciaAcademicaEspecialEs", typeof(string)  },
                //{ "desplazadoEstadoEs", typeof(string)  },
            };
                   
            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("MostrarEstudiantes", atributosEstudiante, _contexto.Conexion);
            
            //numero de atributos del diccionario
            int cantidadAtributos = atributosEstudiante.Count;

            //Esta contando el grupo de registros totales de resultado
            foreach (List<Object> item in resultados)
            {
                
                int cont = 0;

                //i < resultados.Count por que es el conjunto de datos que obtenidos desde la base de datos
                //cont =+cantidadAtributos "20" por que es el numero de atributos que configura el objeto usuario (numero registrado en el diccionario "atributosEstudiante") 
                for (int i=0; i < resultados.Count; i++)
                {
                    Usuario usuario = new Usuario();
                    usuario.Identificacion = (Convert.ToInt64(item[cont]));
                    usuario.NombreUsuario = Convert.ToString(item[cont + 1]);
                    usuario.SegundoNombreUsuario = Convert.ToString(item[cont + 2]);
                    usuario.ApellidoUsuario = Convert.ToString(item[cont + 3]);
                    usuario.SegundoApellidoUsuario = Convert.ToString(item[cont + 4]);
                    usuario.Edad = Convert.ToInt16(item[cont + 5]);
                    usuario.TelefonoCelular = Convert.ToString(item[cont + 6]);
                    usuario.TelefonoFijo = Convert.ToString(item[cont + 7]);
                    usuario.Correo = Convert.ToString(item[cont + 8]);
                    usuario.Direccion = Convert.ToString(item[cont + 9]);
                    usuario.Barrio = Convert.ToString(item[cont + 10]);
                    usuario.FechaNacimiento = Convert.ToString(item[cont + 11]);
                    usuario.EstadoUsuario = Convert.ToString(item[cont + 12]);
                    usuario.TipoSangre = Convert.ToString(item[cont + 13]);
                    usuario.TipoDocumento = Convert.ToString(item[cont + 14]);
                    usuario.Discapacidad = Convert.ToString(item[cont + 15]);
                    usuario.Sisben = Convert.ToString(item[cont + 16]);
                    usuario.Genero = Convert.ToString(item[cont + 17]);
                    usuario.EPS = Convert.ToString(item[cont + 18]);
                    usuario.Estrato = Convert.ToString(item[cont + 19]);

                    usuarios.Add(usuario);
                    cont+=cantidadAtributos;
                }

                Console.WriteLine(usuarios);
                
            }

            return usuarios; 
        }

        public IActionResult registrarFamiliar(string identificacion)
        {
            ViewBag.Identificacion = Convert.ToInt64(identificacion);
            return View();
        }

        [HttpPost]
        public IActionResult registrarFamiliar(Familiar familiar) {
            try
            {

                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "identificacionFamiliarEs", familiar.identificacionFamiliar },
                    { "nombreFamiliarEs", familiar.nombresFamiliar },
                    { "apellidoFamiliarEs", familiar.apellidosFamiliar },
                    { "correoFamiliarEs", familiar.correoFamiliar },
                    { "celularFamiliarEs", familiar.celularFamiliar },
                    { "parentescoFamiliarEs", familiar.parentescoFamiliar },
                    { "responsabilidadEconomicaFamiliarEs", familiar.responsabilidadEconomicaEstudiante },
                    { "generoFamiliarEs", familiar.genero },
                    { "identificacionEstudianteEs", familiar.identificacionEstudiante },
                            
                };

                ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarFamiliar", parametros, _contexto.Conexion);

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
            return RedirectToAction("mostrarCsv", "Funcionario");
        }

        public IActionResult registrarObservacion(string identificacionEst)
        {
            ViewBag.IdentificacionEstudiante = Convert.ToInt64(identificacionEst);
            ViewBag.IdentificacionFuncionario = Convert.ToInt64("12368974"); //modificar la forma de aignar la identificacion del funcionario
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

    }

}
