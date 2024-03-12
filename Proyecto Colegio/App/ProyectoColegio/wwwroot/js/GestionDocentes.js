window.onload = async function () {
    //Selectores DOM
    selectorSede("");
    selectorSedeDocente("");

    //Funciones
    listargradosTodos("");

    listarTiposDeSangre("");
    ListarTiposDeDocumento("");
    ListarDiscapacidades("");
    ListarSisben("");
    ListarGeneros("");
    ListarEPS("");
    ListarEstratos("");

    //Listas por agregrar



    obtenerlistadocentes(); 

}



function selectorSede(valor) {

    fetchGet('Funcionario/ListarSedes', function (data) {
      
        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selectsede", newArray, valor);
        }

    })


    activarEscuchaSelect(); 

}

function selectorSedeDocente(valor) {

    fetchGet('Funcionario/ListarSedes', function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selectsededocente", newArray, valor);
        }

    })


    activarEscuchaSelectGeneral("selectsededocente");

}

function listarTiposDeSangre(valor) {

    fetchGet('Funcionario/ListarTiposDeSangre', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selecttiposangre", newArray, valor);
        }

    })

}

function ListarTiposDeDocumento(valor) {

    fetchGet('Funcionario/ListarTiposDeDocumento', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selecttipodocumento", newArray, valor);
        }

    })

}

function ListarDiscapacidades(valor) {

    fetchGet('Funcionario/ListarDiscapacidades', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selecttipodiscapacidad", newArray, valor);
        }

    })

}

function ListarSisben(valor) {

    fetchGet('Funcionario/ListarSisben', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selecttiposisben", newArray, valor);
        }

    })

}

function ListarGeneros(valor) {

    fetchGet('Funcionario/ListarGeneros', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selecttipogenero", newArray, valor);
        }

    })

}

function ListarEPS(valor) {

    fetchGet('Funcionario/ListarEPS', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selecttipoeps", newArray, valor);
        }

    })

}

function ListarEstratos(valor) {

    fetchGet('Funcionario/ListarEstratos', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selecttipoestrato", newArray, valor);
        }

    })

}

function listargrados(valor, Nombre){

    fetchGet('Funcionario/ListarGruposGradoSede/?sede=' + Nombre, function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selectgrados", newArray, valor);
        }

    })

}



function listargradosTodos(valor) {

    fetchGet('Funcionario/ListarGrados', function (data) {


        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("selectgrados", newArray, valor);
        }

    })

}




function activarEscuchaSelect() {

    var selectElement = document.getElementById("selectsede");


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        var selectedText = selectElement.options[selectElement.selectedIndex].text;

        if (selectedText === 'TODOS') { listargradosTodos("") } else { listargrados("", selectedText)};  


    });
}

function activarEscuchaSelectGeneral(idEtiqueta) {

    var selectElement = document.getElementById(idEtiqueta);


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        var selectedText = selectElement.options[selectElement.selectedIndex].text;

        if (selectedText === 'TODOS') { listargradosTodos("") } else { listargrados("", selectedText) };


    });
}


function obtenerlistadocentes() {
    fetchGet('Funcionario/ListarDocentesSedeInfoCompleta/?sede=CENTRAL', function (data) {

        generatableProfesores(data);  

    })


}



function generatableProfesores(data) {



    let tabla = generarTablaCargueInventario(
        data,
        [

            { valor: "Datos Personales", size: "25" },
            { valor: "Datos de Contacto", size: "25" },
            { valor: "Información Laboral", size: "20" },
            { valor: "Información Adicional", size: "20" },
            { valor: "Opciones", size: "10" },
        ],

        [
            [
                { titulo: "Nombre completo", valor: "nombreDocente" },
                { titulo: "Documento", valor: "identificacion" },
                { titulo: "Tipo de sangre", valor: "tipoSangre" },
                { titulo: "Genero", valor: "genero" },
            ],
            [
                { titulo: "Número de teléfono", valor: "telefonoFijo" },
                { titulo: "Dirección", valor: "direccion" },
                { titulo: "Teléfono", valor: "telefonoCelular" },
                { titulo: "Correo", valor: "correo" },
            ],
            [
                { titulo: "Sede de trabajo", valor: "sede" },
                { titulo: "Horas de trabajo", valor: "horasTrabajo" },
            ],
            [
                { titulo: "Discapacidad", valor: "discapacidad" },
                { titulo: "SISBEN", valor: "sisben" },
                { titulo: "Estrato", valor: "estrato" },
                { titulo: "EPS", valor: "eps" },
            ]
        ],
        "idDocente"
    )

    document.getElementById("tableprofesores").innerHTML = tabla;


}

function generarTablaCargueInventario(
    data,
    cabezera,
    propiedades,
    propiedadId
) {
    console.log(cabezera)

    var contenedor = "<table class='table table__information table-sm'>";
    contenedor += "<thead >";
    contenedor += "<tr>";

    // Generar cabecera de la tabla
    for (let i = 0; i < cabezera.length; i++) {
        contenedor += `<th scope='col' class='font-weight-normal border-estilo' style='width:${cabezera[i].size}%;'>${cabezera[i].valor}</th>`;
    }

    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody >";

    // Generar filas de la tabla
    for (let i = 0; i < data.length; i++) {
        contenedor += "<tr class='table__row'>";


        for (var m = 0; m < propiedades.length; m++) {
            contenedor += `<td data-label='${cabezera[m + 1].valor}' class="table_colums">`;
            let subpro = propiedades[m];

            // Generar contenido de las celdas
            for (let k = 0; k < subpro.length; k++) {
                contenedor += ` <div class="colums__text py-0 my-0">
                                        <span class="text__bold">${subpro[k].titulo
                    } :</span>
                                        <span class="text__normal">${data[
                        i
                    ][subpro[k].valor]}</span>
                                    </div>`;
            }

            contenedor += "</td>";
        }

        // Botones de acción para cada fila
        contenedor += "<td><div class='colums__options'>";
        contenedor += `<a href="#" class="form-control form-control-sm bg-primary text-white" data-toggle="modal" data-target="#Asignargrado">Asignar Grado</a>`;
        contenedor += "</div></td>";
        contenedor += "</tr>";
    }

    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}


//function guardardocente() {
//    let frm = new FormData();
//    let docuemnto = document.getElementById('').value;
//    frm.append('docuemto', docuemnto);  
//    fetchPostText('', frm, function (res) {

//        if (res === '1') {

//            console.log('dato guardado correctamentre')

//        } else {

//            console.log('error')
//        }

//    })

//}
