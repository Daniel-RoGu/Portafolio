//SELECCIONAR ELEMENTOS POR SU CLASE

const header = document.getElementsByClassName('header');
console.log(header);

const hero = document.getElementsByClassName('hero');
console.log(hero);

// si las clases existen mas de una vez
const contenedor = document.getElementsByClassName('contenedor');
console.log(contenedor);

// si una clase no existe  // retorna un arreglo vacio
const noExiste = document.getElementsByClassName('noExiste');
console.log(noExiste);