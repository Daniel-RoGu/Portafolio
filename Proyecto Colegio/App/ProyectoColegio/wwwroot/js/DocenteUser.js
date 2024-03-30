window.onload = function ()
{
    
    ListarPeriodos("")

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


function activarEscuchaSelectPeriodo() {

    var selectElement = document.getElementById("periodoAcademico");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        if (selectedValue !== "") { listarGrados("")}
    



    });
}



function listarGrados(valor) {
    fetchGet('Funcionario/ListarGradosDocente', function (data) {
        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("gradoDocente", newArray, valor);
            activarEscuchaSelectGrados();  
        }

    })



}


function listarGruposGrado(valor, grado) {


    fetchGet('Funcionario/ListarGruposDocente/?grado=' + grado, function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("GrupoGradoDocente", newArray, valor);
            activarEscuchaSelectGrupos()
        }

    })

}

function activarEscuchaSelectGrupos() {

    var selectElement = document.getElementById("GrupoGradoDocente");


    selectElement.addEventListener("change", function () {
        let grado = document.getElementById("gradoDocente").value
        var selectedValue = selectElement.value;
        if (selectedValue !== "") { listarAsignaturasDocente("", grado, selectedValue) }




    });
}


function activarEscuchaSelectGrados() {

    var selectElement = document.getElementById("gradoDocente");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        if (selectedValue !== "") { listarGruposGrado("", selectedValue) }
        



    });
}






function listarAsignaturasDocente(valor, grado, grupo) {


    fetchGet('docente/ListarDocenteAsignaturas/?grado=' + grado + '&grupo=' + grupo, function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[0],
            }));

            selectdate("idAsignaturasDocente", newArray, valor);
        
            activarEscuchaSelectMateria(); 
        }

    })

}



function listarEstudiantesGrupos(grupo, asignatura, periodo) {

    fetchGet('docente/ListarInformeNotasEstudiantesSedeGrupo/?GrupoRef=' + grupo + '&asignaturaRef=' + asignatura + '&periodoRef=' + periodo, function (data) {
 

      generaTablaEstudiantes(data)
    })


}



function generaTablaEstudiantes(data) {
    let cabezera = [
        { valor: "Datos del estudiante", size: 30 },
        { valor: "Nota", size: 30 },
        { valor: "Fallas", size: 30 }
    ];

    var propiedades = [
        [
            { titulo: "Nombre completo", valor: "nombreCompleto" },
            { titulo: "Documento", valor: "identificacion" }
        ],
        [
            { titulo: "Nota", valor: "nota" }
        ],
        [
            { titulo: "Fallas", valor: "fallas" }
        ]
       
    ];

    let tabla = generarTablaEstudiantes(data, cabezera, propiedades,
        "identificacion");

    document.getElementById("tablaEstudiantesNotas").innerHTML = tabla


}


function generarPlantilla() {
    let asignatura = document.getElementById("idAsignaturasDocente").value
    let grupo = document.getElementById('GrupoGradoDocente').value
    let grado = document.getElementById('gradoDocente').value; 
    let periodo = document.getElementById('periodoAcademico').value
    

   

    fetchGetText('docente/ListaEstudiantesXGrupoListado/?GrupoRef=' + grupo + '&asignaturaRef=' + asignatura + '&periodoRef=' + periodo, function (res) {

        if (res === "1") {

            fetchGetText('pdf/NotasMateria/?asignatura=' + asignatura + '&grado=' + grado + '&grupo=' + grupo + '&periodo=' + periodo, function (res) {


                if (res === "1") {

                    document.location.href = setUrl('pdf/Index/?RutaPdf=vistaParaPDF')
                }
            })

            //document.location.href = setUrl('pdf/vistaParaPDF/?asignatura=' + asignatura + '&grado=' + grado + '&grupo=' + grupo + '&periodo=' + periodo); 
        }
      
    })

}


function generarTablaEstudiantes(data, cabezera, propiedades, propiedadId) {
    var contenedor = "<table class='table table__information table-sm'>";
    contenedor += "<thead>";
    contenedor += "<tr>";


    for (let i = 0; i < cabezera.length; i++) {
        contenedor += `<th scope='col' class='font-weight-normal border-estilo' style='width:${cabezera[i].size}%;'>${cabezera[i].valor}</th>`;
    }
    contenedor += "<th style='width: 10%;'>";
    contenedor += "<input type='submit' class='form-control form-control-sm bg-primary text-white px-0 mx-0' value='generar plantilla' onclick='generarPlantilla()'>";
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
        contenedor += `<a href="#" class="form-control form-control-sm bg-primary text-white" data-toggle="modal" onclick="gestionNotasEstudiantes(${data[i][propiedadId]})" data-target="#agregarNotas">Agregar Notas</a>`;
        contenedor += "</div></td>";
        contenedor += "</tr>";
    }

    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}


function activarEscuchaSelectMateria() {

    var selectElement = document.getElementById("idAsignaturasDocente");


    selectElement.addEventListener("change", function () {

        let grupo = document.getElementById('GrupoGradoDocente').value
        let periodo = document.getElementById('periodoAcademico').value

        if (grupo !== "") {
            listarEstudiantesGrupos( grupo, selectElement.value, periodo)
        } else {
            document.getElementById('tablaEstudiantesNotas').innerHTML = "<p>seleciona materia</p>"
        }
        

    });
}

function gestionNotasEstudiantes(identificacion) {
    document.getElementById("documenteEstudiante").value = identificacion;  

}


function guardarEstudiante() {
    let estudiante = document.getElementById('documenteEstudiante').value
    let notas = document.getElementById('notasEstudiante').value;
    let fallas = document.getElementById('fallaestudiante').value;
    let asignatura = document.getElementById("idAsignaturasDocente").value
    let periodoNota = document.getElementById("periodoAcademico").value
    let grupo = document.getElementById('GrupoGradoDocente').value;  

    let frm = new FormData();
    frm.append('grupo', grupo)
    frm.append('idEstudiante', estudiante);
    frm.append('periodoNota', periodoNota);
    frm.append('fallas', fallas);
    frm.append('nota', notas);
    frm.append('asignatura', asignatura); 
    fetchPostText('docente/registrarNotaAsistenciaEstudiante', frm, function (res) {

        if (res === "1") {
            let asignatura = document.getElementById("idAsignaturasDocente").value
            let grupo = document.getElementById('GrupoGradoDocente').value
            let periodo = document.getElementById('periodoAcademico').value
            listarEstudiantesGrupos(grupo, asignatura, periodo)
            document.getElementById('cerraModalNotas').click();  
        }

    })






}


function limpiarNotasModal() {

    borrarContenidoPorClase('notasEstudiante')

}


function borrarContenidoPorClase(clase) {

    var inputs = document.querySelectorAll('.' + clase);

    inputs.forEach(function (input) {

        if (input.type === 'text' || input.type === 'textarea') {

            input.value = '';
        } else if (input.type === 'checkbox') {

            input.checked = false;
        } else {

            input.value = '';
        }
    });
}
