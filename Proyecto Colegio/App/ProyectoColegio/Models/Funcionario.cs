namespace ProyectoColegio.Models
{
    public class Funcionario
    {
        private Usuario _usuario = new Usuario();
        private String _estado;
        private String? _firma;
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

        public Usuario Usuario { 
            get { return _usuario; }
            set { _usuario = value; }
        }
    }
}
