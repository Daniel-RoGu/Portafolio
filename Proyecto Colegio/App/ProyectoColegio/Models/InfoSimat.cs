using CsvHelper.Configuration.Attributes;

namespace ProyectoColegio.Models
{
    public class InfoSimat
    {
        [Name("ANO")]
        private int? _annoElectivo;

        [Name("ETC")]
        private String? _departamento;

        [Name("ESTADO")]
        private String? _estadoMatricula;

        [Name("JERARQUIA")]
        private String? _municipio;

        [Name("INSTITUCION")]
        private String? _institucion;

        [Name("CALENDARIO")]
        private String? _calendario;

        [Name("SECTOR")]
        private String? _sector;

        [Name("SEDE")]
        private String? _sede;

        [Name("ZONA_SEDE")]
        private String? _zonaSede;

        [Name("JORNADA")]
        private String? _jornada;

        [Name("GRADO_COD")]
        private int? _grado;

        [Name("GRUPO")]
        private int? _grupo;

        [Name("MODELO")]
        private String? _modalidad;

        [Name("FECHAINI")]
        private String? _fechaInicio;

        [Name("FECHAFIN")]
        private String? _fechaFin;

        [Name("NUI")]
        private String? _NUI;

        [Name("ESTRATO")]
        private String? _estrato;

        [Name("SISBEN IV")]
        private String? _sisben;

        [Name("PER_ID")]
        private int? _PERID;

        [Name("DOC")]
        private int? _numeroIdentificacion;

        [Name("TIPODOC")]
        private String? _tipoIdentificacion;

        [Name("APELLIDO1")]
        private String? _apellido1;

        [Name("APELLIDO2")]
        private String? _apellido2;

        [Name("NOMBRE1")]
        private String? _nombre1;

        [Name("NOMBRE2")]
        private String? _nombre2;

        [Name("GENERO")]
        private String? _genero;

        [Name("FECHA_NACIMIENTO")]
        private String? _fechaNacimiento;

        [Name("BARRIO")]
        private String? _barrio;

        [Name("EPS")]
        private String? _eps;

        [Name("TIPO DE SANGRE")]
        private String? _tipoSangre;

        [Name("INTERNADO")]
        private String? _internado;

        [Name("APOYO_ACADEMICO_ESPECIAL")]
        private String? _apoyoAcademicoEspecial;

        [Name("DISCAPACIDAD")]
        private String? _discapacidad;

        [Name("PAIS_ORIGEN")]
        private String? _paisOrigen;

        [Name("CORREO")]
        private String? _correo;

        public int? AnnoElectivo
        {
            get { return _annoElectivo; }
            set { _annoElectivo = value; }
        }

        public string? Departamento
        {
            get { return _departamento; }
            set { _departamento = value; }
        }

        public string? EstadoMatricula
        {
            get { return _estadoMatricula; }
            set { _estadoMatricula = value; }
        }

        public string? Municipio
        {
            get { return _municipio; }
            set { _municipio = value; }
        }

        public string? Institucion
        {
            get { return _institucion; }
            set { _institucion = value; }
        }

        public string? Calendario
        {
            get { return _calendario; }
            set { _calendario = value; }
        }

        public string? Sector
        {
            get { return _sector; }
            set { _sector = value; }
        }

        public string? Sede
        {
            get { return _sede; }
            set { _sede = value; }
        }

        public string? ZonaSede
        {
            get { return _zonaSede; }
            set { _zonaSede = value; }
        }

        public string? Jornada
        {
            get { return _jornada; }
            set { _jornada = value; }
        }

        public int? Grado
        {
            get { return _grado; }
            set { _grado = value; }
        }

        public int? Grupo
        {
            get { return _grupo; }
            set { _grupo = value; }
        }

        public string? Modalidad
        {
            get { return _modalidad; }
            set { _modalidad = value; }
        }

        public string? FechaInicio
        {
            get { return _fechaInicio; }
            set { _fechaInicio = value; }
        }

        public string? FechaFin
        {
            get { return _fechaFin; }
            set { _fechaFin = value; }
        }

        public string? NUI
        {
            get { return _NUI; }
            set { _NUI = value; }
        }

        public string? Estrato
        {
            get { return _estrato; }
            set { _estrato = value; }
        }

        public string? Sisben
        {
            get { return _sisben; }
            set { _sisben = value; }
        }

        public int? PERID
        {
            get { return _PERID; }
            set { _PERID = value; }
        }

        public int? NumeroIdentificacion
        {
            get { return _numeroIdentificacion; }
            set { _numeroIdentificacion = value; }
        }

        public string? TipoIdentificacion
        {
            get { return _tipoIdentificacion; }
            set { _tipoIdentificacion = value; }
        }

        public string? Apellido1
        {
            get { return _apellido1; }
            set { _apellido1 = value; }
        }

        public string? Apellido2
        {
            get { return _apellido2; }
            set { _apellido2 = value; }
        }

        public string? Nombre1
        {
            get { return _nombre1; }
            set { _nombre1 = value; }
        }

        public string? Nombre2
        {
            get { return _nombre2; }
            set { _nombre2 = value; }
        }

        public string? Genero
        {
            get { return _genero; }
            set { _genero = value; }
        }

        public string? FechaNacimiento
        {
            get { return _fechaNacimiento; }
            set { _fechaNacimiento = value; }
        }

        public string? Barrio
        {
            get { return _barrio; }
            set { _barrio = value; }
        }

        public string? Eps
        {
            get { return _eps; }
            set { _eps = value; }
        }

        public string? TipoSangre
        {
            get { return _tipoSangre; }
            set { _tipoSangre = value; }
        }

        public string? Internado
        {
            get { return _internado; }
            set { _internado = value; }
        }

        public string? ApoyoAcademicoEspecial
        {
            get { return _apoyoAcademicoEspecial; }
            set { _apoyoAcademicoEspecial = value; }
        }

        public string? Discapacidad
        {
            get { return _discapacidad; }
            set { _discapacidad = value; }
        }

        public string? PaisOrigen
        {
            get { return _paisOrigen; }
            set { _paisOrigen = value; }
        }

        public string? Correo
        {
            get { return _correo; }
            set { _correo = value; }
        }

    }
 }
 
