using System;
using System.Data;
using Microsoft.Office.Interop.Excel;
using static System.Net.Mime.MediaTypeNames;

namespace ProyectoColegio.Data
{
    public class LecturaExcel
    {
        static void Main(string[] args)
        {
            string filePath = "ruta/del/archivo.xlsx"; // Ruta de tu archivo Excel
            /*
            // Crear una aplicación Excel
            Application excelApp = new Application();
            Workbook excelWorkbook = excelApp.Workbooks.Open(filePath); // Abrir el archivo Excel
            Worksheet excelWorksheet = excelWorkbook.Sheets[1]; // Hoja de Excel (en este caso, la primera hoja)

            Range usedRange = excelWorksheet.UsedRange;

            // Crear una conexión a la base de datos SQL Server
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Leer datos de las columnas específicas del archivo Excel
                Range columnARange = usedRange.Columns["A"];
                Range columnBRange = usedRange.Columns["B"];
                Range columnCRange = usedRange.Columns["C"];

                object[,] valuesA = columnARange.Value2 as object[,];
                object[,] valuesB = columnBRange.Value2 as object[,];
                object[,] valuesC = columnCRange.Value2 as object[,];

                int rowCount = usedRange.Rows.Count;

                for (int row = 1; row <= rowCount; row++)
                {
                    string valueA = Convert.ToString(valuesA[row, 1]);
                    string valueB = Convert.ToString(valuesB[row, 1]);
                    string valueC = Convert.ToString(valuesC[row, 1]);
                    
                }

                connection.Close();
            }

            // Cerrar el archivo Excel y liberar recursos
            excelWorkbook.Close();
            excelApp.Quit();
            System.Runtime.InteropServices.Marshal.ReleaseComObject(excelApp);
            */
        }

    }

}

