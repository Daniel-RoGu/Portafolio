using ProyectoColegio.Models;

namespace ProyectoColegio.Data
{
    public class VariablesGlobales
    {

        private List<InfoSimat> infoGlobal = new List<InfoSimat>();

        public List<InfoSimat> InfoGlobal
        {
            get { return infoGlobal; }
            set { infoGlobal = value; }
        }

    }
}
