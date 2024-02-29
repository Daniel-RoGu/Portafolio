document.addEventListener("DOMContentLoaded", function () {
    // Ocultar contenedor-buscar, contenedor-tabla, contenedor-combo, y contenedor-tabla-dos al cargar la página
    var contenedorBuscarestudiante = document.querySelector(".contenedor-buscar-estudiante");
    var contenedorFiltrar = document.querySelector(".contenedor-filtrar");
    var contenedorTabla = document.querySelector(".contenedor-tabla");

    if (contenedorBuscarestudiante && contenedorFiltrar && contenedorTabla) {
        contenedorBuscarestudiante.style.display = "none";
        contenedorFiltrar.style.display = "none";
        contenedorTabla.style.display = "none";
    }
});

document.addEventListener("DOMContentLoaded", function () {
    var botonMostrar = document.getElementById("mostrarEstudiantes");
    var botonFiltrar = document.getElementById("btnOpcionFiltrar");
    var contenedorBuscarestudiante = document.querySelector(".contenedor-buscar-estudiante");
    var contenedorFiltrar = document.querySelector(".contenedor-filtrar");
    var contenedorTabla = document.querySelector(".contenedor-tabla");

    botonMostrar.addEventListener("click", function () {
        if (contenedorFiltrar.style.display === "none") {
            contenedorFiltrar.style.display = "block";
            contenedorFiltrar.style.display = "flex";
            contenedorTabla.style.display = "block";
            contenedorTabla.style.display = 'flex';
            contenedorBuscarestudiante.style.display = "none";
        } else {
            contenedorBuscarestudiante.style.display = "none";
        }
    });

    botonFiltrar.addEventListener("click", function () {
        if (contenedorFiltrar.style.display === "none") {
            contenedorFiltrar.style.display = "block";
            contenedorFiltrar.style.display = "flex";
            contenedorTabla.style.display = "block";
            contenedorTabla.style.display = 'flex';
            contenedorBuscarestudiante.style.display = "none";
        } else {
            contenedorBuscarestudiante.style.display = "none";
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    var botonbuscar = document.getElementById("buscar-estudiante");
    var contenedorBuscarestudiante = document.querySelector(".contenedor-buscar-estudiante");
    var contenedorFiltrar = document.querySelector(".contenedor-filtrar");
    var contenedorTabla = document.querySelector(".contenedor-tabla");

    botonbuscar.addEventListener("click", function () {
        if (contenedorBuscarestudiante.style.display === "none") {
            contenedorBuscarestudiante.style.display = "block";
            contenedorBuscarestudiante.style.display = "flex";
            contenedorTabla.style.display = "block";
            contenedorTabla.style.display = 'flex';
            contenedorFiltrar.style.display = "none";
        } else {
            contenedorFiltrar.style.display = "none";
        }
    });
});