document.addEventListener("DOMContentLoaded", function () {
    // Ocultar contenedor-buscar, contenedor-tabla, contenedor-combo, y contenedor-tabla-dos al cargar la página
    var contenedorPadre = document.querySelector(".contenedor-informacion-padre");
    var contenedorMadre = document.querySelector(".contenedor-informacion-madre");

    if (contenedorPadre && contenedorMadre) {
        contenedorPadre.style.display = "none";
        contenedorMadre.style.display = "none";

    }
});

document.addEventListener("DOMContentLoaded", function () {
    var botonModuloPadre = document.getElementById("boton-modulo-padre");
    var contenedorPadre = document.querySelector(".contenedor-informacion-padre");
    var contenedorMadre = document.querySelector(".contenedor-informacion-madre");
    var contenedorAcudiente = document.querySelector(".contenedor-informacion-acudiente");
    botonModuloPadre.addEventListener("click", function () {
        if (contenedorPadre.style.display === "none") {
            contenedorPadre.style.display = "block";
            contenedorPadre.style.display = "flex";
            contenedorMadre.style.display = "none";
            contenedorAcudiente.style.display = "none";
        } else {
            contenedorMadre.style.display = "none";
            contenedorAcudiente.style.display = "none";
        }
    });
});


document.addEventListener("DOMContentLoaded", function () {
    var botonModuloMadre = document.getElementById("boton-modulo-madre");
    var contenedorPadre = document.querySelector(".contenedor-informacion-padre");
    var contenedorMadre = document.querySelector(".contenedor-informacion-madre");
    var contenedorAcudiente = document.querySelector(".contenedor-informacion-acudiente");
    botonModuloMadre.addEventListener("click", function () {
        if (contenedorMadre.style.display === "none") {
            contenedorMadre.style.display = "block";
            contenedorMadre.style.display = "flex";
            contenedorPadre.style.display = "none";
            contenedorAcudiente.style.display = "none";
        } else {
            contenedorPadre.style.display = "none";
            contenedorAcudiente.style.display = "none";
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    var botonModuloAcudiente = document.getElementById("boton-modulo-acudiente");
    var contenedorPadre = document.querySelector(".contenedor-informacion-padre");
    var contenedorMadre = document.querySelector(".contenedor-informacion-madre");
    var contenedorAcudiente = document.querySelector(".contenedor-informacion-acudiente");
    botonModuloAcudiente.addEventListener("click", function () {
        if (contenedorAcudiente.style.display === "none") {
            contenedorAcudiente.style.display = "block";
            contenedorAcudiente.style.display = "flex";
            contenedorPadre.style.display = "none";
            contenedorMadre.style.display = "none";
        } else {
            contenedorPadre.style.display = "none";
            contenedorMadre.style.display = "none";
        }
    });
});