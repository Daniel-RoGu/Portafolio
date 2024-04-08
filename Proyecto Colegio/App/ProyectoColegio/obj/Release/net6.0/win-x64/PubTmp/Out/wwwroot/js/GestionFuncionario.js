window.onload = async function () {

    selectorSedeFuncionario("");

}

function selectorSedeFuncionario(valor) {

    fetchGet('Funcionario/ListarSedes', function (data) {

        if (data.length > 0) {
            const newArray = data.map((item) => ({
                value: item[0],
                text: item[1],
            }));

            selectdate("sedeGestiosDocente", newArray, valor);
        }

    })


    activarEscuchaSelectGeneral("sedeGestiosDocente");

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

function listargrados(valor, Nombre) {

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

function obtenerlistadocentes() {
    fetchGet('Funcionario/ListarDocentesSedeInfoCompleta/?sede=CENTRAL', function (data) {

        generatableProfesores(data);

    })
}


function activarEscuchaSelectGeneral(idEtiqueta) {

    var selectElement = document.getElementById(idEtiqueta);


    selectElement.addEventListener("change", function () {

        var selectedValue = selectElement.value;
        var selectedText = selectElement.options[selectElement.selectedIndex].text;

        if (selectedText === 'TODOS') { listargradosTodos("") } else { listargrados("", selectedText) };


    });
}


