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

namespace ProyectoColegio.Controllers
{
    public class FuncionarioController : Controller
    {
        Funcionario funcionario = new Funcionario();
        private readonly Contexto _contexto;
        int cont = 0;
        ManejoProcedimientos manejoProcedimientos = new ManejoProcedimientos();
        
        public FuncionarioController(Contexto contexto)
        {
            _contexto = contexto;
        }

        VariablesGlobales variablesGlobales = new VariablesGlobales();

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
                //Encoding = Encoding.UTF8, // Ajusta la codificación según la del archivo CSV
                Encoding = Encoding.GetEncoding("iso-8859-1")
            };

            // Leer el archivo CSV usando CsvHelper
            //using (var reader = new StreamReader(tempFilePath, Encoding.UTF8)) 
            using (var reader = new StreamReader(tempFilePath, Encoding.GetEncoding("iso-8859-1"))) 
            using (var csv = new CsvReader(reader, csvConfig))
            {
                // Lee todos los registros a la vez
                var records = csv.GetRecords<InfoSimat>().ToList();

                // Agrega los registros a la lista
                info.AddRange(records);
            }

            //TempData["InfoData"] = JsonConvert.SerializeObject(info);

            // Eliminar el archivo temporal después de procesarlo si es necesario
            System.IO.File.Delete(tempFilePath);

            // Procesa la lista
            UsarCsv(info);
            /*
            if (variablesGlobales.InfoGlobal != null)
            {
                return RedirectToAction("mostrarCsv", "Funcionario");
            }
            */
            return RedirectToAction("Index", "Home");

        }


        [HttpGet]
        public IActionResult mostrarCsv()
        {
            //List<InfoSimat> info = ViewBag.InfoData as List<InfoSimat>;
            
            return View(variablesGlobales.InfoGlobal);
        }

        public void UsarCsv(List<InfoSimat> datos)
        {           
            try
            {
                foreach (InfoSimat dato in datos)
                {
                    
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "documento", dato.DOC },
                        { "nomUsuario", dato.NOMBRE1 },
                        { "nom2Usuario", dato.NOMBRE2 },
                        { "apellidoUsuario", dato.APELLIDO1 },
                        { "apellido2Usuario", dato.APELLIDO2 },
                        { "edad", ManejoBaseDatos.CalcularEdad(dato.FECHA_NACIMIENTO) },
                        { "telCelular", null },
                        { "telFijo", null },
                        { "correoUss", dato.CORREO },
                        { "direccionUss", null },
                        { "barrioUss", dato.BARRIO },
                        { "fechaNacimientoUss", dato.FECHA_NACIMIENTO },
                        { "tipoSangre", dato.TIPO_DE_SANGRE },
                        { "tipoDocumento", dato.TIPODOC },
                        { "nombreDiscapacidad", dato.DISCAPACIDAD },
                        { "nombreSisben", dato.SISBEN_IV },
                        { "nombreGenero", dato.GENERO },
                        { "nombreEps", dato.EPS },
                        { "nombreEstrato", dato.ESTRATO },
                        { "codigoStudent", dato.PER_ID },
                        { "ciudadNacimientoEs", null },
                        { "ciudadResidenciaEs", null },
                        { "ciudadExpedicionDocumentoEs", null },
                        { "paisOrigenEs", dato.PAIS_ORIGEN },
                        { "asistenciaAcademicaEspecialEs", dato.APOYO_ACADEMICO_ESPECIAL },
                        { "desplazadoEstadoEs", null },
                    };
                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarEstudiante", parametros, _contexto.Conexion);

                    variablesGlobales.InfoGlobal.Add(dato);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
                
    }

}
