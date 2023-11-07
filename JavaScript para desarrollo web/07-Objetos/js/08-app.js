// CONGELAR UN OBJETO PARA NO PODERLO MODIFICAR

//tambien habilita object metods 
"use strict"; //habilita el modo estricto para el fichero, lo que obliga a usar buenas practicas de programacion

const producto = {
    //Llave : valor de la llave
      nombre: "Monitor de 20 pulgadas",
      precio: 300,
      disponibilidad: true
};

Object.freeze(producto); //object metods que "congela" el objeto asignado, evitando modificaciones sobre sus atributos

producto.disponibilidad = false; // va arrojar un error por que el objeto ya no se puede modificar
producto.imagen = "imagen"; // va arrojar un error por que el objeto ya no se puede modificar

console.log(Object.isFrozen(producto));

//ejemplo del modo estricto
/*
cuando no se usa la siguiente linea es valida ya que el sistema asigna x como una variable permitiendo su lectura
x = 20;
console.log(x);
por su parte de usarse el modo estricto se debe definir (x)
let x = 20;
o
const x = 20;
*/