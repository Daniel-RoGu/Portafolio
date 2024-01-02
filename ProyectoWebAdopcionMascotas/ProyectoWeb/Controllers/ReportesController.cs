using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.pdf;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using iText.Kernel.Colors;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace ProyectoWeb.Controllers
{
    public class ReportesController : Controller
    {

        private readonly Contexto _contexto;

        public static string TpMascota { get; set; }
        public static string razaM { get; set; }
        public static string generoM { get; set; }
        public static string estadoM { get; set; }
        public static int edadM { get; set; }

        public ReportesController(Contexto contexto)
        {
            _contexto = contexto;
        }


        public FileResult GenerarPdf()
        {
            // Crear un nuevo documento
            Document doc = new Document();

            byte[] buffer;


            using (MemoryStream ms = new MemoryStream())
            {

                PdfWriter.GetInstance(doc, ms);
                doc.Open();
                Paragraph title = new Paragraph("Reporte Solicitudes");
                title.Alignment = Element.ALIGN_CENTER;
                doc.Add(title);

                Paragraph espacio = new Paragraph(" ");
                doc.Add(espacio);


                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "reporte_adopciones";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                List<objectoadop> listadoadopciones = new List<objectoadop>();

                while (mySqlDataReader.Read())
                {

                    listadoadopciones.Add(new objectoadop
                    {
                        item0 = mySqlDataReader.GetString(0),
                        item1 = mySqlDataReader.GetString(1),
                        item2 = mySqlDataReader.GetString(2),
                        item3 = mySqlDataReader.GetString(3),
                        item4 = mySqlDataReader.GetString(4),
                        item5 = mySqlDataReader.GetString(5),
                        item6 = mySqlDataReader.GetString(6)
                    });
                }
                conexion.Close();


                PdfPTable table = new PdfPTable(7);

                List<string> titulos = new List<string>()
                {
                    "Dueño","Mascota","Solicitante","Fecha Inicio Adopción","Fecha Fin Adopción","Estado","Proceso"
                };



                for (int i = 0; i < 7; i++)
                {
                    PdfPCell celda1 = new PdfPCell(new Phrase(titulos[i]));
                    celda1.BackgroundColor = new BaseColor(130, 130, 130);
                    celda1.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                    table.AddCell(celda1);
                }

                for (int i = 0; i < listadoadopciones.Count; i++)
                {
                    table.AddCell(listadoadopciones[i].item0);
                    table.AddCell(listadoadopciones[i].item1);
                    table.AddCell(listadoadopciones[i].item2);
                    table.AddCell(listadoadopciones[i].item3);
                    table.AddCell(listadoadopciones[i].item4);
                    table.AddCell(listadoadopciones[i].item5);
                    table.AddCell(listadoadopciones[i].item6);
                }
                doc.Add(table);
                doc.Close();



                buffer = ms.ToArray();
            }

            return File(buffer, "application/pdf");
        }

        public FileResult Pdf_Mascotas_todas()
        {
            // Crear un nuevo documento
            Document doc = new Document();

            byte[] buffer;


            using (MemoryStream ms = new MemoryStream())
            {

                PdfWriter.GetInstance(doc, ms);
                doc.Open();
                Paragraph title = new Paragraph("Reporte Total Mascotas");
                title.Alignment = Element.ALIGN_CENTER;
                doc.Add(title);

                Paragraph espacio = new Paragraph(" ");
                doc.Add(espacio);


                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "reporte_mascota_todas";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                List<objectoadop> listado = new List<objectoadop>();

                while (mySqlDataReader.Read())
                {

                    listado.Add(new objectoadop
                    {
                        item0 = mySqlDataReader.GetString(0),
                        item1 = mySqlDataReader.GetString(1),
                        item2 = mySqlDataReader.GetString(2),
                        item3 = mySqlDataReader.GetString(3),
                        item4 = mySqlDataReader.GetString(4),
                        item5 = mySqlDataReader.GetString(5)
                    });
                }
                conexion.Close();


                PdfPTable table = new PdfPTable(6);

                List<string> titulos = new List<string>()
                {
                    "Mascota","Edad","Estado","Especie","Raza","Dueño"
                };



                for (int i = 0; i < 6; i++)
                {
                    PdfPCell celda1 = new PdfPCell(new Phrase(titulos[i]));
                    celda1.BackgroundColor = new BaseColor(130, 130, 130);
                    celda1.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                    table.AddCell(celda1);
                }

                for (int i = 0; i < listado.Count; i++)
                {
                    table.AddCell(listado[i].item0);
                    table.AddCell(listado[i].item1);
                    table.AddCell(listado[i].item2);
                    table.AddCell(listado[i].item3);
                    table.AddCell(listado[i].item4);
                    table.AddCell(listado[i].item5);
                }
                doc.Add(table);
                doc.Close();



                buffer = ms.ToArray();
            }

            return File(buffer, "application/pdf");
        }

        public FileResult Pdf_Mascotas_todas_filtro()
        {
            // Crear un nuevo documento
            Document doc = new Document();

            byte[] buffer;


            using (MemoryStream ms = new MemoryStream())
            {

                PdfWriter.GetInstance(doc, ms);
                doc.Open();
                Paragraph title = new Paragraph("Reporte Mascotas");
                title.Alignment = Element.ALIGN_CENTER;
                doc.Add(title);

                Paragraph espacio = new Paragraph(" ");
                doc.Add(espacio);
                List<objectoadop> listado = new List<objectoadop>();

                try
                {
                    MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                    conexion.Open();
                    String sql = "call reporte_mascota_filtro(@tipoMascota, @raza_mascota, @genero, @estado, @edad)";
                    MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                    conexionCommand.Parameters.AddWithValue("@tipoMascota", TpMascota);
                    conexionCommand.Parameters.AddWithValue("@raza_mascota", razaM);
                    conexionCommand.Parameters.AddWithValue("@genero", generoM);
                    conexionCommand.Parameters.AddWithValue("@estado", estadoM);
                    conexionCommand.Parameters.AddWithValue("@edad", edadM);
                    MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                    while (mySqlDataReader.Read())
                    {

                        listado.Add(new objectoadop
                        {
                            item0 = mySqlDataReader.GetString(0),
                            item1 = mySqlDataReader.GetString(1),
                            item2 = mySqlDataReader.GetString(2),
                            item3 = mySqlDataReader.GetString(3),
                            item4 = mySqlDataReader.GetString(4),
                            item5 = mySqlDataReader.GetString(5)
                        });
                    }
                    conexion.Close();
                }
                catch (Exception)
                {
                    throw;
                }

                PdfPTable table = new PdfPTable(6);

                List<string> titulos = new List<string>()
                {
                    "Mascota","Edad","Estado","Especie","Raza","Dueño"
                };



                for (int i = 0; i < 6; i++)
                {
                    PdfPCell celda1 = new PdfPCell(new Phrase(titulos[i]));
                    celda1.BackgroundColor = new BaseColor(130, 130, 130);
                    celda1.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                    table.AddCell(celda1);
                }

                for (int i = 0; i < listado.Count; i++)
                {
                    table.AddCell(listado[i].item0);
                    table.AddCell(listado[i].item1);
                    table.AddCell(listado[i].item2);
                    table.AddCell(listado[i].item3);
                    table.AddCell(listado[i].item4);
                    table.AddCell(listado[i].item5);
                }
                doc.Add(table);
                doc.Close();



                buffer = ms.ToArray();
            }

            return File(buffer, "application/pdf");
        }

        public FileResult Pdf_Usuarios()
        {
            // Crear un nuevo documento
            Document doc = new Document();

            byte[] buffer;


            using (MemoryStream ms = new MemoryStream())
            {

                PdfWriter.GetInstance(doc, ms);
                doc.Open();
                Paragraph title = new Paragraph("Reporte Usuarios");
                title.Alignment = Element.ALIGN_CENTER;
                doc.Add(title);

                Paragraph espacio = new Paragraph(" ");
                doc.Add(espacio);


                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "reporte_usuario";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                List<objectoadop> listado = new List<objectoadop>();

                while (mySqlDataReader.Read())
                {

                    listado.Add(new objectoadop
                    {
                        item0 = mySqlDataReader.GetString(0),
                        item1 = mySqlDataReader.GetString(1),
                        item2 = mySqlDataReader.GetString(2),
                        item3 = mySqlDataReader.GetString(3),
                        item4 = mySqlDataReader.GetString(4),
                        item5 = mySqlDataReader.GetString(5),
                        item6 = mySqlDataReader.GetString(6)
                    });
                }
                conexion.Close();


                PdfPTable table = new PdfPTable(7);

                List<string> titulos = new List<string>()
                {
                    "Usuario","Estado","Nombre","Apellido","Teléfono","Ubicación","Correo"
                };



                for (int i = 0; i < 7; i++)
                {
                    PdfPCell celda1 = new PdfPCell(new Phrase(titulos[i]));
                    celda1.BackgroundColor = new BaseColor(130, 130, 130);
                    celda1.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                    table.AddCell(celda1);
                }

                for (int i = 0; i < listado.Count; i++)
                {
                    table.AddCell(listado[i].item0);
                    table.AddCell(listado[i].item1);
                    table.AddCell(listado[i].item2);
                    table.AddCell(listado[i].item3);
                    table.AddCell(listado[i].item4);
                    table.AddCell(listado[i].item5);
                    table.AddCell(listado[i].item6);
                }
                doc.Add(table);
                doc.Close();



                buffer = ms.ToArray();
            }

            return File(buffer, "application/pdf");
        } 

        public FileResult Pdf_Personas()
        {
            // Crear un nuevo documento
            Document doc = new Document();

            byte[] buffer;


            using (MemoryStream ms = new MemoryStream())
            {

                PdfWriter.GetInstance(doc, ms);
                doc.Open();
                Paragraph title = new Paragraph("Reporte Personas");
                title.Alignment = Element.ALIGN_CENTER;
                doc.Add(title);

                Paragraph espacio = new Paragraph(" ");
                doc.Add(espacio);


                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "reporte_Persona";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                List<objectoadop> listado = new List<objectoadop>();

                while (mySqlDataReader.Read())
                {

                    listado.Add(new objectoadop
                    {
                        item0 = mySqlDataReader.GetString(0),
                        item1 = mySqlDataReader.GetString(1),
                        item2 = mySqlDataReader.GetString(2),
                        item3 = mySqlDataReader.GetString(3),
                        item4 = mySqlDataReader.GetString(4),
                        item5 = mySqlDataReader.GetString(5),
                        item6 = mySqlDataReader.GetString(6)
                    });
                }
                conexion.Close();


                PdfPTable table = new PdfPTable(7);

                List<string> titulos = new List<string>()
                {
                    "Nombre","Apellido","Edad","Teléfono","Ubicación","Correo","Tipo documento"
                };



                for (int i = 0; i < 7; i++)
                {
                    PdfPCell celda1 = new PdfPCell(new Phrase(titulos[i]));
                    celda1.BackgroundColor = new BaseColor(130, 130, 130);
                    celda1.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                    table.AddCell(celda1);
                }

                for (int i = 0; i < listado.Count; i++)
                {
                    table.AddCell(listado[i].item0);
                    table.AddCell(listado[i].item1);
                    table.AddCell(listado[i].item2);
                    table.AddCell(listado[i].item3);
                    table.AddCell(listado[i].item4);
                    table.AddCell(listado[i].item5);
                    table.AddCell(listado[i].item6);
                }
                doc.Add(table);
                doc.Close();



                buffer = ms.ToArray();
            }

            return File(buffer, "application/pdf");
        }

        [HttpPost]
        public void SetTipoMascota(string tpm)
        {
            TpMascota = tpm;
        }
                
        [HttpPost]
        public void SetRaza(string raza)
        {
            razaM = raza;
        }


        [HttpPost]
        public void SetGenero(string genero)
        {
            generoM = genero;
        }


        [HttpPost]
        public void SetEstado(string estado)
        {
            estadoM = estado;
        }

        [HttpPost]
        public void SetEdad(int edad)
        {
            edadM = edad;
        }

    }

}

public class objectoadop
{
        public string item0 { get; set; } = null!;
        public string item1 { get; set; } = null!;
        public string item2 { get; set; } = null!;
        public string item3 { get; set; } = null!;
        public string item4 { get; set; } = null!;
        public string item5 { get; set; } = null!;
        public string item6 { get; set; } = null!;
        public string item7 { get; set; } = null!;

}




