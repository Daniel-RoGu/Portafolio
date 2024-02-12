document.addEventListener("DOMContentLoaded", function () {
    // Ocultar contenedor-buscar, contenedor-tabla, contenedor-combo, y contenedor-tabla-dos al cargar la página
    var contenedorFormulario = document.querySelector(".contenedor-formulario");
    var contenedorBuscar = document.querySelector(".contenedor-buscar");

    contenedorFormulario.style.display = "none";
    contenedorBuscar.style.display = "none";
}
);

document.addEventListener("DOMContentLoaded", function () {
    // Obtén referencias a los elementos sin el punto en los ids
    var botonRegistrarDocente = document.getElementById("boton-registrar-docente");
    var contenedorFormulario = document.querySelector(".contenedor-formulario");
    var contenedorBuscar = document.querySelector(".contenedor-buscar");

    // Agrega un evento de clic al botón
    botonRegistrarDocente.addEventListener("click", function () {
        // Muestra u oculta los divs al hacer clic en el botón
        contenedorFormulario.style.display = "block";
        contenedorBuscar.style.display = "none";
        
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Obtén referencias a los elementos sin el punto en los ids
    var botonModificarDocente = document.getElementById("boton-modificar-docente");
    var contenedorFormulario = document.querySelector(".contenedor-formulario");
    var contenedorBuscar = document.querySelector(".contenedor-buscar");

    // Agrega un evento de clic al botón
    botonModificarDocente.addEventListener("click", function () {
        // Muestra u oculta los divs al hacer clic en el botón
        contenedorFormulario.style.display = "block";
        contenedorBuscar.style.display = "block";
        
    });
});