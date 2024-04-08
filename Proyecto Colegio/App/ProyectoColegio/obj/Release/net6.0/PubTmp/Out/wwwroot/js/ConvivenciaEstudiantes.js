window.onload = function () {


    obtenerinfoGrupo();  
    ListarPeriodos("")

}

function activarEscuchaSelectPeriodo() {

    var selectElement = document.getElementById("periodoAcademico");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        let grupo = document.getElementById("sedeDocente").value
        if (selectedValue !== "") { listarGrupoConvivencia(grupo, selectedValue) }




    });
}


function ListarPeriodos(valor) {
    fetchGet('Docente/ObtenerPeriodosHabilitados', function (data) {
        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item,
                text: item,
            }));

            selectdate("periodoAcademico", newArray, valor);
            activarEscuchaSelectPeriodo();

        }

    })



}


function obtenerinfoGrupo() {


    fetchGet('docente/ObtenerGrupoDelTitular', function (data) {

        if ( data.length === 1) {
            detallesdocentes(data)

        }
    })

}


function detallesdocentes(data) {

  


        document.getElementById('detallesDocentes').innerHTML = `
                            <span class="">Grado:  </span><span>${data[0][0]}</span><br>
                            <span class="">Sede: </span><span> ${data[0][2]}</span><br>
                             <input type="hidden" id="sedeDocente" value="${data[0][2]}" />`





}





function listarGrupoConvivencia(grupo, periodo) {

    fetchGet('docente/ListarInformeNotasEstudiantesSedeGrupo/?GrupoRef=' + grupo + '&asignaturaRef=Convivencia&periodoRef=' + periodo, function (data) {


        generaTablaEstudiantes(data); 
    })


}


function generaTablaEstudiantes(data) {
    let cabezera = [
        { valor: "Datos del estudiante", size: 30 },
        { valor: "Nota", size: 30 },

    ];

    var propiedades = [
        [
            { titulo: "Nombre completo", valor: "nombreCompleto" },
            { titulo: "Documento", valor: "identificacion" }
        ],
        [
            { titulo: "Nota", valor: "nota" }
        ]
       

    ];

    let tabla = generarTablaEstudiantes(data, cabezera, propiedades,
        "identificacion");

    document.getElementById("tablaconvivenciaEstudiantes").innerHTML = tabla


}


function generarTablaEstudiantes(data, cabezera, propiedades, propiedadId) {
    var contenedor = "<table class='table table__information table-sm'>";
    contenedor += "<thead>";
    contenedor += "<tr>";


    for (let i = 0; i < cabezera.length; i++) {
        contenedor += `<th scope='col' class='font-weight-normal border-estilo' style='width:${cabezera[i].size}%;'>${cabezera[i].valor}</th>`;
    }
    contenedor += "<th style='width: 10%;'>";
   
    contenedor += "</th>";

    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody>";


    for (let i = 0; i < data.length; i++) {
        contenedor += "<tr class='table__row'>";

        for (var m = 0; m < propiedades.length; m++) {
            contenedor += `<td data-label='${cabezera[m].valor}' class="table_colums">`;
            let subpro = propiedades[m];


            for (let k = 0; k < subpro.length; k++) {
                if (subpro[k].titulo !== 'Nota' && subpro[k].titulo !== 'Fallas') {
                    contenedor += ` <div class="colums__text py-0 my-0">
                                        <span class="text__bold">${subpro[k].titulo} :</span>
                                        <span class="text__normal">${data[i][subpro[k].valor].toString().toUpperCase()}</span>
                                    </div>`;
                } else {
                    contenedor += ` <div class="colums__text py-0 my-0">

                                        <span class="text__normal">${data[i][subpro[k].valor].toString().toUpperCase()}</span>
                                    </div>`;
                }

            }

            contenedor += "</td>";
        }

        contenedor += "<td><div class='colums__options'>";
        contenedor += `<a href="#" class="form-control form-control-sm bg-primary text-white" data-toggle="modal" onclick="gestionNotasconvivencia(${data[i][propiedadId]})" data-target="#agregarNotasCovivencia">Agregar Notas</a>`;
        contenedor += "</div></td>";
        contenedor += "</tr>";
    }

    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}



function gestionNotasconvivencia(documeto) {

    document.getElementById("documenteEstudianteC").value = documeto;  
}

function guardarNotaconvivencia() {

    let nota = document.getElementById("Notaconvivencia").value
    let estudiante = document.getElementById("documenteEstudianteC").value;
    let periodo = document.getElementById("periodoAcademico").value;
    let grupo = document.getElementById("sedeDocente").value;
    fetchGetText('docente/actualizarConvivencia/?idEstudiante=' + estudiante + '&periodo=' + periodo + '&nota=' + nota + '&grupoRef='+grupo, function (res) {

        if (res === "1") {
            listarGrupoConvivencia(grupo, periodo);  
            document.getElementById("cerraModalNotasConvivencia").click(); 
            
        }

    })





}


function limpiarnotaConvivenciaEstudiante() {


    document.getElementById("documenteEstudianteC").value = ""
    document.getElementById("Notaconvivencia").value = ""



}