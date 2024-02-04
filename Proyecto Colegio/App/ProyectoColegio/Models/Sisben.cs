
namespace ProyectoColegio.Models
{
   
    public class Sisben
    {
        //private String nombreSisben { set; get; }
        private List<string> _puntajeSisben { set; get; }       
                
        public List<string> PuntajeSisben
        {
            get { return _puntajeSisben; }
            set { _puntajeSisben = value; }
        }
    }

}
