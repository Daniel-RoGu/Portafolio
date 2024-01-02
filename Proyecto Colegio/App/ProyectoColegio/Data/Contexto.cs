namespace ProyectoColegio.Data
{
    public class Contexto
    {
        public string Conexion { get; set; }

        public Contexto(String valor)
        {
            Conexion = valor;
        }
    }
}
