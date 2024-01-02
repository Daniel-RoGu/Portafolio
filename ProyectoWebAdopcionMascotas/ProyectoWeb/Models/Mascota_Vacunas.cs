namespace ProyectoWeb.Models
{
    public class Mascota_Vacunas
    {
        public Mascota? fk_idMascota { get; set; }
        public Vacunas? fk_idVacuna { get; set; }

        public String? fechaVacuna { get; set; }    
    }
}
