namespace ProyectoColegio.Models
{
    public class EstudianteBoletin
    {
        public string Nombre_estudiante { get; set; }
        public string Grado { get; set; }
        public string Grupo { get; set; }
        public string Sede { get; set; }
        public List<NotasEstudiante>? Notas_estudiante { get; set; }
    }

    public class Periodo
    {
        public string Nombre_periodo { get; set; }
        public string Nota_periodo { get; set; }
    }

    public class NotasEstudiante
    {
        public string Materia { get; set; }
        public string Inasistencia { get; set; }
        public string Carga_Horario { get; set; }
        public string Nota_final { get; set; }
        public List<Periodo>? Periodo { get; set; }
    }

}
