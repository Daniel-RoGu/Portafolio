using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class SisbenController : Controller
    {
        private readonly Contexto _contexto;
        List<string> datos = null;
        Sisben sisben = new Sisben();


        public SisbenController(Contexto contexto)
        {
            _contexto = contexto;
        }

        /*
        [STAThread]
        public List<string> LeerSisben()
        {
            List<string> datos = null;

            // Crear el motor y el alcance
            ScriptEngine engine = IronPython.Hosting.Python.CreateEngine();
            ScriptRuntime runtime = engine.Runtime;
            ScriptScope scope = runtime.CreateScope();

            // Ejecutar el script y obtener el resultado
            ScriptSource script = engine.CreateScriptSourceFromFile("InsercionSisben.py");
            try
            {
                datos = script.Execute<List<string>>(scope);

                // Verificar si hay un resultado y mostrarlo
                if (datos != null)
                {
                    Console.WriteLine($"Resultado del script: {string.Join(", ", datos)}");
                }
                else
                {
                    Console.WriteLine("Conexion al script fallida");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
            finally
            {
                // Cerrar el motor
                runtime.Shutdown();
            }

            return datos;
        }
        */

        public List<string> LeerSisben()
        {
            //List<string> datos = null;
            LecturaJson lecturaJson = new LecturaJson();

            //datos = lecturaJson.Resultado("Archivos_Json/PuntajeSisben.json");
            sisben.setPuntaje_Sisben(lecturaJson.Resultado("Archivos_Json/PuntajeSisben.json"));

            //return datos;
            return (sisben.getPuntaje_Sisben());
        }


        public IActionResult RegistrarSisben()
        { 
            return View();
        }


        [HttpPost]
        public IActionResult RegistrarSisben(Sisben sisben)
        {
            //LeerSisben();

            try
            {
                
                foreach (string dato in LeerSisben())
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarSisben", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomSisben", dato);
                        Command.ExecuteNonQuery();
                    }
                    Console.WriteLine(dato);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }           
            

            return RedirectToAction("Index", "Home");
        }


    }

}
