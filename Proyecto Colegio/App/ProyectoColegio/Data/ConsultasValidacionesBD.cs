using ProyectoColegio.Data;

namespace ProyectoColegio.Data
{
    public class ConsultasValidacionesBD
    {
        public bool ExisteEstudiante(long identificacion, string conexion) {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeEstudiante";
            string nombreParametro = "identificacionUs";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificacion, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }

        public bool ExisteEPS(string nombreEps, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeEPS";
            string nombreParametro = "nomEps";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreEps, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }

        public bool ExisteTipoSangre(string nombreTpSangre, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeTpSangre";
            string nombreParametro = "nomTpSangre";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreTpSangre, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }

        public bool ExisteTipoDocumento(string nombreTpDocumento, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeTpDocumento";
            string nombreParametro = "nomTpDocumento";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreTpDocumento, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }
        
        public bool ExisteDiscapacidad(string nombreDiscapacidad, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeDiscapacidad";
            string nombreParametro = "nomDiscapacidad";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreDiscapacidad, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }
        
        public bool ExisteGenero(string nombreGenero, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeGenero";
            string nombreParametro = "nomGenero";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreGenero, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }
        
        public bool ExisteSisben(string nombreSisben, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeSisben";
            string nombreParametro = "nomSisben";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreSisben, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }

    }
}
