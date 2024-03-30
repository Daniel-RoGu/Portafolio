namespace ProyectoColegio.Models
{
    public class Clase
    {
        public string rango { get; set; }
        public List<Dia> dias { get; set;}
    }

    public class Dia {
        public string diaSemana {
            get; set;
        }  
        public  Detalle detalleH { get; set; }
    
    }

    public class Detalle {
        public string MateriaHorario { get; set; } 
        public string DocenteHorario { get; set; }
    
    
    }
}
