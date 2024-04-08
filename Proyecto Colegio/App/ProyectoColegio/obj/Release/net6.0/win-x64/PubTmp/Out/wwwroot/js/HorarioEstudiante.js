window.onload = function () {


    generarHorarioEstudiantil();  
   

}



function generarHorarioEstudiantil() {


    fetchGet('Estudiante/HorarioEstudianteH', function (data) {


        let tabla = generarTablaHorario(data)

        document.getElementById("horarioAcademico").innerHTML = tabla;

    })

}



function generarTablaHorario(datos) {
    let diasSemana = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes"];

    let contenedor = "<table class='table table__information table__modals py-0 my-0 table-bordered table__horario'>";
    contenedor += "<thead>";
    contenedor += "<tr>";
    contenedor += "<th>Rango</th>";
    contenedor += diasSemana.map(function (dia) {
        return "<th>" + dia + "</th>";
    }).join("");
    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody>";
    let filas = datos.map(function (horario) {
        let columnaDias = horario.dias.map(function (dia) {
            return "<td><div><p>" + dia.detalleH.materiaHorario + "</p><p>" + dia.detalleH.docenteHorario + "</p></div></td>";
        }).join("");
        return "<tr><td>" + horario.rango + "</td>" + columnaDias + "</tr>";
    });
    contenedor += filas.join("");
    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}





//opcion   para un modelo para obtener las notas de un estudiante