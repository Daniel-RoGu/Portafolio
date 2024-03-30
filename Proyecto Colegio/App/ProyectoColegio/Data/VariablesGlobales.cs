using Org.BouncyCastle.Asn1.Cms;
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

        public List<object> Sedes(string conexion)
        {
            List<string> sede = new List<string>();
            List<object> sedes = new List<object>();
            
            Dictionary<string, Type> atributosSede = new Dictionary<string, Type>
            {                
                { "IdSede", typeof(string) },
                { "Sede", typeof(string) },
            };

            List<Object> resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerSedes", atributosSede, conexion);            
            
            foreach (List<Object> item in resultados)
            {                               
                sede.Add(Convert.ToString(item[0]));
                sede.Add(Convert.ToString(item[1]));
                sedes.Add(sede);
                sede = new List<string>();
            }

            return sedes;

        }
        
        public List<object> TiposSangre(string conexion)
        {
            List<string> tpSangre = new List<string>();
            List<object> tpsSangre = new List<object>();
            
            Dictionary<string, Type> atributosTpSangre = new Dictionary<string, Type>
            {
                { "IdTipoSangre", typeof(string) },
                { "TipoSangre", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerTipoSangre", atributosTpSangre, conexion);
            
            foreach (List<Object> item in resultados)
            {
                tpSangre.Add(Convert.ToString(item[0]));
                tpSangre.Add(Convert.ToString(item[1]));
                tpsSangre.Add(tpSangre);
                tpSangre = new List<string>();
            }

            return tpsSangre;

        }
        
        public List<object> TiposDocumento(string conexion)
        {
            List<string> tpDocumento = new List<string>();
            List<object> tpsDocumento = new List<object>();
            
            Dictionary<string, Type> atributosTpDocumento = new Dictionary<string, Type>
            {
                { "idTipoDocumento", typeof(string) },
                { "TipoDocumento", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerTipoDocumento", atributosTpDocumento, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpDocumento.Add(Convert.ToString(item[0]));
                tpDocumento.Add(Convert.ToString(item[1]));
                tpsDocumento.Add(tpDocumento);
                tpDocumento = new List<string>();
            }

            return tpsDocumento;

        }
        
        public List<object> Discapacidades(string conexion)
        {
            List<string> tpDiscapacidades = new List<string>();
            List<object> tpsDiscapacidades = new List<object>();
            
            Dictionary<string, Type> atributosDiscapacidad = new Dictionary<string, Type>
            {
                { "IdDiscapacidad", typeof(string) },
                { "Discapacidad", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerDiscapacidad", atributosDiscapacidad, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpDiscapacidades.Add(Convert.ToString(item[0]));
                tpDiscapacidades.Add(Convert.ToString(item[1]));
                tpsDiscapacidades.Add(tpDiscapacidades);
                tpDiscapacidades = new List<string>();
            }
            Console.WriteLine(tpsDiscapacidades);
            return tpsDiscapacidades;

        }
        
        public List<object> Sisbens(string conexion)
        {
            List<string> tpSisbens = new List<string>();
            List<object> tpsSisbens = new List<object>();
            
            Dictionary<string, Type> atributosSisbens = new Dictionary<string, Type>
            {
                { "IdSisben", typeof(string) },
                { "Siben", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerSisben", atributosSisbens, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpSisbens.Add(Convert.ToString(item[0]));
                tpSisbens.Add(Convert.ToString(item[1]));
                tpsSisbens.Add(tpSisbens);
                tpSisbens= new List<string>();
            }

            return tpsSisbens;

        }
        
        public List<object> Generos(string conexion)
        {
            List<string> tpGeneros = new List<string>();
            List<object> tpsGeneros = new List<object>();
            
            Dictionary<string, Type> atributosGeneros = new Dictionary<string, Type>
            {
                { "IdGenero", typeof(string) },
                { "Genero", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerGenero", atributosGeneros, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpGeneros.Add(Convert.ToString(item[0]));
                tpGeneros.Add(Convert.ToString(item[1]));
                tpsGeneros.Add(tpGeneros);
                tpGeneros= new List<string>();
            }

            return tpsGeneros;

        }
        
        public List<object> EPSs(string conexion)
        {
            List<string> tpEPSs = new List<string>();
            List<object> tpsEPSs = new List<object>();
            
            Dictionary<string, Type> atributosEPSs = new Dictionary<string, Type>
            {
                { "IdEPS", typeof(string) },
                { "EPS", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerEPS", atributosEPSs, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpEPSs.Add(Convert.ToString(item[0]));
                tpEPSs.Add(Convert.ToString(item[1]));
                tpsEPSs.Add(tpEPSs);
                tpEPSs= new List<string>();
            }

            return tpsEPSs;

        }
        
        public List<object> Estratos(string conexion)
        {
            List<string> tpEstratos = new List<string>();
            List<object> tpsEstratos = new List<object>();
            
            Dictionary<string, Type> atributosEstratos = new Dictionary<string, Type>
            {
                { "IdEstrato", typeof(string) },
                { "Estrato", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerEstrato", atributosEstratos, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpEstratos.Add(Convert.ToString(item[0]));
                tpEstratos.Add(Convert.ToString(item[1]));
                tpsEstratos.Add(tpEstratos);
                tpEstratos= new List<string>();
            }

            return tpsEstratos;

        }
        
        public List<object> Asignaturas(string conexion)
        {
            List<string> tpAsignaturas = new List<string>();
            List<object> tpsAsignaturas = new List<object>();
            
            Dictionary<string, Type> atributosAsignatura = new Dictionary<string, Type>
            {
                { "IdAsignatura", typeof(string) },
                { "Asignatura", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerAsignaturas", atributosAsignatura, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpAsignaturas.Add(Convert.ToString(item[0]));
                tpAsignaturas.Add(Convert.ToString(item[1]));
                tpsAsignaturas.Add(tpAsignaturas);
                tpAsignaturas= new List<string>();
            }

            return tpsAsignaturas;

        }
        
        public List<object> Docentes(string conexion)
        {
            List<string> tpDocentes = new List<string>();
            List<object> tpsDocentes = new List<object>();
            
            Dictionary<string, Type> atributosDocente = new Dictionary<string, Type>
            {
                { "IdDocente", typeof(string) },
                { "Docente", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerDocentes", atributosDocente, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpDocentes.Add(Convert.ToString(item[0]));
                tpDocentes.Add(Convert.ToString(item[1]));
                tpsDocentes.Add(tpDocentes);
                tpDocentes= new List<string>(); 
            }

            return tpsDocentes;

        }

        public List<object> DocentesTodos(string conexion)
        {
            List<object> tpsDocentes = new List<object>();

            Dictionary<string, Type> atributosDocente = new Dictionary<string, Type>
            {
                { "IdDocente", typeof(string) },
                { "Docente", typeof(string) },
                { "Identificacion", typeof(string) },
                { "TipoSangre", typeof(string) },
                { "Genero", typeof(string) },
                { "TelefonoFijo", typeof(string) },
                { "Direccion", typeof(string) },
                { "TelefonoCelular", typeof(string) },
                { "Correo", typeof(string) },
                { "Sede", typeof(string) },
                { "HorasTrabajo", typeof(string) },
                { "Discapacidad", typeof(string) },
                { "Sisben", typeof(string) },
                { "Estrato", typeof(string) },
                { "EPS", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerInfoDocentesTodos", atributosDocente, conexion);

            foreach (List<object> item in resultados)
            {
                tpsDocentes.Add(item);
            }

            return tpsDocentes;

        }

        public List<object> DocentesSede (string Sede, string conexion)
        {
            List<string> DocenteSd = new List<string>();
            List<object> DocentesSd = new List<object>();

            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                // Definir aqui atributos y tipos esperados
                { "IdDocente", typeof(string) },
                { "Docentes", typeof(string) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "ObtenerDocenteSede";
            string nombreParametro = "sedeRef";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, Sede, numeroAtributos, conexion);

            if (resultados.Count < 3) // cada registro trae dos datos por docente
            {
                DocenteSd.Add(Convert.ToString(resultados));
                return resultados;
            }
            else
            {
                foreach (List<Object> item in resultados)
                {
                    DocenteSd.Add(Convert.ToString(item[0]));
                    DocenteSd.Add(Convert.ToString(item[1]));
                    DocentesSd.Add(DocenteSd);
                    DocenteSd = new List<string>();
                
                }

                return DocentesSd;
            }

        }

        public List<object> DocentesSedeInfoCompleta(string Sede, string conexion)
        {
            List<object> DocentesSd = new List<object>();

            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                // Definir aqui atributos y tipos esperados                
                { "IdDocente", typeof(string) },
                { "Docente", typeof(string) },
                { "Identificacion", typeof(string) },
                { "TipoSangre", typeof(string) },
                { "Genero", typeof(string) },
                { "TelefonoFijo", typeof(string) },
                { "Direccion", typeof(string) },
                { "TelefonoCelular", typeof(string) },
                { "Correo", typeof(string) },
                { "Sede", typeof(string) },
                { "HorasTrabajo", typeof(string) },
                { "Discapacidad", typeof(string) },
                { "Sisben", typeof(string) },
                { "Estrato", typeof(string) },
                { "EPS", typeof(string) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "ObtenerInfoDocenteSede";
            string nombreParametro = "sedeRef";

            // Llamar al método
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, Sede, numeroAtributos, conexion);
            List<string> lista = new List<string>();

            foreach (var item in resultados)
            {
                                
                if (lista.Count > (numeroAtributos - 1))
                {
                    lista = new List<string>();

                }else if (lista.Count == (numeroAtributos - 1))
                {
                    DocentesSd.Add(lista);
                }

                lista.Add(item.ToString());
            }

            return DocentesSd;

        }

        public List<object> DocenteSedeInfoParcial(int identificadorRef, string conexion)
        {
            List<object> DocentesSd = new List<object>();

            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                { "Docente", typeof(string) },
                { "Identificacion", typeof(string) },
                { "Sede", typeof(string) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "ObtenerInfoGradosAsignaturasDocentes";
            string nombreParametro = "identificadorDocente";

            // Llamar al método
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificadorRef, numeroAtributos, conexion);
            List<string> lista = new List<string>();

            foreach (var item in resultados)
            {

                if (lista.Count > (numeroAtributos - 1))
                {
                    lista = new List<string>();

                }
                else if (lista.Count == (numeroAtributos - 1))
                {
                    DocentesSd.Add(lista);
                }

                lista.Add(item.ToString());
            }

            return DocentesSd;

        }

        public List<object> DocenteSedeInfoGradoAsignatura(int identificadorRef, string conexion)
        {
            List<object> DocentesSd = new List<object>();

            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                { "Asignatura", typeof(string) },
                { "Grado", typeof(string) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "ObtenerGradosAsignaturasDocentes";
            string nombreParametro = "identificadorDocente";

            // Llamar al método
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificadorRef, numeroAtributos, conexion);
            List<string> lista = new List<string>();

            foreach (var item in resultados)
            {

                if (lista.Count > (numeroAtributos - 1))
                {
                    lista = new List<string>();

                }
                else if (lista.Count == (numeroAtributos - 1))
                {
                    DocentesSd.Add(lista);
                }

                lista.Add(item.ToString());
            }

            return DocentesSd;

        }

        public List<string> AsignaturasGrado(string sede, int idGrado, string conexion)
        {
            var resultados = new List<object>();
            List<string> docentes = new List<string>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "sedeRef", sede },
                    { "idGradoRef", idGrado },
                };

            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerAsignaturasGrado", parametros, 1, conexion);

            foreach (var item in resultados)
            {
                docentes.Add(Convert.ToString(item));
            }

            return docentes;
        }

        public List<string> DocentesSedeGrupo (string Sede,string Grupo, string conexion) 
        {
            var resultados = new List<object>();
            List<string> docentes = new List<string>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "sedeRef", Sede },
                    { "nomGrupo", Grupo },
                };

            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerDocentesSedeGrado", parametros, 1, conexion);

            foreach (var item in resultados)
            {
                docentes.Add(Convert.ToString(item));
            }

            return docentes;
        }


        public List<object> DocentesAsignaturasGrupo(string Sede, int idGradoRef, string nomAsignatura, string conexion)
        {
            List<object> docentes = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "sedeRef", Sede },
                    { "idGradoRef", idGradoRef },
                    { "nomAsignatura", nomAsignatura },
                };

            var parametrosEsperados = 2;
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("GradosAsignaturasDocentes", parametros, parametrosEsperados, conexion);

            foreach (object item in resultados)
            {
                docentes.Add(item);
            }
            return docentes;
        }

        public List<object> GradosGruposAsignaturasDocentes(string Sede, string idGradoRef, string grupoRef, string conexion)
        {
            List<object> docentes = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "sedeRef", Sede },
                    { "GradoRef", idGradoRef },
                    { "GrupoRef", grupoRef },
                };

            var parametrosEsperados = 3;
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("GradosGruposAsignaturasDocentes", parametros, parametrosEsperados, conexion);

            foreach (object item in resultados)
            {
                docentes.Add(item);
            }
            return docentes;
        }

        public List<object> DocenteAsignaturas(string Sede, int idGradoRef, long identificacionDocente, string conexion)
        {
            List<object> docentes = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "sedeRef", Sede },
                    { "idGradoRef", idGradoRef },
                    { "identificacionDocente", identificacionDocente },
                };

            var parametrosEsperados = 2;
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("AsignaturasDelDocente", parametros, 2, conexion);

            foreach (object item in resultados)
            {
                docentes.Add(item);
            }
            return docentes;
        }

        public List<Object> DocentesSedeGrupoInfoCompleta(string Sede, string Grado, string conexion)
        {            
            List<object> docentes = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "sedeRef", Sede },
                 { "nomGrado", Grado },
            };

            int grupoAtributosEsperadosDocente = 15;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerInfoDocentesSedeGrado", parametros, grupoAtributosEsperadosDocente, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                docentes.Add(item);                
            }

            return docentes;
        }


        public List<object> GruposGrado(string conexion)
        {
            List<string> tpGruposGrado = new List<string>();
            List<object> tpsGruposGrado = new List<object>();
            
            Dictionary<string, Type> atributosGrupo = new Dictionary<string, Type>
            {
                { "IdGradoGrupo", typeof(string) },
                { "Grupo", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerGruposGrado", atributosGrupo, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpGruposGrado.Add(Convert.ToString(item[0]));
                tpGruposGrado.Add(Convert.ToString(item[1]));
                tpsGruposGrado.Add(tpGruposGrado);
                tpGruposGrado = new List<string>();
            }

            return tpsGruposGrado;

        }
        
        public List<object> Grados(string conexion)
        {
            List<string> tpGrado = new List<string>();
            List<object> tpsGrados = new List<object>();
            
            Dictionary<string, Type> atributosGrupo = new Dictionary<string, Type>
            {
                { "IdGrado", typeof(string) },
                { "Grado", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerGrados", atributosGrupo, conexion);
            
            foreach (List<object> item in resultados)
            {
                tpGrado.Add(Convert.ToString(item[0]));
                tpGrado.Add(Convert.ToString(item[1]));
                tpsGrados.Add(tpGrado);
                tpGrado = new List<string>();
            }

            return tpsGrados;

        }

        public List<object> GruposGradoSede(string sede, string grado, string conexion)
        {
            List<object> gruposSede = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "sedeRef", sede },
                 { "gradoRef", grado },
            };

            int grupoAtributosEsperadosGruposSede = 2; // numero de id y nombre grupo

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerGruposGradoSede", parametros, grupoAtributosEsperadosGruposSede, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                gruposSede.Add(item);
            }

            return gruposSede;

        }

        public List<object> GruposDocente(string sede, string grado, long documentoDocente, string conexion)
        {
            List<object> gruposSede = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "sedeRef", sede },
                 { "GradoRef", grado },
                 { "documentoDocente", documentoDocente },
            };

            int grupoAtributosEsperadosGruposSede = 2; // numero de id y nombre grupo

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerDocenteGrupos", parametros, grupoAtributosEsperadosGruposSede, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                gruposSede.Add(item);
            }

            return gruposSede;

        }

        public List<object> GradosDocente(string sede, long documentoDocente, string conexion)
        {
            List<object> gruposSede = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "sedeRef", sede },
                 { "documentoDocente", documentoDocente },
            };

            int grupoAtributosEsperadosGruposSede = 2; // numero de id y nombre grupo

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerDocenteGrados", parametros, grupoAtributosEsperadosGruposSede, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                gruposSede.Add(item);
            }

            return gruposSede;

        }

        public List<object> InfoDetalleHorarioFuncionario(string sede, string grupo, string conexion)
        {
            List<object> detalleHorario = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "nombreSedeRH", sede },
                 { "nomGrupo", grupo },
            };

            int AtributosInfoDetalleHorarioFuncionario = 4; // rangoHorario, diaHorario, nombreDocente y NombreAsignatura

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("MostrarHorario", parametros, AtributosInfoDetalleHorarioFuncionario, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                detalleHorario.Add(item);
            }

            return detalleHorario;
        }

        public List<object> InfoDetalleHorarioFuncionario2(string sede, string grupo, string rango, string dia, string conexion)
        {
            List<object> detalleHorario = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "nombreSedeRH", sede },
                 { "nomGrupo", grupo },
                 { "rangoHorario", rango },
                 { "dia", dia },
            };

            int AtributosInfoDetalleHorarioFuncionario = 4; // rangoHorario, diaHorario, nombreDocente y NombreAsignatura

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("MostrarHorarioPorRango", parametros, AtributosInfoDetalleHorarioFuncionario, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                detalleHorario.Add(item);
            }

            return detalleHorario;
        }

        public List<object> InfoDetalleHorarioDocente(long docDocente, string sede, string rango, string dia, string conexion)
        {
            List<object> detalleHorario = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "docDocente", docDocente },
                 { "nombreSedeRH", sede },
                 { "rangoHorario", rango },
                 { "dia", dia },
            };

            int AtributosInfoDetalleHorarioFuncionario = 4; // rangoHorario, diaHorario, nombreDocente y NombreAsignatura

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("MostrarHorarioPorRangoDocente", parametros, AtributosInfoDetalleHorarioFuncionario, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                detalleHorario.Add(item);
            }

            return detalleHorario;
        }
        
        public List<object> InfoDetalleHorarioEstudiante(string rango, string dia, string conexion)
        {
            List<object> detalleHorario = new List<object>();
            long documentoEstudiante = Convert.ToInt32(DatosCompartidos.MiDato);
            int grupo = Convert.ToInt16(DatosCompartidos.Grupo);
            string sede = DatosCompartidos.SedeUsuario;

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "documentoEstudiante", documentoEstudiante },
                 { "nombreSedeRH", sede },
                 { "nomGrupo", grupo },
                 { "rangoHorario", rango },
                 { "dia", dia },
            };

            int AtributosInfoDetalleHorarioFuncionario = 4; // rangoHorario, diaHorario, nombreDocente y NombreAsignatura

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("MostrarHorarioPorRangoEstudiante", parametros, AtributosInfoDetalleHorarioFuncionario, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                detalleHorario.Add(item);
            }

            return detalleHorario;
        }

        public List<object> GradoSede(string sede, string conexion)
        {
            List<object> gradosSede = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "sedeGradoGrupo", sede },
            };

            int grupoAtributosEsperadosGruposSede = 2; // numero de id y nombre grupo

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerGradosXSede", parametros, grupoAtributosEsperadosGruposSede, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                gradosSede.Add(item);
            }

            return gradosSede;

        }

    }
}
