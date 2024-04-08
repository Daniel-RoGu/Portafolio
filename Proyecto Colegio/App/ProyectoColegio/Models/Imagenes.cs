using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
public class Imagenes
{
    [Required(ErrorMessage = "Se requiere seleccionar una imagen.")]
    [Display(Name = "Imagen")]
    public IFormFile ImagenArchivo { get; set; }

    [Required(ErrorMessage = "Se requiere seleccionar el tipo de propietario.")]
    [Display(Name = "Propietario firma")]
    public string Propietario { get; set; }

    [Required(ErrorMessage = "Se requiere registrar la identificacion del propietario.")]
    [Display(Name = "Documento del estudiante")]
    public string? IdPropietario { get; set; }
}

