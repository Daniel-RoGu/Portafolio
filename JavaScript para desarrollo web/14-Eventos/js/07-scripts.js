//PREVENIR EVENT BUBBLING CON DELEGATION

const cardDiv = document.querySelector('.card');

cardDiv.addEventListener('click', (evento) => {
    if (evento.target.classList.contains('titulo')) { // permite buscar en el html una etiqueta con la clase ('titulo')
        console.log('Diste click en el titulo');
    }
    if (evento.target.classList.contains('precio')) { // permite buscar en el html una etiqueta con la clase ('precio')
        console.log('Diste click en el precio');
    }
    if (evento.target.classList.contains('card')) { // permite buscar en el html una etiqueta con la clase ('card')
        console.log('Diste click en el card');
    }
});