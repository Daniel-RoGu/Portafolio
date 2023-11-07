//EVENTOS SOBRE LOS INPUT

const busqueda = document.querySelector('.busqueda');

/*
//evento para detectar escritura desde teclado (se presionan teclas)
busqueda.addEventListener('keydown', () => {
    console.log('Escribiendo... ');
});

//evento para detectar escritura desde teclado (se presionan teclas) // se activa tras precionar una tecla
busqueda.addEventListener('keyup', () => {
    console.log('Tecleando... ');
});

//evento para detectar cuando se sale de un input
busqueda.addEventListener('blur', () => {
    console.log('Saliendo... ');
});

//evento para detectar cuando se copia el contenido del input
busqueda.addEventListener('copy', () => {
    console.log('Copiado... ');
});

//evento para detectar cuando se pega contenido al input
busqueda.addEventListener('paste', () => {
    console.log('Pegado... ');
});

//evento para detectar cuando se corta contenido del input
busqueda.addEventListener('cut', () => {
    console.log('Cortado... ');
});

//evento para detectar cualquiera de los eventos anteriores
busqueda.addEventListener('input', () => {
    console.log('Detectado... ');
});
*/
//el parametro (evento) de la funcion permite encapsular los parametros relacionados a la interaccion en el input 
busqueda.addEventListener('input', (evento) => {
    console.log(evento);
    console.log(evento.type);
    console.log(evento.target);
    
    if (evento.target.value === '') {
        console.log('no a escrito nada...');
    } else {
        console.log(evento.target.value); // para saber el valor registrado en el input
    }
    
});