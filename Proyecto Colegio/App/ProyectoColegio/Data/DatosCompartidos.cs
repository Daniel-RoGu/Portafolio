using ProyectoColegio.Models;
using Microsoft.AspNetCore.Mvc;

namespace ProyectoColegio.Data
{
    public static class DatosCompartidos
    {
        private static string _miDato;
        private static string _sedeUsuario;
        private static string _nombreUsuario;
        private static string _rolUsuario;
        private static string _idEstudiante;
        private static string _rutaPdf;
        private static bool _habilitadorNota;
        private static List<string> _listaEstudiantesXGrupo = new List<string>();
        private static string _asignatura;
        private static string _grado;
        private static string _grupo;
        private static string _periodo;
        private static string _puestoPeriodo;
        private static EstudianteBoletin _datosNotas = new EstudianteBoletin();
        private static FileContentResult _firma;
        private static string _firmaRector;
        private static string _firmaSecretario;
        private static string _firmaTitular;
        private static string _firmaRestauranteEscolar;
        private static string _firmaResidenciaEscolar;
        private static string _firmaCafeteria;
        private static string _foto;
        private static List<Familiar> _familiares = new List<Familiar>();
        private static Usuario _estudianteCertificados = new Usuario();

        public static FileContentResult Firma
        {
            get { return _firma; }
            set { _firma = value; }
        }
        
        public static string FirmaSecretario
        {
            get { return _firmaSecretario; }
            set { _firmaSecretario = value; }
        }
        
        public static string FirmaCafeteria
        {
            get { return _firmaCafeteria; }
            set { _firmaCafeteria = value; }
        }
        
        public static string FirmaResidenciaEscolar
        {
            get { return _firmaResidenciaEscolar; }
            set { _firmaResidenciaEscolar = value; }
        }

        public static string FirmaRestauranteEscolar
        {
            get { return _firmaRestauranteEscolar; }
            set { _firmaRestauranteEscolar = value; }
        }

        public static string FirmaRector
        {
            get { return _firmaRector; }
            set { _firmaRector = value; }
        }
        
        public static string FirmaTitular
        {
            get { return _firmaTitular; }
            set { _firmaTitular = value; }
        }
        
        public static string Foto
        {
            get { return _foto; }
            set { _foto = value; }
        }

        public static string MiDato
        {
            get { return _miDato; }
            set { _miDato = value; }
        }

        public static string IdentificacionEstudiante
        {
            get { return _idEstudiante; }
            set { _idEstudiante = value; }
        }
        
        public static string SedeUsuario
        {
            get { return _sedeUsuario; }
            set { _sedeUsuario = value; }
        }
        
        public static string NombreUsuario
        {
            get { return _nombreUsuario; }
            set { _nombreUsuario = value; }
        }
        
        public static string RolUsuario
        {
            get { return _rolUsuario; }
            set { _rolUsuario = value; }
        }

        public static string RutaPDF
        {
            get { return _rutaPdf; }
            set { _rutaPdf = value; }
        }

        public static bool HabilitarNotas
        {
            get { return _habilitadorNota; }
            set { _habilitadorNota = value; }
        }

        public static List<string> ListaEstudiantesXGrupo
        {
            get { return _listaEstudiantesXGrupo; }
            set { _listaEstudiantesXGrupo = value; }
        }
        
        public static List<Familiar> Familiares
        {
            get { return _familiares; }
            set { _familiares = value; }
        }

        public static string Asignatura
        {
            get { return _asignatura; }
            set { _asignatura = value; }
        }
        
        public static string Grado
        {
            get { return _grado; }
            set { _grado = value; }
        }
        
        public static string Grupo
        {
            get { return _grupo; }
            set { _grupo = value; }
        }
        
        public static string Periodo
        {
            get { return _periodo; }
            set { _periodo = value; }
        }
        
        public static string PuestoPeriodo
        {
            get { return _puestoPeriodo; }
            set { _puestoPeriodo = value; }
        }

        public static EstudianteBoletin DatosNotas
        {
            get { return _datosNotas; }
            set { _datosNotas = value; }
        }
        
        public static Usuario EstudianteCertificados
        {
            get { return _estudianteCertificados; }
            set { _estudianteCertificados = value; }
        }

    }

}
