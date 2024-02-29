$(document).ready(function () {

    /*SELECTORES DE LA VISTA "Funcionario/GestionAsignaturas" */

    function asignaturasSelectChanged() {
        var valorSeleccionado = $('#asignaturasSelect').val();
        return valorSeleccionado;
    }

    function docentesSelectChanged() {
        var valorSeleccionado = $('#docentesSelect').val();
        return valorSeleccionado;
    }

    function grupoSelectChanged() {
        var valorSeleccionado = $('#grupoSelect').val();
        return valorSeleccionado;
    }
    
    function asignaturasSelect2Changed() {
        var valorSeleccionado = $('#asignaturasSelect2').val();
        return valorSeleccionado;
    }
    
    function nombreCompetenciaSelectChanged() {
        var valorSeleccionado = $('#nombreCompetencia').val();
        return valorSeleccionado;
    }

    function objetivoCompetenciaSelectChanged() {
        var valorSeleccionado = $('#objetivoCompetencia').val();
        return valorSeleccionado;
    }
    
    function detalleCompetenciaSelectChanged() {
        var valorSeleccionado = $('#detalleComepetencia').val();
        return valorSeleccionado;
    }

    //EVENTOS DE LA VISTA "Funcionario/GestionAsignaturas"

    function habilitarBoton() {
        // Verifica si se ha seleccionado una opción en cada select
        var asignaturaSeleccionada = $('#asignaturasSelect').val();
        var docenteSeleccionado = $('#docentesSelect').val();
        var grupoSeleccionado = $('#grupoSelect').val();

        // Habilita o deshabilita el botón en función de las selecciones
        var btnOpcion1 = $('#btnOpcion1');
        btnOpcion1.prop('disabled', !asignaturaSeleccionada || !docenteSeleccionado || !grupoSeleccionado);
    }

    // Define una función para verificar si todos los selectores tienen algún valor
    function areSelectorsFilled() {
        var asignaturaSeleccionada = $('#asignaturasSelect').val();
        var docenteSeleccionado = $('#docentesSelect').val();
        var grupoSeleccionado = $('#grupoSelect').val();

        return asignaturaSeleccionada && docenteSeleccionado && grupoSeleccionado;
    }

    function areSelectorsFilledCompetencias() {
        var asignaturaSeleccionada = $('#asignaturasSelect2').val();
        var nombreCompetencia = $('#nombreCompetencia').val();
        var objetivoCompetencia = $('#objetivoCompetencia').val();
        var detalleComepetencia = $('#detalleComepetencia').val();

        return asignaturaSeleccionada && nombreCompetencia && objetivoCompetencia && detalleComepetencia;
    }

    // Agrega la condición al evento clic del botón #btnOpcion1
    $('#btnOpcion1').click(function () {
        if (areSelectorsFilled()) {
            var asignaturaSeleccionada = $('#asignaturasSelect').val();
            var docenteSeleccionado = $('#docentesSelect').val();
            var grupoSeleccionado = $('#grupoSelect').val();

            var data = {
                asignaturaSeleccionada: asignaturaSeleccionada,
                docenteSeleccionado: docenteSeleccionado,
                grupoSeleccionado: grupoSeleccionado
            };

            sendToController(data, "Funcionario", "GestionAsignaturas");
        }
    });

    // Asocia la función al evento change de cada selector
    $('#btnOpcion2').click(function () {
        if (areSelectorsFilledCompetencias()) {
            var asignaturaSeleccionada = $('#asignaturasSelect2').val();
            var nombreCompetencia = $('#nombreCompetencia').val();
            var objetivoCompetencia = $('#objetivoCompetencia').val();
            var detalleComepetencia = $('#detalleComepetencia').val();

            var data = {
                nombreCompetencia: nombreCompetencia,
                objetivoCompetencia: objetivoCompetencia,
                detalleComepetencia: detalleComepetencia,
                asignaturaSeleccionada: asignaturaSeleccionada
            };

            sendToController(data, "Funcionario", "gestionCompetencias");
        }
    });

    /*SELECTORES DE LA VISTA "Docente/Principal" */

    function grupoSelectDocenteChanged() {
        var valorSeleccionado = $('#grupoSelectDocente').val();
        return valorSeleccionado;
    }

    function areSelectorsFilledDocente() {
        var grupoSeleccionado = $('#grupoSelectDocente').val();

        return grupoSeleccionado;
    }

    //EVENTOS DE LA VISTA "Funcionario/GestionAsignaturas"

    //$('#btnOpcion3').click(function () {
    //    if (areSelectorsFilledDocente()) {

    //        var grupo = $('#grupoSelectDocente').val();

    //        var data = {
    //            grupo: grupo
    //        };

    //        sendToController(data, "Docente", "Principal");    
    //    };

    //});

    //EVENTOS GENERALES PARA FLUJO DE DATOS HACIA UN CONTROLADOR

    // Define una función para enviar los datos al controlador
    function sendToController(data, controlador, metodo) {
        $.ajax({
            type: 'POST',
            /*url: '/Funcionario/' + metodo,*/
            url: '/' + controlador + '/' + metodo,
            data: data,
            success: function (responseData) {
            },
            error: function (error) {
                console.error(error);
            }
        });
    }

    //// Asocia la función al evento change de cada selector
    //$('#asignaturasSelect, #docentesSelect, #grupoSelect').change(function () {
    //    if (areSelectorsFilled()) {
    //        var asignaturaSeleccionada = $('#asignaturasSelect').val();
    //        var docenteSeleccionado = $('#docentesSelect').val();
    //        var grupoSeleccionado = $('#grupoSelect').val();

    //        var data = {
    //            asignaturaSeleccionada: asignaturaSeleccionada,
    //            docenteSeleccionado: docenteSeleccionado,
    //            grupoSeleccionado: grupoSeleccionado
    //        };

    //        // Llama a sendToController solo si el botón #btnOpcion1 está habilitado
    //        if ($('#btnOpcion1').prop('disabled') === false) {
    //            sendToController(data);
    //        }
    //    }
    //});

    

});