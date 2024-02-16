namespace ProyectoColegio.Models
{
    public class Asignatura
    {
        
        private List<string>? _asignatura { get; set; }

        public List<string> Asignaturas
        {
            get { return _asignatura; }
            set { _asignatura = value; }
        }


    }
}
