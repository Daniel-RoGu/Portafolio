using System;
using System.IO;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;

namespace ProyectoColegio.Data
{
    public class LecturaJson
    {
        private List<string> grupo = new List<string>();      

        
        public List<string> Resultado(string ruta)
        {

            try
            {
                // Leer el contenido del archivo JSON
                string jsonContent = File.ReadAllText(ruta);

                // Deserializar el JSON en un objeto DatosArchivo
                DatosArchivo datos = JsonConvert.DeserializeObject<DatosArchivo>(jsonContent);

                // Verificar si se obtuvo un objeto válido
                if (datos != null && datos.Datos != null)
                {
                    // Llenar la lista 'grupo' con los atributos del objeto 'Datos'
                    grupo = datos.Datos;

                    // Imprimir la lista
                    Console.WriteLine(grupo.Count);
                    foreach (string dato in grupo)
                    {
                        Console.WriteLine(dato);
                    }
                }
                else
                {
                    Console.WriteLine("El archivo JSON no tiene el formato esperado.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al procesar el archivo JSON: {ex.Message}");
            }

            return grupo;
        }

        public class DatosArchivo
        {
            public List<string> Datos { get; set; }
        }
       
       
    }

}
