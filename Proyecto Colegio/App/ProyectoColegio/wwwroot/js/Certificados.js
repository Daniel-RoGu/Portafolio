window.onload = function () {

    selectorSede("")
    listarestudiantes();  
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

        if (selectedText !== "") { listargrados("", selectedText) };


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



function listarestudiantes() {
    let sedes = document.getElementById("selectsede").value
    let grupos = document.getElementById("selectgrupos").value
    let idetificacion = document.getElementById('inputsearch').value.trim()


    if (sedes === 'TODOS') {
        sedes = null
    }

    if (grupos === 'TODOS') {
        grupos = null

    }

    fetchGet(`Funcionario/ListarEstudiantesSedeGrupo/?sede=${sedes}&grupo=${grupos}&identificacion=${idetificacion}`, function (data) {

        generatableProfesores(data)
    })



}



function generatableProfesores(data) {



    let tabla = generarTablaCargueInventario(
        data,
        [

            {
                valor: "Información General", size: "30"
            },
            { valor: "Información Médica", size: "30" },
            { valor: "Información Socioeconómica", size: "25" },

            { valor: "Opciones", size: "15" },
        ],

        [
            [
                { titulo: "Codigo estudiante", valor: "codigoEstudiante" },
                { titulo: "Nombre completo", valor: "nombreUsuario" },
                { titulo: "Documento", valor: "identificacion" },
                { titulo: "Tipo documento", valor: "tipoDocumento" },
            ],
            [
                { titulo: "Tipo sangre", valor: "tipoSangre" },
                { titulo: "Eps", valor: "eps" },
                { titulo: "Discapacidad", valor: "discapacidad" },

            ],
            [
                { titulo: "Estrato", valor: "estrato" },
                { titulo: "sisben", valor: "sisben" },
            ],

        ],
        "identificacion"
    )

    document.getElementById("tablaCertificados").innerHTML = tabla;
    PaginationTable(10, "bodyTableGestioncv")


}

function generarTablaCargueInventario(
    data,
    cabezera,
    propiedades,
    propiedadId
) {


    var contenedor = "<table class='table table__information table-sm'>";
    contenedor += "<thead >";
    contenedor += "<tr>";

    // Generar cabecera de la tabla
    for (let i = 0; i < cabezera.length; i++) {
        contenedor += `<th scope='col' class='font-weight-normal border-estilo' style='width:${cabezera[i].size}%;'>${cabezera[i].valor}</th>`;
    }

    contenedor += "</tr>";
    contenedor += "</thead>";
    contenedor += "<tbody id='bodyTableGestioncv'>";


    for (let i = 0; i < data.length; i++) {
        contenedor += "<tr class='table__row'>";


        for (var m = 0; m < propiedades.length; m++) {
            contenedor += `<td data-label='${cabezera[m + 1].valor}' class="table_colums">`;
            let subpro = propiedades[m];


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


        contenedor += "<td class='colums__options'>";
        contenedor += `<a href="#" class="form-control form-control-sm bg-primary text-white" data-toggle="modal" data-target="#BoletinesModal">Boletines</a>
                            <a href="#" class="form-control form-control-sm bg-primary text-white" data-toggle="modal" data-target="#Registrobservacion">Certificados
                            </a>`;
        contenedor += "</td>";
        contenedor += "</tr>";
    }

    contenedor += "</tbody>";
    contenedor += "</table>";

    return contenedor;
}



function PaginationTable(filasPorPagina, table) {
    let paginaActual = 1
    const tabla = document.getElementById(table);
    let filas = tabla.rows;

    let TotalFilas = filas.length

    const totalPaginas = Math.ceil(TotalFilas / filasPorPagina);
    document.getElementById("controPaginacionInPut").setAttribute("max", totalPaginas)
    document.getElementById("controPaginacionInPut").value = paginaActual;
    function mostrarPagina(pagina) {
        for (let i = 0; i < TotalFilas; i++) {
            if (i < (pagina * filasPorPagina) && i >= ((pagina - 1) * filasPorPagina)) {
                filas[i].style.display = "table-row";
            } else {
                filas[i].style.display = "none";
            }
        }
        const primerRegistro = ((pagina - 1) * filasPorPagina) + 1;
        const ultimoRegistro = Math.min(pagina * filasPorPagina, TotalFilas);


        const infoPaginacion = document.getElementById("page");
        infoPaginacion.textContent = `Mostrando Registros ${primerRegistro} - ${ultimoRegistro} de ${TotalFilas}`;
    }

    function botones() {
        document.getElementById("btn_next").addEventListener("click", function () {

            if (paginaActual <= totalPaginas - 1) {

                paginaActual = parseInt(paginaActual + 1)
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })



        document.getElementById("btn_prev").addEventListener("click", function () {

            if (paginaActual > 1) {


                paginaActual = paginaActual - 1
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })




        document.getElementById("btn_inicio").addEventListener("click", function () {

            if (paginaActual > 1) {


                paginaActual = 1
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })



        document.getElementById("btn_inicio").addEventListener("click", function () {

            if (paginaActual > 1) {


                paginaActual = 1
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })



        document.getElementById("btn_final").addEventListener("click", function () {

            if (paginaActual <= totalPaginas - 1) {


                paginaActual = totalPaginas
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            }
        })


        document.getElementById("controPaginacionInPut").addEventListener("input", function () {

            let pagina = this.value.replace(/\s/g, '')
            if (pagina > 0 && pagina <= TotalFilas) {
                paginaActual = pagina
                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;

            } else {
                paginaActual = paginaActual

                mostrarPagina(paginaActual);
                document.getElementById("controPaginacionInPut").value = paginaActual;
            }
        })

    }

    mostrarPagina(paginaActual);
    botones();
}


function filtrosEstudiantes() {
    let idetificacion = document.getElementById('inputsearch').value.trim();
    let sedes = document.getElementById('selectsede').value
    let grupos = document.getElementById('selectgrupos').value


    idetificacion = idetificacion.length === 0 ? null : idetificacion;
    sedes = sedes === 'TODOS' ? null : sedes;
    grupos = grupos === 'TODOS' ? null : grupos;







    fetchGet(`Funcionario/ListarEstudiantesSedeGrupo/?sede=${sedes}&grupo=${grupos}&identificacion=${idetificacion}`, function (data) {

        generatableProfesores(data);


    })

}