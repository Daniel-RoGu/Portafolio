using CsvHelper.Configuration.Attributes;

namespace ProyectoColegio.Models
{
    public class InfoSimat
    {
        [Name("ANO")]
        public int? ANO { get; set; }

        [Name("ETC")]
        public String? ETC { get; set; }

        [Name("ESTADO")]
        public String? ESTADO { get; set; }

        [Name("JERARQUIA")]
        public String? JERARQUIA { get; set; }

        [Name("INSTITUCION")]
        public String? INSTITUCION { get; set; }

        [Name("DANE")]
        public String? DANE { get; set; }

        [Name("CALENDARIO")]
        public String? CALENDARIO { get; set; }

        [Name("SECTOR")]
        public String? SECTOR { get; set; }

        [Name("SEDE")]
        public String? SEDE { get; set; }

        [Name("CODIGO_DANE_SEDE")]
        public String? CODIGO_DANE_SEDE { get; set; }

        [Name("CONSECUTIVO")]
        public String? CONSECUTIVO { get; set; }

        [Name("ZONA_SEDE")]
        public String? ZONA_SEDE { get; set; }

        [Name("JORNADA")]
        public String? JORNADA { get; set; }

        [Name("GRADO_COD")]
        public int? GRADO_COD { get; set; }

        [Name("GRUPO")]
        public int? GRUPO { get; set; }

        [Name("MODELO")]
        public String? MODELO { get; set; }

        [Name("MOTIVO")]
        public String? MOTIVO { get; set; }

        [Name("FECHAINI")]
        public String? FECHAINI { get; set; }

        [Name("FECHAFIN")]
        public String? FECHAFIN { get; set; }

        [Name("NUI")]
        public String? NUI { get; set; }

        [Name("ESTRATO")]
        public String? ESTRATO { get; set; }

        [Name("SISBEN IV")]
        public String? SISBEN_IV { get; set; }

        [Name("PER_ID")]
        public int? PER_ID { get; set; }

        [Name("DOC")]
        public string? DOC { get; set; }

        [Name("TIPODOC")]
        public String? TIPODOC { get; set; }

        [Name("APELLIDO1")]
        public String? APELLIDO1 { get; set; }

        [Name("APELLIDO2")]
        public String? APELLIDO2 { get; set; }

        [Name("NOMBRE1")]
        public String? NOMBRE1 { get; set; }

        [Name("NOMBRE2")]
        public String? NOMBRE2 { get; set; }

        [Name("GENERO")]
        public String? GENERO { get; set; }

        [Name("FECHA_NACIMIENTO")]
        public String? FECHA_NACIMIENTO { get; set; }

        [Name("BARRIO")]
        public String? BARRIO { get; set; }

        [Name("EPS")]
        public String? EPS { get; set; }

        [Name("TIPO DE SANGRE")]
        public String? TIPO_DE_SANGRE { get; set; }

        [Name("MATRICULACONTRATADA")]
        public String? MATRICULACONTRATADA { get; set; }

        [Name("FUENTE_RECURSOS")]
        public String? FUENTE_RECURSOS { get; set; }

        [Name("INTERNADO")]
        public String? INTERNADO { get; set; }

        [Name("NUM_CONTRATO")]
        public String? NUM_CONTRATO { get; set; }

        [Name("APOYO_ACADEMICO_ESPECIAL")]
        public String? APOYO_ACADEMICO_ESPECIAL { get; set; }

        [Name("SRPA")]
        public String? SRPA { get; set; }

        [Name("DISCAPACIDAD")]
        public String? DISCAPACIDAD { get; set; }

        [Name("PAIS_ORIGEN")]
        public String? PAIS_ORIGEN { get; set; }

        [Name("CORREO")]
        public String? CORREO { get; set; }

    }
 }
 
