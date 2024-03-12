using System.Reflection;
using System.Runtime.Loader;

namespace ProyectoColegio.Extension
{
    //Clase necesaria para el instanciamiento de metodos de la libreria para generar PDF
    public class CustomAssemblyLoadContext: AssemblyLoadContext
    {
        public IntPtr LoadUnmanagedLibrary(string absolutePath) 
        {
            return LoadUnmanagedDll(absolutePath);
        }
        protected override IntPtr LoadUnmanagedDll(string unmanagedDllName)
        {
            return LoadUnmanagedDllFromPath(unmanagedDllName);
        }

        protected override Assembly Load(AssemblyName assemblyName) 
        {
            throw new NotImplementedException();
        }

    }
}
