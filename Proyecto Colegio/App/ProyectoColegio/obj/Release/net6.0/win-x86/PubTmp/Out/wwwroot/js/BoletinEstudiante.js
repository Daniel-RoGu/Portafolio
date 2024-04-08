window.onload = function () {

    generarTablaBoletin()



}


function generarTablaBoletin() {

    fetchGet('Estudiante/InfoBoletinEstudiante', function (response) {

        let tabla = "";
        let data = response.notas_estudiante;

        if (response.grado === "0") {

            tabla = generarTablaMateriasPreescolar(data)
        } else {

            tabla = generarTablaMaterias(data);


        }

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




function generarTablaMateriasPreescolar(data) {
   
    let tabla = "<table class='table table-bordered border-primary table__notas'>";
    tabla += "<tbody>";
    tabla += "<tr>";
    tabla += "<th>AREAS Y/O ASIGNATURAS</th>";
    tabla += "<th>PROP\u00d3SITOS</th>"; // Agregar la columna "PROPÓSITOS"
    tabla += "<th>I.H</th>";
    tabla += "<th>INASIST</th>";
    tabla += "<th>DESCRIPCION</th>";
    tabla += "<th>P1</th>";
    tabla += "<th>P2</th>";
    tabla += "<th>P3</th>";
    tabla += "<th>P4</th>";
    tabla += "<th>NOTA FINAL</th>";
    tabla += "</tr>";

    const propositos = [
        "Los ni\u00f1os y las ni\u00f1as construyen su identidad en relaci\u00f3n con los otros; se sienten queridos, y valoran positivamente pertenecer a una familia, cultura y mundo.",
        "Los ni\u00f1os y las ni\u00f1as disfrutan aprender; exploran y se relacionan con el mundo para comprenderlo y construirlo.",
        "Los ni\u00f1os y las ni\u00f1as son comunicadores activos de sus ideas, sentimientos y emociones; expresan, imaginan y representan su realidad.",
        "Los ni\u00f1os y las ni\u00f1as en la interacci\u00f3n con los dem\u00e1s aprenden principios morales y valores \u00e9ticos para la vida."
    ];

    let cont = 0;


    data.forEach(materia => {

        if (materia.materia.toUpperCase() !== "DIMENSION_CORPORAL" && materia.materia.toUpperCase() !== "DIMENSION_COMUNICATIVA"
            && materia.materia.toUpperCase() !== "DIMENSION_ESTETICA" && materia.materia.toUpperCase() !== "DIMENSION_ESPIRITUAL"
            && materia.materia.toUpperCase() !== "DIMENSION_COGNITIVA" && materia.materia.toUpperCase() !== "DIMENSION_SOCIO_AFECTIVA")
        {
            tabla += "<tr>";
            if (materia.materia.toUpperCase() !== "CONVIVENCIA" && materia.materia.toUpperCase() !== "PROMEDIO Y VALORACION FINAL DE TODAS LAS AREAS") {

                tabla += `<th rowspan='2' style='width:20%'>${materia.materia.toUpperCase()}</th>`;
                if (materia.materia.toUpperCase() === "ACTIVIDADRECTORA_ARTE") {
                    tabla += `<td rowspan='4' style='width:30%'>${(propositos[cont] === "Sin registro" ? 0 : propositos[cont])}</td>`;
                } else if (materia.materia.toUpperCase() === "ACTIVIDADRECTORA_JUEGO") {
                    cont--;
                } else {
                    tabla += `<td rowspan='2'>${(propositos[cont] === "Sin registro" ? 0 : propositos[cont])}</td>`;
                }
                cont++;
                tabla += `<td rowspan='2'>${materia.carga_Horario}</td>`;
                tabla += `<td rowspan='2'>${(materia.inasistencia === "Sin registro" ? 0 : materia.inasistencia)}</td>`;

            } else {
                tabla += `<th colspan='4' rowspan='2' style='width:50%'>${materia.materia.toUpperCase()}</th>`;
            }

            tabla += "<td>Valoracion</td>";
            materia.periodo.forEach(periodo => {
                tabla += `<td><p class='text--table--notas'>${periodo.nota_periodo}</p></td>`;
            });

            tabla += `<td><p class='text--table--notas'>${(materia.nota_final === "Sin registro" ? 0 : materia.nota_final)}</p></td>`;
            tabla += "</tr>";
            tabla += "<tr>";
            tabla += "<td>Desempe\u00f1o</td>";
            materia.periodo.forEach(periodo => {
                const notaPeriodo = periodo.Nota_periodo === "Sin registro" ? "0" : periodo.nota_periodo;
                tabla += `<td>${determinarCalificacion(parseFloat(notaPeriodo))}</td>`;
            });
            const notaFinal = materia.nota_final === "Sin registro" ? "0" : materia.nota_final;
            tabla += `<td>${determinarCalificacion(parseFloat(notaFinal))}</td>`;
            tabla += "</tr>";
        }
    });

    tabla += "</tbody>";
    tabla += "</table>";

    return tabla;
}

function generarTablaMateriasPreescolar2(data) {
    let tabla = "<table class='table table-bordered border-primary table__notas'>";
    tabla += "<tbody>";
    tabla += "<tr>";
    tabla += "<th colspan='2'>AREAS Y/O ASIGNATURAS</th>";
    tabla += "<th>I.H</th>";
    tabla += "<th>INASIST</th>";
    tabla += "<th>DESCRIPCION</th>";
    tabla += "<th>P1</th>";
    tabla += "<th>P2</th>";
    tabla += "<th>P3</th>";
    tabla += "<th>P4</th>";
    tabla += "<th>NOTA FINAL</th>";
    tabla += "</tr>";

    for (let i = 0; i < data.length; i++) {
        let materia = data[i];
        if (materia.Materia.toUpperCase() !== "ACTIVIDADRECTORA_ARTE" &&
            materia.Materia.toUpperCase() !== "ACTIVIDADRECTORA_JUEGO" &&
            materia.Materia.toUpperCase() !== "ACTIVIDADRECTORA_MEDIO_AMBIENTE" &&
            materia.Materia.toUpperCase() !== "ACTIVIDADRECTORA_LITERATURA") {
            tabla += "<tr>";
            if (materia.Materia.toUpperCase() !== "CONVIVENCIA" &&
                materia.Materia.toUpperCase() !== "PROMEDIO Y VALORACION FINAL DE TODAS LAS AREAS") {
                tabla += `<th colspan='2' rowspan='2'>${materia.Materia.toUpperCase()}</th>`;
                tabla += `<td rowspan='2'>${materia.Carga_Horario}</td>`;
                tabla += `<td rowspan='2'>${(materia.Inasistencia === "Sin registro" ? 0 : materia.Inasistencia)}</td>`;
            } else {
                tabla += `<th colspan='4' rowspan='2'>${materia.Materia.toUpperCase()}</th>`;
            }

            tabla += "<td>Valoracion</td>";
            for (let j = 0; j < materia.periodo.length; j++) {
                tabla += `<td><p class='text--table--notas'>${materia.periodo[j].Nota_periodo}</p></td>`;
            }

            tabla += `<td><p class='text--table--notas'>${(materia.Nota_final === "Sin registro" ? 0 : materia.Nota_final)}</p></td>`;
            tabla += "</tr>";
            tabla += "<tr>";
            tabla += "<td>Desempeño</td>";
            for (let k = 0; k < materia.periodo.length; k++) {
                let notaPeriodo = materia.periodo[k].Nota_periodo === "Sin registro" ? "0" : materia.periodo[k].Nota_periodo;
                tabla += `<td>${determinarCalificacion(parseFloat(notaPeriodo))}</td>`;
            }
            let notaFinal = materia.Nota_final === "Sin registro" ? "0" : materia.Nota_final;
            tabla += `<td>${determinarCalificacion(parseFloat(notaFinal))}</td>`;
            tabla += "</tr>";
        }
    }
    tabla += "</tbody>";
    tabla += "</table>";
    return tabla;
}

function decargarDocumento() {

    document.location.href = setUrl('pdf/Index/?RutaPdf=Boletin')

}

function decargarDocumentoPreescolar1() {

    document.location.href = setUrl('pdf/Index/?RutaPdf=formatoPreescolarBoletin1')

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
