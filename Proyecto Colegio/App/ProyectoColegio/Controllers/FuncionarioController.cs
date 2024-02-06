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
        private readonly Contexto _contexto;
        ManejoProcedimientos manejoProcedimientos = new ManejoProcedimientos();

        
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
                        Command.Parameters.AddWithValue("documento", dato.DOC);
                        Command = new MySqlCommand("registrarEstudiante", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("documento", dato.DOC);
                        Command.Parameters.AddWithValue("documento", dato.DOC);
                        Command.Parameters.AddWithValue("nomUsuario", dato.NOMBRE1);
                        Command.Parameters.AddWithValue("nom2Usuario", dato.NOMBRE2);
                        Command.Parameters.AddWithValue("apellidoUsuario", dato.APELLIDO1);
                        Command.Parameters.AddWithValue("apellido2Usuario", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("edad", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("telCelular", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("telFijo", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("correoUss", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("direccionUss", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("barrioUss", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("fechaNacimientoUss", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("tipoSangre", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("tipoDocumento", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("nombreDiscapacidad", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("nombreSisben", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("nombreGenero", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("nombreEps", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("nombreEstrato", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("nombreRol", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("identificacionAcudienteEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("nombreAcudienteEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("apellidoAcudienteEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("generoAcudienteEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("correoAcudienteEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("celularAcudienteEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("parentescoAcudienteEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("responsabilidadEconomicaAcudienteEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("codigoStudent", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("ciudadNacimientoEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("ciudadResidenciaEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("ciudadExpedicionDocumentoEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("paisOrigenEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("asistenciaAcademicaEspecialEs", dato.APELLIDO2);
                        Command.Parameters.AddWithValue("desplazadoEstadoEs", dato.APELLIDO2);
                        Command.ExecuteNonQuery();
                    }
                    Console.WriteLine(dato);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }

            /*
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
            */


            //List<object> listaObjetos = new List<object>();
            //object datoPrueba = new object();

            //foreach (var dato in datos)
            //{
            //    /*
            //    listaObjetos.Add(dato);
            //    manejoProcedimientos.LlenarListaDatos(listaObjetos);
            //    */
            //    datoPrueba = dato.NOMBRE1;
            //    listaObjetos.Add(datoPrueba);
            //    manejoProcedimientos.LlenarListaDatos(listaObjetos);
            //}
            //manejoProcedimientos.TratamientoListasDatos(manejoProcedimientos.RetornarListaDatos(), "registrarTipoSangre", manejoProcedimientos.ListaParametros(manejoProcedimientos.Parametro("registrarTipoSangre")));

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
