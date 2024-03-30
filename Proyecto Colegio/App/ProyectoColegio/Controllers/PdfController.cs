using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http.Extensions;
using Rotativa.AspNetCore;
using DinkToPdf;
using DinkToPdf.Contracts;
using ProyectoColegio.Data;

namespace ProyectoColegio.Controllers
{

    public class PdfController : Controller
    {
        //recursos de libreria PDF
        private readonly IConverter _converter;

        public PdfController(IConverter converter)
        {
            _converter = converter;
        }

        public string NotasMateria(string asignatura, string grado, string grupo, string periodo) {
            
            string retorno = "1";

            DatosCompartidos.Asignatura = asignatura;
            DatosCompartidos.Grado = grado;
            DatosCompartidos.Grupo = grupo;
            DatosCompartidos.Periodo = periodo;            

            return retorno;
        }

        public IActionResult Index(string RutaPdf)
        {
            DatosCompartidos.RutaPDF = RutaPdf;
            return View();
        }

        //vista del formato plantilla notas
 
        public IActionResult vistaParaPDF()
        {                     
            return View();
        }



        public IActionResult formatoCarnet()
        {
            return View();
        }

        public IActionResult formatoCertificadoEstudio() 
        {
            return View();
        }

        public IActionResult formatoHojaMatricula ()
        {
            return View();
        }

        public IActionResult formatoObservacionDatosGenerales() 
        {
            return View(); 
        }

        public IActionResult formatoObservacionTipo1() 
        {
            return View(); 
        }
        
        public IActionResult formatoObservacionTipo2() 
        {
            return View(); 
        }
        
        public IActionResult formatoObservacionTipo3() 
        {
            return View(); 
        }

        public IActionResult formatoBoletinPrimariaBachiller() 
        {
            return View(); 
        }

        public IActionResult formatoBoletinBachiller() 
        {
            return View(); 
        }
        
        public IActionResult formatoBoletinMedeiaAcademica() 
        {
            return View(); 
        }
        
        public IActionResult formatoPazYSalvo1() 
        {
            return View(); 
        }
        
        public IActionResult formatoPazYSalvo2() 
        {
            return View(); 
        }
        
        public IActionResult formatoPazYSalvo3() 
        {
            return View(); 
        }
        
        public IActionResult formatoPreescolarBoletin1() 
        {
            return View(); 
        }
        
        public IActionResult formatoPreescolarBoletin2() 
        {
            return View(); 
        }
        
        public IActionResult formatoPreescolarBoletin3() 
        {
            return View(); 
        }
        
        public IActionResult formatoPreescolarCertificadoGrado() 
        {
            return View(); 
        }


        public IActionResult MostrarPDFenPagina()
        {
            //sirbe para obtener la ruta de la vista que se quiere imprimir
            string pagina_actual = HttpContext.Request.Path;
            string url_pagina = HttpContext.Request.GetEncodedUrl();
            url_pagina = url_pagina.Replace(pagina_actual, "");
            //url_pagina = $"{url_pagina}/Pdf/vistaParaPDF";
            url_pagina = $"{url_pagina}/Pdf/{DatosCompartidos.RutaPDF}";

            //configuracion de PDF
            var pdf = new HtmlToPdfDocument()
            {
                GlobalSettings = new GlobalSettings()
                {
                    PaperSize = PaperKind.A4, //formato de hoja estandar
                    Orientation = Orientation.Portrait
                },
                Objects =
                {
                    new ObjectSettings()
                    {
                        Page = url_pagina
                    }
                }
            };

            var archivoPdf = _converter.Convert(pdf);

            return File(archivoPdf, "application/pdf");
        }

        public IActionResult DescargarPDF()
        {
            //sirbe para obtener la ruta de la vista que se quiere imprimir
            string pagina_actual = HttpContext.Request.Path;
            string url_pagina = HttpContext.Request.GetEncodedUrl();
            url_pagina = url_pagina.Replace(pagina_actual, "");
            //url_pagina = $"{url_pagina}/Pdf/vistaParaPDF";
            url_pagina = $"{url_pagina}/Pdf/{DatosCompartidos.RutaPDF}";

            //configuracion de PDF
            var pdf = new HtmlToPdfDocument()
            {
                GlobalSettings = new GlobalSettings()
                {
                    PaperSize = PaperKind.A4, //formato de hoja estandar
                    Orientation = Orientation.Portrait
                },
                Objects =
                {
                    new ObjectSettings()
                    {
                        Page = url_pagina
                    }
                }
            };

            var archivoPdf = _converter.Convert(pdf);
            //retorna el nombre del reporte con la fecha actual por (dia/mes/año/hora/minuto/segundo)
            string nombrePdf = "reporte" + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";

            return File(archivoPdf, "application/pdf", nombrePdf);
        }
        
        public void ActualizarRutaPdf(string RutaPdf)
        {
            DatosCompartidos.RutaPDF = RutaPdf;
        }        

    }      

}
