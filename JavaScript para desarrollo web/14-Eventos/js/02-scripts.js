//EVENTOS CON EL MOUSE 

const navegacion = document.querySelector('.navegacion');   

// registrar evento click
navegacion.addEventListener(`click`, () => {
    console.log('Click en la navegacion');
});

// registrar evento ingresa mouse a un etiqueta
navegacion.addEventListener(`mouseenter`, () => {
    console.log('entrando en el menu de navegacion');
    navegacion.style.backgroundColor = 'white';
});

// registrar evento sale mouse de una etiqueta
navegacion.addEventListener(`mouseout`, () => {
    console.log('saliendo del menu de navegacion');
    navegacion.style.backgroundColor = 'transparent';
});

// registrar evento se presiona el mouse dentro de una etiqueta
navegacion.addEventListener(`mousedown`, () => { // muy similar al evento 'click'
    console.log('dando click precionado en el menu de navegacion');
    navegacion.style.backgroundColor = 'white';
});

// registrar evento se deja de presiona el mouse dentro de una etiqueta
navegacion.addEventListener(`mouseup`, () => { // muy similar al evento 'mouseout'
    console.log('soltando el click en el menu de navegacion');
    navegacion.style.backgroundColor = 'transparent';
});

// registrar evento doble click dentro de una etiqueta
navegacion.addEventListener(`dblclick`, () => { 
    console.log('soltando el click en el menu de navegacion');
    navegacion.style.backgroundColor = 'red';
});