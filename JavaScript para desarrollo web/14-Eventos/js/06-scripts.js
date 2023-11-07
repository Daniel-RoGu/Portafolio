// EVENT BUBBLING

const cardDiv = document.querySelector('.card');
const infoDiv = document.querySelector('.info');
const titulo = document.querySelector('.titulo');

cardDiv.addEventListener('click', (evento) => {
    evento.stopPropagation(); // limita la ejecucion del codigo al elemento especifico valorado, sin tener en cuenta a sus hijos o padre si es el caso
    console.log('click en el card');
}); 

infoDiv.addEventListener('click', (evento) => {
    evento.stopPropagation();
    console.log('click en la info');
}); 

titulo.addEventListener('click', (evento) => {
    evento.stopPropagation();
    console.log('click en el titulo');
}); 