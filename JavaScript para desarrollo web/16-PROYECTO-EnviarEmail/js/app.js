
document.addEventListener('DOMContentLoaded', function() { //permite la activacion de eventos una vez cargado el html

    //objeto para validar si todos los inputs del formulario se han llenado
    const email = {
        email: '',
        asunto: '',
        mensaje: ''
    };

    //Selecionar los elementos de la interfaz
    const inputEmail = document.querySelector('#email');
    const inputAsunto = document.querySelector('#asunto');
    const inputMensaje = document.querySelector('#mensaje');
    const formulario = document.querySelector('#formulario');
    const btnSubmit = document.querySelector('#formulario button[type="submit"]');
    const btnReset = document.querySelector('#formulario button[type="reset"]');
    const spinner = document.querySelector('#spinner');

    //Asignar eventos
    inputEmail.addEventListener('blur', validar); //la funcion se llama sin parentesis solo para que esta se ejecute cunado se da el evento
    inputAsunto.addEventListener('input', validar); //el evento blur podria remplazarse por el evento input para tener respuestas mas rapidas
    inputMensaje.addEventListener('input', validar);

    formulario.addEventListener('submit', enviarEmail);

    btnReset.addEventListener('click', function (evento) {
        evento.preventDefault(); //evita la accion del reset por defecto
        reiniciarFormulario();
    });

    function enviarEmail (evento) {
        evento.preventDefault();

        spinner.classList.add('flex');
        spinner.classList.remove('hidden');

        setTimeout(() => { //funcion propia de js que permite realizar una accion en el tiempo establecido
            spinner.classList.remove('flex');
            spinner.classList.add('hidden');
            reiniciarFormulario();

            //generando una alerta
            const alertaMensaje = document.createElement('P');
            alertaMensaje.classList.add('bg-green-500', 'text-white', 'p-2', 'text-center', 'rounded-lg', 'mt-10', 'font-bold', 'text-sm', 'uppercase');

            alertaMensaje.textContent = 'Mensaje enviado correctamente';

            //agregandola al formulario
            formulario.appendChild(alertaMensaje);

            //para remover la alerta despues de tres segundos de enviado el mensaje
            setTimeout(() => {
                alertaMensaje.remove();
            }, 3000);

        }, 3000); // tiempo en milisegundos
        
    }

    function validar(evento) { //ya que la funcion se va usar en un evento, se puede pasar por parametros el evento ejecutado
        
        //para validar si se han registrado datos en los input
        if (evento.target.value.trim() === '') { // .trim() es un metodo de tipo string que elimina los espacios
            mostrarAlerta(`El campo ${evento.target.id} es obligatorio`, evento.target.parentElement);
            // evento.target.parentElement seleciona la etiqueta padre de el elemento html que dispara el evento
            email[evento.target.name] = ''; // se debe reiniciar el objeto para registrar nuevos valores en el input
            comprobarEmail(); // comprobacion necesaria
            return; //finaliza la ejecucion de la funcion
        } 

        //para validar si el email esta bien escrito
        if (evento.target.id === 'email' && !validarEmail(evento.target.value)) {  // retorna la alerta si el email registrado en el input no es valido
            mostrarAlerta('El email no es valido', evento.target.parentElement);
            email[evento.target.name] = ''; // se debe reiniciar el objeto para registrar nuevos valores en el input
            comprobarEmail(); // necesario para mantener la integridad de la validacion
            return;
        }

        limpiarAlerta(evento.target.parentElement); //elimina las alertas que ya se han generado cuando el input tiene una entrada

        //asignando valores registrados en los inputs a los atributos correspondientes en el objeto email
        email[evento.target.name] = evento.target.value.trim().toLowerCase(); //asigna valor sin espacios y en minuscula
        
        //comprobar el objeto de email
        comprobarEmail();
    };

    function mostrarAlerta(mensaje, referencia) {
        // comprueba si ya se a generado una alerta en la etiqueta
        /*const alerta = referencia.querySelector('.bg-red-600'); //selecciona la etiqueta que tenga la clase que pinta la alerta

        if (alerta) { 
            alerta.remove(); //elimina la clase de la etiqueta para que no se repitan alertas en los mismos input
        }*/
        limpiarAlerta(referencia);

        // Generar alerta en html
        const error = document.createElement('P'); // Es recomendable colocar las etiquetas en mayuscula
        error.textContent = mensaje;
        //uso de estilos css con tailwindcss - gestor de estilos como bootstrap
        error.classList.add('bg-red-600', 'text-white', 'p-2', 'text-center'); 
        //agrega un fondo de color rojo a la etiqueta, texto con fondo blanco, un padding de 2px y aliniacion de texto al centro
        
        //inyectar el error al formulario en el html
        referencia.appendChild(error); // se agrega un hijo (error) a la etiqueta correspondiente a la referencia 
        //agrega el contenido al final de la referencia html // si se usara un innerHTML se remplazaria todo el contenido de la etiqueta

    }

    function limpiarAlerta(referencia) {
        const alerta = referencia.querySelector('.bg-red-600'); //selecciona la etiqueta que tenga la clase que pinta la alerta

        if (alerta) { 
            alerta.remove(); //elimina la clase de la etiqueta para que no se repitan alertas en los mismos input
            //elimina la alerta
        } 
    }

    function validarEmail (email) {
        const regex =  /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/; // estructura de una exprecion regular
        //establece una estructura regular, en este caso para la configuracion valida de correos
        
        const resultado = regex.test(email); //metodo que permite validar si la estructura de texto del email es correcta
        return resultado;
    }

    function comprobarEmail () {
        //console.log(Object.values(email)); // crea un arreglo con los valores asignados a los atributos del objeto email
        //console.log(Object.values(email).includes('')); // comprueba si hay atributos del objeto vacios y retorna un booleano en respuesta
        if (Object.values(email).includes('')) {
            btnSubmit.classList.add('opacity-50');
            btnSubmit.disabled = true;
        } else {
            btnSubmit.classList.remove('opacity-50');
            btnSubmit.disabled = false;
        }
    }

    function reiniciarFormulario() {
        //reiniciar objeto de formulario
        email.email = '';
        email.asunto = '';
        email.mensaje = '';

        //limpiar contenido del formulario
        formulario.reset();
        comprobarEmail();
    }

});