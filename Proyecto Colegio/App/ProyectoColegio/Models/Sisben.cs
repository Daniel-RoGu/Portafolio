
namespace ProyectoColegio.Models
{
   
    public class Sisben
    {
        //private String nombreSisben { set; get; }
        private List<string>? Puntaje_Sisben { set; get; }       
        
        public List<string> getPuntaje_Sisben()
        {
            return this.Puntaje_Sisben;
        }

        public void setPuntaje_Sisben(List<string> datos)
        {
            this.Puntaje_Sisben = datos;
        }
    }

}
