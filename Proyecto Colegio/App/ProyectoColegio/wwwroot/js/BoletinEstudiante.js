window.onload = function () {

    generarTablaBoletin()


}


function generarTablaBoletin() {

    fetchGet('Estudiante/InfoBoletinEstudiante', function (data) {


        let tabla = generarTablaMaterias(data)


        document.getElementById('tablaBoletinEstudiante').innerHTML = tabla;  


    })
}





function generarTablaMaterias(data) {
    var tabla = "<table class='table-bordered table__information table__modals tables--modals--sms table_text-alig table--boletin'>";
    tabla += "<tbody>";
    tabla += "<tr>";
    tabla += "<th colspan='2'>AREAS Y/O ASIGNATURAS</th>";

    tabla += "<th>Intencidad horaria (I.H)</th>";
    tabla += "<th>INASIST</th>";
    tabla += "<th>DESCRIPCION</th>";
    tabla += "<th>P1</th>";
    tabla += "<th>P2</th>";
    tabla += "<th>P3</th>";
    tabla += "<th>P4</th>";
    tabla += "<th>NOTA FINAL</th>";
    tabla += "</tr>";
    for (var i = 0; i < data.length; i++) {
        var materia = data[i];
        tabla += "<tr>";
        if (materia.materia.toUpperCase() !== "CONVIVENCIA" && materia.materia.toUpperCase() !== "PROMEDIO Y VALORACION FINAL DE TODAS LAS AREAS") {

            tabla += `<th colspan='2' rowspan='2'>${materia.materia.toUpperCase()}</th>`;

            tabla += `<td rowspan='2'>${materia.carga_Horario}</td>`;
            tabla += `<td rowspan='2'>${materia.inasistencia === 'Sin registro' ? 0 : materia.inasistencia}</td>`;
        } else {

            tabla += `<th colspan='4' rowspan='2'>${materia.materia.toUpperCase()}</th>`;

        }
      
        tabla += "<td>Valoracion</td>";
        for (var j = 0; j < materia.periodo.length; j++) {
            tabla += `<td><p class="text--table--notas">${materia.periodo[j].nota_periodo}</p></td>`;
        }

        tabla += `<td><p class="text--table--notas">${materia.nota_final} </p></td>`;
        tabla += "</tr>";
        tabla += "<tr>";
        tabla += "<td>Desempe\u00f1o</td>";
        for (var k = 0; k < materia.periodo.length; k++) {
            tabla += "<td> " + determinarCalificacion(parseFloat(materia.periodo[k].nota_periodo === 'Sin registro' ? 0 : materia.periodo[k].nota_periodo )) + "</td>";
        }

        tabla += "<td>" + determinarCalificacion(parseFloat(materia.nota_final === 'Sin registro' ? 0 : materia.nota_final)) + "</td>";
        tabla += "</tr>";
    }

    tabla += "</tbody>";
    tabla += "</table>";

    return tabla;
}


function determinarCalificacion(nota) {
    if (nota < 0.0 || nota > 5.0) {
        return "Nota fuera de rango";
    } else if (nota >= 0.0 && nota < 2.90) {
        return "Bajo";
    } else if (nota >= 2.90 && nota < 2.95) {
        return "Bajo";
    } else if (nota >= 2.95 && nota < 3.95) {
        return "B\u00e1sico";
    } else if (nota >= 3.95 && nota < 4.00) {
        return "Alto";
    } else if (nota >= 4.00 && nota < 4.40) {
        return "Alto";
    } else if (nota >= 4.40 && nota < 4.55) {
        return "Alto";
    } else if (nota >= 4.55 && nota <= 5.0) {
        return "Superior";
    } else {
        return "Nota fuera de rango";
    }
}
