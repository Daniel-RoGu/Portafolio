namespace ProyectoWeb.Models
{
    public class Adopcion
    {
        public int idAdopcion { get; set; }
        public string? fechaInicioAdopcion { get; set; }
        public string? fechaFinAdopcion { get; set; }
        public string? estadoAdopcion { get; set; }
        public int? fk_idMascota { get; set; }
        public string? nombreMascota { get; set; }
        public string? nombreUsuario { get; set; }
        public string? telefono { get; set; }
        public bool? Aprobar { get; set; }
        public bool? Rechazar { get; set; }
    }
}
