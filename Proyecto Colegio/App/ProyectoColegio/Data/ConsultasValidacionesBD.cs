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
        
        public bool ExisteSede(string nombreSede, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeSede";
            string nombreParametro = "nomSede";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreSede, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }
        
        public bool ExisteGrado(string nombreGrado, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeGrado";
            string nombreParametro = "nomGrado";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreGrado, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }
        
        public bool ExisteGrupoGrado(string nombreGradoGrupo, string conexion)
        {

            bool existe = false;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "existeGrupoGrado";
            string nombreParametro = "nomGradoGrupo";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, nombreGradoGrupo, 1, conexion);
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }
        
        public bool ExisteSedeGrado(string nombreSede, string nombreGrado, string conexion)
        {

            bool existe = false;

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                { "nomSede", nombreSede },
                { "nomGrado", nombreGrado },
            };

            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("existeSedeGrado", parametros, 1, conexion);
            
            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }

        public bool ExisteEstudianteGrupoGrado(string identificacionEst, string grupoGrado, string conexion)
        {

            bool existe = false;

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                { "identificacionEst", identificacionEst },
                { "grupoGrado", grupoGrado },
            };

            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("existeEstudianteGrupoGrado", parametros, 1, conexion);

            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }

        public bool ExisteMatricula(string identificacionEst, string identificacionFunc, string nombreSede, string conexion)
        {

            bool existe = false;

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                { "identificacionEst", identificacionEst },
                { "identificacionFuncionario", identificacionFunc },
                { "nomSede", nombreSede },
            };

            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("existeMatricula", parametros, 1, conexion);

            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }
        
        public bool ExisteModalidadEducativa(string nombreModalidadEducativa, string conexion)
        {

            bool existe = false;

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                { "nomModalidad", nombreModalidadEducativa },
            };

            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("existeModalidad", parametros, 1, conexion);

            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }

        public bool ExisteDocente(long identificacion, string conexion)
        {
            bool existe = false;

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                { "identificacionDocente", Convert.ToString(identificacion) },
            };

            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("existeDocente", parametros, 1, conexion);

            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }
        
        public bool ExisteDocenteGrado(long identificacion, string grupoGrado, string conexion)
        {
            bool existe = false;

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                { "identificacionDocente", identificacion },
                { "nomGrado", grupoGrado },
            };

            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("existeDocenteGrado", parametros, 1, conexion);

            foreach (Object obj in resultados)
            {
                existe = Convert.ToBoolean(Convert.ToInt16(obj));
            }
            return existe;
        }

    }
}
