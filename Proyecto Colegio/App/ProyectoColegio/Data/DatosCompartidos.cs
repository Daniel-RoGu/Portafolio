namespace ProyectoColegio.Data
{
    public static class DatosCompartidos
    {
        private static string _miDato;

        public static string MiDato
        {
            get { return _miDato; }
            set { _miDato = value; }
        }
    }

}
