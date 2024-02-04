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

namespace ProyectoColegio.Controllers
{
    public class FuncionarioController : Controller
    {
        Funcionario funcionario = new Funcionario();
        //InfoSimat infoCsv = new InfoSimat();
        private readonly Contexto _contexto;
        //private readonly IWebHostEnvironment _webHostEnvironment;

        public FuncionarioController(Contexto contexto)
        {
            _contexto = contexto;
        }

        //public FuncionarioController(IWebHostEnvironment webHostEnvironment)
        //{
        //    _webHostEnvironment = webHostEnvironment;
        //}


        public IActionResult CargarCsv()
        {        
            return View();
        }

        [HttpPost]
        public IActionResult CargarCsv(IFormFile file)
        {

            //string rutaArchivo = @"C:\Users\Daniel\Desktop\TrabajoColegio\Guia.csv";
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
            List<InfoCsv> info = new List<InfoCsv>();

            var csvConfig = new CsvConfiguration(CultureInfo.InvariantCulture)
            {
                Delimiter = ";",
                HasHeaderRecord = true,
            };

            // Leer el archivo CSV usando CsvHelper
            using (var reader = new StreamReader(tempFilePath))
            //using (var csv = new CsvReader(reader, new CsvHelper.Configuration.CsvConfiguration(System.Globalization.CultureInfo.InvariantCulture)))
            using (var csv = new CsvReader(reader, csvConfig))
            {
                // Lee todos los registros a la vez
                var records = csv.GetRecords<InfoCsv>().ToList();

                // Agrega los registros a la lista
                info.AddRange(records);
            }

            // Eliminar el archivo temporal después de procesarlo si es necesario
            System.IO.File.Delete(tempFilePath);

            // Procesa la lista
            UsarCsv(info);

            return View();
        }

        public void UsarCsv(List<InfoCsv> datos)
        {

            try
            {

                foreach (InfoCsv dato in datos)
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarTipoSangre", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomTpSangre", dato.NOMBRE1);
                        Command.ExecuteNonQuery();
                    }
                    Console.WriteLine(dato);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }

        }       

        public class InfoCsv
        {
            [Name("ANO")]
            public int? ANO { get; set; }

            [Name("ETC")]
            public String? ETC { get; set; }

            [Name("ESTADO")]
            public String? ESTADO { get; set; }

            [Name("JERARQUIA")]
            public String? JERARQUIA { get; set; }

            [Name("INSTITUCION")]
            public String? INSTITUCION { get; set; }
            
            [Name("DANE")]
            public String? DANE { get; set; }

            [Name("CALENDARIO")]
            public String? CALENDARIO { get; set; }

            [Name("SECTOR")]
            public String? SECTOR { get; set; }

            [Name("SEDE")]
            public String? SEDE { get; set; }
            
            [Name("CODIGO_DANE_SEDE")]
            public String? CODIGO_DANE_SEDE { get; set; }

            [Name("CONSECUTIVO")]
            public String? CONSECUTIVO { get; set; }

            [Name("ZONA_SEDE")]
            public String? ZONA_SEDE { get; set; }

            [Name("JORNADA")]
            public String? JORNADA { get; set; }

            [Name("GRADO_COD")]
            public int? GRADO_COD { get; set; }

            [Name("GRUPO")]
            public int? GRUPO { get; set; }

            [Name("MODELO")]
            public String? MODELO { get; set; }
            
            [Name("MOTIVO")]
            public String? MOTIVO { get; set; }

            [Name("FECHAINI")]
            public String? FECHAINI { get; set; }

            [Name("FECHAFIN")]
            public String? FECHAFIN { get; set; }

            [Name("NUI")]
            public String? NUI { get; set; }

            [Name("ESTRATO")]
            public String? ESTRATO { get; set; }

            [Name("SISBEN IV")]
            public String? SISBEN_IV { get; set; }

            [Name("PER_ID")]
            public int? PER_ID { get; set; }

            [Name("DOC")]
            public string? DOC { get; set; }

            [Name("TIPODOC")]
            public String? TIPODOC { get; set; }

            [Name("APELLIDO1")]
            public String? APELLIDO1 { get; set; }

            [Name("APELLIDO2")]
            public String? APELLIDO2 { get; set; }

            [Name("NOMBRE1")]
            public String? NOMBRE1 { get; set; }

            [Name("NOMBRE2")]
            public String? NOMBRE2 { get; set; }

            [Name("GENERO")]
            public String? GENERO { get; set; }

            [Name("FECHA_NACIMIENTO")]
            public String? FECHA_NACIMIENTO { get; set; }

            [Name("BARRIO")]
            public String? BARRIO { get; set; }

            [Name("EPS")]
            public String? EPS { get; set; }

            [Name("TIPO DE SANGRE")]
            public String? TIPO_DE_SANGRE { get; set; }

            [Name("MATRICULACONTRATADA")]
            public String? MATRICULACONTRATADA { get; set; }

            [Name("FUENTE_RECURSOS")]
            public String? FUENTE_RECURSOS { get; set; }

            [Name("INTERNADO")]
            public String? INTERNADO { get; set; }

            [Name("NUM_CONTRATO")]
            public String? NUM_CONTRATO { get; set; }

            [Name("APOYO_ACADEMICO_ESPECIAL")]
            public String? APOYO_ACADEMICO_ESPECIAL { get; set; }

            [Name("SRPA")]
            public String? SRPA { get; set; }

            [Name("DISCAPACIDAD")]
            public String? DISCAPACIDAD { get; set; }

            [Name("PAIS_ORIGEN")]
            public String? PAIS_ORIGEN { get; set; }

            [Name("CORREO")]
            public String? CORREO { get; set; }
        }

    }
}
