window.onload = function () {


    listarPeriodos()

}



function listarPeriodos() {


    fetchGet('Funcionario/ObtenerPeriodoAcademico', function (data) {

        agragartablaPeriodoConrol(data)
       
 

    })
}


function agragartablaPeriodoConrol(data) {

    let cabezera = [
        { valor: "Nombre", size: 30 },
        { valor: "Fecha", size: 30 },
        { valor: "Estado", size: 30 }
    ];

    const propiedadesEstudiantes = [
        [
            { titulo: "Nombre", valor: "periodo" }
        ],
        [
            { titulo: "Fecha Inicio", valor: "fechaInicio" },
            {
                titulo: "Fecha fin", valor: "fechaFin" }
        ]
    ];


    let tabla = generarTablaPeriodos(data, cabezera, propiedadesEstudiantes, "idperiodo")
    document.getElementById("controlPeriodos").innerHTML = tabla;  

}








function generarTablaPeriodos(data, cabezera, propiedades, propiedadId) {
    var contenedor = "<table class='table table__information table__modals py-0 my-0 table-bordered table__horario'>";
    contenedor += "<thead>";
    contenedor += "<tr>";

    for (var i = 0; i < cabezera.length; i++) {
        contenedor += "<th scope='col' class='font-weight-normal border-estilo' style='width:" + cabezera[i].size + "%;'>" + cabezera[i].valor + "</th>";
    }


    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody>";

    for (var j = 0; j < data.length; j++) {
        contenedor += "<tr class='table__row'>";

        for (var k = 0; k < propiedades.length; k++) {
            contenedor += "<td class='table_colums'>";


 

            for (var l = 0; l < propiedades[k].length; l++) {
                if (propiedades[k][l].titulo !== "Fecha Inicio" && propiedades[k][l].titulo !== "Fecha fin") {
                    contenedor += "<div class='colums__text py-0 my-0'>";

                    contenedor += "<span class='text__normal'>" + data[j][propiedades[k][l].valor].toString().toUpperCase() + "</span>";
                    contenedor += "</div>";

                } else {

                    contenedor += "<div class='colums__text py-0 my-0'>";
                    contenedor += "<span class='text__bold'>" + propiedades[k][l].titulo + ": </span>";
                    contenedor += "<span class='text__normal'>" + data[j][propiedades[k][l].valor].toString().toUpperCase() + "/" + new Date().getFullYear() +"</span>";
                    contenedor += "</div>";

                }
               
            }

            contenedor += "</td>";
        }

        contenedor += `<td><div class='colums__options'>
                            <a href="#" class='d-inline-block form-control form-control-sm ${data[j].estadoPeriodo === "Habilitado" ? "bg-primary text-white" : "bg-secondary text-white"} w-auto' onclick="ModalestadoPeriodo(${data[j][propiedadId]})" data-toggle="modal" data-target="#EstadoControlPeriodo" >${data[j].estadoPeriodo}</a>
                        </div></td>`;

        contenedor += "</tr>";
    }
    
    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}


function ModalestadoPeriodo(idestado) {

    document.getElementById("idperiodoacademico").value = idestado

}


function guardarcambioEstadoPeriodo() {
    let periodo = document.getElementById("idperiodoacademico").value;
    let estadoPeriodo = document.getElementById("estadoperiodo").value;
    fetchGetText('funcionario/actualizarPeriodo/?idPeriodoRef=' + periodo + '&estadoPeriodoRef=' + estadoPeriodo, function (res) {

        if (res === "1") {
            listarPeriodos()
            document.getElementById("cerraperiodoModal").click()
          
        }

    })


}


function limpiarModalPeriodoEstado() {

    document.getElementById("idperiodoacademico").value = "";
    resetSelect('estadoperiodo');  

}