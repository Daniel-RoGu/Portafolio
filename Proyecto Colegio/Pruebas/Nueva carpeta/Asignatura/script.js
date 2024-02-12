document.addEventListener("DOMContentLoaded", function () {
    // Ocultar contenedor-buscar, contenedor-tabla, contenedor-combo, y contenedor-tabla-dos al cargar la página
    var contenedorRegistrarAsignatura = document.querySelector(".contenedor-registrar-asignatura");
    var contenendorNombreAsignatura = document.querySelector(".contenedor-nombre-asignatura");
    var contenedorLabelDos = document.querySelector(".contenedor-label-dos");
    var contenendorBotonesGrado = document.querySelector(".contenedor-botones-grado");
    var contenedorLabelTres = document.querySelector(".contenedor-label-tres");
    var contenedorSedes = document.querySelector(".contenedor-sedes");
    var contenedorBuscar = document.querySelector(".contenedor-buscar");
    var contenedorLabelCuastro = document.querySelector(".contenedor-label-cuatro");
    var contenedorNombreAsignaturaDos = document.querySelector(".contenedor-nombre-asignatura-dos");
    var contenedorBotonGuardarDos = document.querySelector(".contenedor-boton-guardar-dos");
    var contenedorLabelCinco = document.querySelector(".contenedor-label-cinco");
    var contenedorBotonesGradoDos = document.querySelector(".contenedor-botones-grado-dos");
    var contenedorLabelSeix = document.querySelector(".contenedor-label-seix");
    var contenedorSedeDos = document.querySelector(".contenedor-sedes-dos");
    var contenedorTabla = document.querySelector(".contenedor-tabla")

        contenedorRegistrarAsignatura.style.display = "none";
        contenendorNombreAsignatura.style.display = "none";
        contenedorLabelDos.style.display = "none";
        contenendorBotonesGrado.style.display = "none";
        contenedorLabelTres.style.display = "none";
        contenedorSedes.style.display = "none";
        contenedorBuscar.style.display = "none";
        contenedorLabelCuastro.style.display = "none";
        contenedorNombreAsignaturaDos.style.display = "none";
        contenedorBotonGuardarDos.style.display = "none";
        contenedorLabelCinco.style.display = "none";
        contenedorBotonesGradoDos.style.display = "none";
        contenedorLabelSeix.style.display = "none";
        contenedorSedeDos.style.display = "none";
        contenedorTabla.style.display ="none";
    }
);

document.addEventListener("DOMContentLoaded", function () {
    // Obtén referencias a los elementos sin el punto en los ids
    var botonRegistrarAsignatura = document.getElementById("boton-registrar-asignatura");
    var contenedorRegistrarAsignatura = document.querySelector(".contenedor-registrar-asignatura");
    var contenendorNombreAsignatura = document.querySelector(".contenedor-nombre-asignatura");
    var contenedorLabelDos = document.querySelector(".contenedor-label-dos");
    var contenendorBotonesGrado = document.querySelector(".contenedor-botones-grado");
    var contenedorLabelTres = document.querySelector(".contenedor-label-tres");
    var contenedorSedes = document.querySelector(".contenedor-sedes");
    var contenedorTabla = document.querySelector(".contenedor-tabla")
    var contenedorBuscar = document.querySelector(".contenedor-buscar");
    var contenedorLabelCuastro = document.querySelector(".contenedor-label-cuatro");
    var contenedorNombreAsignaturaDos = document.querySelector(".contenedor-nombre-asignatura-dos");
    var contenedorBotonGuardarDos = document.querySelector(".contenedor-boton-guardar-dos");
    var contenedorLabelCinco = document.querySelector(".contenedor-label-cinco");
    var contenedorBotonesGradoDos = document.querySelector(".contenedor-botones-grado-dos");
    var contenedorLabelSeix = document.querySelector(".contenedor-label-seix");
    var contenedorSedeDos = document.querySelector(".contenedor-sedes-dos");

    // Agrega un evento de clic al botón
    botonRegistrarAsignatura.addEventListener("click", function () {
        // Muestra u oculta los divs al hacer clic en el botón
        contenedorRegistrarAsignatura.style.display = "block";
        contenendorNombreAsignatura.style.display = "block";
        contenedorLabelDos.style.display = "block";
        contenendorBotonesGrado.style.display = "block";
        contenedorLabelTres.style.display = "block";
        contenedorSedes.style.display = "block";

        contenedorBuscar.style.display = "none";
        contenedorLabelCuastro.style.display = "none";
        contenedorNombreAsignaturaDos.style.display = "none";
        contenedorBotonGuardarDos.style.display = "none";
        contenedorLabelCinco.style.display = "none";
        contenedorBotonesGradoDos.style.display = "none";
        contenedorLabelSeix.style.display = "none";
        contenedorSedeDos.style.display = "none";
        contenedorTabla.style.display = "none"
    });
});


