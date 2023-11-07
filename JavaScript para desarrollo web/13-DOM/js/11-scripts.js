//Ejemplo avanzado de edicion de HTML desde JS

const btnFlotante = document.querySelector('.btn-flotante');
const footer = document.querySelector('.footer');

//AGREGANDO EVENTOS DE BOTON 

/*
// forma1 de agregar eventos con funciones a un boton   // () =>  funcion sin nombre  
btnFlotante.addEventListener('click', () => { // el primer argumento se relaciona al tipo de evento, y la segunda a la funcion que se va ejecutar tras darse el evento
    alert('has precionado el boton');
});
*/
// forma2 de agregar eventos con funciones a un boton    
btnFlotante.addEventListener('click', seleccionBoton); // el primer argumento se relaciona al tipo de evento, y la segunda a la funcion que se va ejecutar tras darse el evento

function seleccionBoton() {
    //alert('has precionado el boton');
    // en el if() se pregunta si la etiqueta tiene la clase (activo) cuando se presiona el boton, si la tiene la remueve, si no la asigna                            
    if (footer.classList.contains('activo')) { // .constains() es un metodo que permite verificar si una etiqueta tiene una clase especifica
        footer.classList.remove('activo'); // .remove() permite eliminar la clase (activo) de la etiqueta
        //btnFlotante.classList.remove('activo'); // permite desactivar el coloreado del boton
        this.classList.remove('activo'); // hace lo mismo de la linea 22
        this.textContent = 'Idioma y Moneda'; // reasigna el nombre del boton
    } else {
        footer.classList.add('activo'); // (activo) es una clase que en el css habilita una mayor visibilidad del footer
        //btnFlotante.classList.add('activo'); // colorea el boton en tono rojo por la configuracion de la clase en el CSS
        this.classList.add('activo'); // hace lo mismo de la linea 26
        this.textContent = 'X cerrar'; // reasigna el nombre del boton
    }
    console.log(footer.classList);
}