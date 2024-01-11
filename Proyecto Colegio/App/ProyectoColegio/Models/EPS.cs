namespace ProyectoColegio.Models
{
    public class EPS
    {
        private List<string>? EPSs { get; set; }

        public List<string> getEPSs()
        {
            return this.EPSs;
        }

        public void setEPSs(List<string> datos)
        {
            this.EPSs = datos;
        }
    }
}
