document.addEventListener("DOMContentLoaded", function () {
    // Ocultar contenedor-buscar, contenedor-tabla, contenedor-combo, y contenedor-tabla-dos al cargar la página
    var contenedorBuscar = document.querySelector(".contenedor-buscar");
    var contenedorTabla = document.querySelector(".contenedor-tabla");
    var contenedorCombo = document.querySelector(".contenedor-combo");
    var contenedorTablaDos = document.querySelector(".contenedor-tabla-dos");

    if (contenedorBuscar && contenedorTabla && contenedorCombo && contenedorTablaDos) {
        contenedorBuscar.style.display = "none";
        contenedorTabla.style.display = "none";
        contenedorCombo.style.display = "none";
        contenedorTablaDos.style.display = "none";
    }
});

document.addEventListener("DOMContentLoaded", function () {
    // Obtén referencias al div y al botón sin el punto en los ids
    var contenedorBuscar = document.querySelector(".contenedor-buscar");
    var botonBuscar = document.getElementById("boton-buscar-estudiantes");
    var contenedorCombo = document.querySelector(".contenedor-combo");
    var contenedorTablaDos = document.querySelector(".contenedor-tabla-dos");
    var contenedoTabla = document.querySelector(".contenedor-tabla");

    // Agrega un evento de clic al botón
    botonBuscar.addEventListener("click", function () {
        // Cambia el estilo del div al hacer clic en el botón
        if (contenedorBuscar.style.display === "none" || contenedorBuscar.style.display === "") {
            contenedorBuscar.style.display = "block"; // Mostrar el div
            contenedorCombo.style.display = "none";
            contenedorTablaDos.style.display = "none";
            contenedoTabla.style.display = "block"; // Mostrar el div
        } else {
            contenedorBuscar.style.display = "none"; // Ocultar el div
            contenedorCombo.style.display = "none";
            contenedorTablaDos.style.display = "none";
            contenedoTabla.style.display = "none"; // Ocultar el div
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Obtén referencias al div y al botón sin el punto en los ids
    var contenedorCombo = document.querySelector(".contenedor-combo");
    var botonBuscarDos = document.getElementById("boton-mostrar-estudiantes");
    var contenedorTabla = document.querySelector(".contenedor-tabla");
    var contenedorBuscar = document.querySelector(".contenedor-buscar");
    var contenedorTablaDos = document.querySelector(".contenedor-tabla-dos");

    // Agrega un evento de clic al botón
    botonBuscarDos.addEventListener("click", function () {
        // Cambia el estilo del div al hacer clic en el botón
        if (contenedorCombo.style.display === "none" || contenedorCombo.style.display === "") {
            contenedorCombo.style.display = "block"; // Mostrar el div
            contenedorTablaDos.style.display = "block";
            contenedorTabla.style.display = "none";
            contenedorBuscar.style.display = "none";
        } else {
            contenedorCombo.style.display = "none"; // Ocultar el div
            contenedorTabla.style.display = "none"; // Mostrar el div de tabla
            contenedorBuscar.style.display = "none"; // Mostrar el div de buscar
            contenedorTablaDos.style.display = "none";
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    var botonCargarEstudiantes = document.getElementById("boton-cargar-estudiantes");
    var labelNombreArchivo = document.getElementById("label-nombre");

    // Referencias a los elementos a ocultar
    var contenedorBuscar = document.querySelector(".contenedor-buscar");
    var contenedorTabla = document.querySelector(".contenedor-tabla");
    var contenedorCombo = document.querySelector(".contenedor-combo");
    var contenedorTablaDos = document.querySelector(".contenedor-tabla-dos");

    var archivoCargado = false;

    botonCargarEstudiantes.addEventListener("click", function () {
        // Si ya se ha cargado un archivo, no permitir cargar otro
        if (archivoCargado) {
            alert("Ya se ha cargado un archivo. Por favor, recargue la página para cargar otro.");
            return;
        }

        // Ocultar los elementos al hacer clic en el botón de carga
        contenedorBuscar.style.display = "none";
        contenedorTabla.style.display = "none";
        contenedorCombo.style.display = "none";
        contenedorTablaDos.style.display = "none";

        // Crea un elemento de entrada de archivo (input type="file")
        var inputFile = document.createElement("input");
        inputFile.type = "file";
        inputFile.accept = ".csv"; // Puedes ajustar las extensiones de archivo permitidas según tus necesidades

        // Escucha el evento de cambio del input de archivo
        inputFile.addEventListener("change", function (event) {
            // Obtiene el nombre del archivo seleccionado
            var nombreArchivo = event.target.files[0].name;

            // Muestra el nombre del archivo en el label
            labelNombreArchivo.textContent = "Nombre Del Archivo: " + nombreArchivo;

            // Marcar que se ha cargado un archivo
            archivoCargado = true;
        });

        // Simula un clic en el input de archivo para abrir el selector de archivos
        inputFile.click();
    });
});



