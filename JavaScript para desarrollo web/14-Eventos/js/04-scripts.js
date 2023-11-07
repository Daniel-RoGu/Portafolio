//EVENTO SUBMIT A UN FORMULARIO

const formulario = document.querySelector('#formulario');

/*//forma 1
formulario.addEventListener('submit', (evento) => {
    evento.preventDefault();

    console.log('Buscando...');

    console.log(evento);
    console.log(evento.target.method); // para saber el tipo de metodo de envio de datos del formulario
    console.log(evento.target.action); // para saber la ruta a donde redirecciona el boton
});
*/
//forma 2
formulario.addEventListener('submit', validandoFormulario);

function validandoFormulario (evento){
    evento.preventDefault(); // impide la accion normal del boton configurada en el html, para permitir la ejecucion desde el JS

    console.log('Buscando...');

    //console.log(evento);
    console.log(evento.target.method); // para saber el tipo de metodo de envio de datos del formulario
    console.log(evento.target.action); // para saber la ruta a donde redirecciona el boton
}