document.addEventListener("DOMContentLoaded", function () {
    // Obtén referencias a los elementos sin el punto en los ids
    var botonBuscarAsignatura = document.getElementById("boton-buscar-asignatura");
    var contenedorRegistrarAsignatura = document.querySelector(".contenedor-registrar-asignatura");
    var contenendorNombreAsignatura = document.querySelector(".contenedor-nombre-asignatura");
    var contenedorLabelDos = document.querySelector(".contenedor-label-dos");
    var contenendorBotonesGrado = document.querySelector(".contenedor-botones-grado");
    var contenedorLabelTres = document.querySelector(".contenedor-label-tres");
    var contenedorSedes = document.querySelector(".contenedor-sedes");
    var contenedorTabla = document.querySelector(".contenedor-tabla")
    var contenedorBuscar = document.querySelector(".contenedor-buscar");
    var contenedorLabelCuastro = document.querySelector(".contenedor-label-cuatro");
    var contenedorNombreAsignaturaDos = document.querySelector(".contenedor-nombre-asignatura-dos");
    var contenedorBotonGuardarDos = document.querySelector(".contenedor-boton-guardar-dos");
    var contenedorLabelCinco = document.querySelector(".contenedor-label-cinco");
    var contenedorBotonesGradoDos = document.querySelector(".contenedor-botones-grado-dos");
    var contenedorLabelSeix = document.querySelector(".contenedor-label-seix");
    var contenedorSedeDos = document.querySelector(".contenedor-sedes-dos");

    // Agrega un evento de clic al botón
    botonBuscarAsignatura.addEventListener("click", function () {
        // Muestra u oculta los divs al hacer clic en el botón
        contenedorRegistrarAsignatura.style.display = "none";
        contenendorNombreAsignatura.style.display = "none";
        contenedorLabelDos.style.display = "none";
        contenendorBotonesGrado.style.display = "none";
        contenedorLabelTres.style.display = "none";
        contenedorSedes.style.display = "none";
        contenedorTabla.style.display = "none"

        contenedorBuscar.style.display = "block";
        contenedorLabelCuastro.style.display = "block";
        contenedorNombreAsignaturaDos.style.display = "block";
        contenedorBotonGuardarDos.style.display = "block";
        contenedorLabelCinco.style.display = "block";
        contenedorBotonesGradoDos.style.display = "block";
        contenedorLabelSeix.style.display = "block";
        contenedorSedeDos.style.display = "block";
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Obtén referencias a los elementos sin el punto en los ids
    var botonMostrarAsignatura = document.getElementById("boton-mostrar-asigntatura");
    var contenedorRegistrarAsignatura = document.querySelector(".contenedor-registrar-asignatura");
    var contenendorNombreAsignatura = document.querySelector(".contenedor-nombre-asignatura");
    var contenedorLabelDos = document.querySelector(".contenedor-label-dos");
    var contenendorBotonesGrado = document.querySelector(".contenedor-botones-grado");
    var contenedorLabelTres = document.querySelector(".contenedor-label-tres");
    var contenedorSedes = document.querySelector(".contenedor-sedes");
    var contenedorTabla = document.querySelector(".contenedor-tabla")
    var contenedorBuscar = document.querySelector(".contenedor-buscar");
    var contenedorLabelCuastro = document.querySelector(".contenedor-label-cuatro");
    var contenedorNombreAsignaturaDos = document.querySelector(".contenedor-nombre-asignatura-dos");
    var contenedorBotonGuardarDos = document.querySelector(".contenedor-boton-guardar-dos");
    var contenedorLabelCinco = document.querySelector(".contenedor-label-cinco");
    var contenedorBotonesGradoDos = document.querySelector(".contenedor-botones-grado-dos");
    var contenedorLabelSeix = document.querySelector(".contenedor-label-seix");
    var contenedorSedeDos = document.querySelector(".contenedor-sedes-dos");

    // Agrega un evento de clic al botón
    botonMostrarAsignatura.addEventListener("click", function () {
        // Muestra u oculta los divs al hacer clic en el botón
        contenedorRegistrarAsignatura.style.display = "none";
        contenendorNombreAsignatura.style.display = "none";
        contenedorLabelDos.style.display = "none";
        contenendorBotonesGrado.style.display = "none";
        contenedorLabelTres.style.display = "none";
        contenedorSedes.style.display = "none";
        contenedorTabla.style.display = "block"

        contenedorBuscar.style.display = "none";
        contenedorLabelCuastro.style.display = "none";
        contenedorNombreAsignaturaDos.style.display = "none";
        contenedorBotonGuardarDos.style.display = "none";
        contenedorLabelCinco.style.display = "none";
        contenedorBotonesGradoDos.style.display = "none";
        contenedorLabelSeix.style.display = "none";
        contenedorSedeDos.style.display = "none";
    });
});