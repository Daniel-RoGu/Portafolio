namespace ProyectoColegio.Data
{
    public static class DatosCompartidos
    {
        private static string _miDato;
        private static string _idEstudiante;
        private static string _rutaPdf;

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
        public static string RutaPDF
        {
            get { return _rutaPdf; }
            set { _rutaPdf = value; }
        }
    }

}
