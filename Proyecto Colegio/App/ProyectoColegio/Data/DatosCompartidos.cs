namespace ProyectoColegio.Data
{
    public static class DatosCompartidos
    {
        private static string _miDato;
        private static string _sedeUsuario;
        private static string _nombreUsuario;
        private static string _rolUsuario;
        private static string _idEstudiante;
        private static string _rutaPdf;
        private static bool _habilitadorNota;
        private static List<string> _listaEstudiantesXGrupo = new List<string>();
        private static string _asignatura;
        private static string _grado;
        private static string _grupo;
        private static string _periodo;

        public static string MiDato
        {
            get { return _miDato; }
            set { _miDato = value; }
        }

        public static string IdentificacionEstudiante
        {
            get { return _idEstudiante; }
            set { _idEstudiante = value; }
        }
        
        public static string SedeUsuario
        {
            get { return _sedeUsuario; }
            set { _sedeUsuario = value; }
        }
        
        public static string NombreUsuario
        {
            get { return _nombreUsuario; }
            set { _nombreUsuario = value; }
        }
        
        public static string RolUsuario
        {
            get { return _rolUsuario; }
            set { _rolUsuario = value; }
        }

        public static string RutaPDF
        {
            get { return _rutaPdf; }
            set { _rutaPdf = value; }
        }

        public static bool HabilitarNotas
        {
            get { return _habilitadorNota; }
            set { _habilitadorNota = value; }
        }

        public static List<string> ListaEstudiantesXGrupo
        {
            get { return _listaEstudiantesXGrupo; }
            set { _listaEstudiantesXGrupo = value; }
        }

        public static string Asignatura
        {
            get { return _asignatura; }
            set { _asignatura = value; }
        }
        
        public static string Grado
        {
            get { return _grado; }
            set { _grado = value; }
        }
        
        public static string Grupo
        {
            get { return _grupo; }
            set { _grupo = value; }
        }
        
        public static string Periodo
        {
            get { return _periodo; }
            set { _periodo = value; }
        }

    }

}
