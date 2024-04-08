window.onload = function () {

    selectorSede("")

}

function selectorSede(valor) {

    fetchGet('Funcionario/ListarSedes', function (data) {
       

        if (data.length > 0) {

            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));
            
            selectdate("selectsede", newArray, valor);
            activarEscuchaSelectSede()
        } else {
            selectdate("selectsede", [], valor);
        }

    })






}

function listargrados(valor, Nombre) {

    fetchGet('Funcionario/ListarGradoSede/?sede=' + Nombre, function (data) {




        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selectgrados", newArray, valor);
            activarEscuchaSelectGrados(); 
        } else {
            selectdate("selectgrados", [], valor);

        }

    })

}


function listargrupos(valor, Nombre, grado) {

    fetchGet('Funcionario/ListarGruposGradoSede/?sede=' + Nombre + '&grado=' + grado, function (data) {




        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[1],
                text: item[1],
            }));

            selectdate("selectgrupos", newArray, valor);
            activarEscuchaSelectRangosHorarios(); 
        } else {
            selectdate("selectgrupos", [], valor);

        }

    })

}






function activarEscuchaSelectSede() {

    var selectElement = document.getElementById("selectsede");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        var selectedText = selectElement.options[selectElement.selectedIndex].text;

        if (selectedText !=="") { listargrados("", selectedText) };


    });
}

function activarEscuchaSelectGrados() {

    var selectElement = document.getElementById("selectgrados");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        var selectedText = selectElement.options[selectElement.selectedIndex].text;
        let nombresede = document.getElementById('selectsede').value;
        if (nombresede !== '' && selectedText !== '') { listargrupos('', nombresede, selectedText) }
       


    });
}



function activarEscuchaSelectRangosHorarios() {

    let selectElement = document.getElementById("RamgosHorarios");

    selectElement.addEventListener("change", function () {

        let rango = selectElement.value;
        let nombresede = document.getElementById('selectsede').value;
        let grupoGrado = document.getElementById('selectgrupos').value;  


  
        generarHorarioEstudiantil(nombresede, grupoGrado, rango); 



    });
  
}


function generarHorarioEstudiantil(sede, grupogrado, rango) {
 

    fetchGet('Funcionario/horarioacademico/?sede=' + sede + '&grupogrado=' + grupogrado + '&jornada=' + rango, function (data) {
        console.log(data)

        let tabla =  generarTablaHorario(data)

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



function listarDias(valor) {
    let data = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes"]
    const newArray = data.map((item) => ({
        value: item,
        text: item,
    }));

    selectdate("selectdias", newArray, valor);


}


function listarRangosHorarios(valor, Nombre) {

    fetchGet('Funcionario/Jornada/?jornadaSelect=' + Nombre, function (data) {




        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item,
                text: item +' '+ Nombre,
            }));

            selectdate("selectRangoHorario", newArray, valor);
       
        } else {
            selectdate("selectRangoHorario", [], valor);

        }

    })

}


function ListarMaterias(valor) {


    let sede = document.getElementById('selectsede').value;
    let grado = document.getElementById('selectgrados').value;


    fetchGet(`Funcionario/ListarAsignaturasGrupo/?sede=${sede}&grado=${grado}`, function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item,
                text: item,
            }));

            selectdate("materiaSelect", newArray, valor);
            activarEscuchaSelectDocente()

        } else {
            selectdate("materiaSelect", [], valor);

        }

    })

}




function ListarDocenteMateria(valor) {


    let sede = document.getElementById('selectsede').value;
    let grado = document.getElementById('selectgrados').value;
    let materia = document.getElementById('materiaSelect').value; 

    fetchGet(`Funcionario/ListarDocentesAsignaturasGrupo/?sede=${sede}&grado=${grado}&asignatura=${materia}`, function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("profesor", newArray, valor);

        } else {
            selectdate("profesor", [], valor);

        }

    })

}



function activarEscuchaSelectDocente() {

    var selectElement = document.getElementById("materiaSelect");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        var selectedText = selectElement.options[selectElement.selectedIndex].text;

        if (selectedValue!== ""){ ListarDocenteMateria('') }


    });
}




function agregarHorario() {

    listarDias('');
     let rango = document.getElementById("RamgosHorarios").value
    listarRangosHorarios('', rango)
    ListarMaterias('')

}


function validarCamposClase() {
    let camposSinCompletar = [];

  
    let dias = document.getElementById("selectdias").value;
    let horas = document.getElementById("selectRangoHorario").value;
    let materia = document.getElementById("materiaSelect").value;
    let profesor = document.getElementById("profesor").value;

   
    if (dias === "") camposSinCompletar.push("Días");
    if (horas === "") camposSinCompletar.push("Horas");
    if (materia === "") camposSinCompletar.push("Materia");
    if (profesor === "") camposSinCompletar.push("Profesor");

    return camposSinCompletar;
}



function guardarHorarioForm() {

    let sede = document.getElementById("selectsede").value;
    let grupos = document.getElementById("selectgrupos").value;
    let jornada = document.getElementById("RamgosHorarios").value;
    let dias = document.getElementById("selectdias").value;
    let horas = document.getElementById("selectRangoHorario").value;
    let materia = document.getElementById("materiaSelect").value;
    let profesor = document.getElementById("profesor").value;

    let formulario=[]
    formulario= validarCamposClase();

    if (formulario.length > 0) {
        mostrarError("Error al agregar la Asignatura al horario", "Por favor, complete todos los campos obligatorios indicados a continuación.", formulario);
        formulario = null; 

        return
    }

    let horarioFormData = new FormData();

    horarioFormData.append('nombreSede', sede);
    horarioFormData.append('nomAsignatura', materia);
    horarioFormData.append('nomGrupo', grupos);
    horarioFormData.append('identificacionDocente', profesor); 
    horarioFormData.append('diaHorarioClase', dias);
    horarioFormData.append('rangoHorario', horas);

    fetchPostText('Funcionario/RegistrarHorarioRetorno', horarioFormData, function (res) {

        if (res === "1") {

            document.getElementById('cerrarmodalHorio').click();  
            generarHorarioEstudiantil(sede, grupos, jornada); 
        }




    })

}

function limpiaModalHorario() {

    resetSelect('materiaSelect'); 
    resetSelect('selectRangoHorario');
    resetSelect('profesor');
    resetSelect('selectdias');
}



