//QUERY SELECTOR

// toma el primer elemento de clase llamado card
const card = document.querySelector('.card'); // el punto (.card) indica que es una clase
console.log(card);

// se puede tener selectros especificos como en CSS
const info = document.querySelector('.premium .info'); // se esta buscando una clase hija (.info) dentro de una padre (.premium)
console.log(info);

// seleccionar el segundo cart de hospedaje
const segundoCard = document.querySelector('section.hospedaje .card:nth-child(2)');
/* accede al segundo card de la etiqueta section con la clase hospedaje, usando la funcion nth-child(n) que permite 
seleccionar un elemento de la etiqueta con la misma clase en la posicion que se desee siempre que esta exista */
console.log(segundoCard);

// seleccionar elemento por id   // solo toma el primer elemento que encuentre con el valor del id
const formulario = document.querySelector('#formulario') // el numeral (#formulario) indica que es un id
console.log(formulario);

// seleccionar etiquetas html
const navegacion = document.querySelector('nav');
console.log(navegacion);