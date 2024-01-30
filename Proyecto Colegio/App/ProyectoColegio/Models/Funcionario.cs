namespace ProyectoColegio.Models
{
    public class Funcionario
    {
        Usuario usuario = new Usuario();

        private String _estado;
        private String _firma;
        private int _identificacionSede;

        public String Estado
        {
            get { return _estado; }
            set { _estado = value; }
        }

        public String Firma
        {
            get { return _firma; }
            set { _firma = value; }
        }

        public int IdentificacionSede
        {
            get { return _identificacionSede; }
            set { _identificacionSede = value; }
        }
    }
}
