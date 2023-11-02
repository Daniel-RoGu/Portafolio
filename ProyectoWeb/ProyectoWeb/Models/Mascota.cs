namespace ProyectoWeb.Models
{
    public class Mascota
    {
        public int idMascota { get; set; }

        public string? nombreMascota { get; set; }

        public int? edadMascota { get; set; }

        public int? pesoMascota { get; set; }

        public string? generoMascota { get; set; }

        public string? observaciones { get; set; }

        public string? estadoMascota { get; set; }

        public int fk_idRaza { get; set; }
        public string? raza { get; set; }
        public int fk_idTipo_Mascota { get; set; }
        public string? tpmascota { get; set; }
        public int fk_idUsuario { get; set; }
        public string? dueno { get; set; }
        public string? imagen { get; set; }





    }
}
