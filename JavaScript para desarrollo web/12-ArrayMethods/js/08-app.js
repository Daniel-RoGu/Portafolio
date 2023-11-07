//SPREAD OPERATOR 

const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio'];

const carrito = [
    { nombre: 'Monitor 27 Pulgadas', precio: 500 },
    { nombre: 'Televisión', precio: 100 },
    { nombre: 'Tablet', precio: 200 },
    { nombre: 'Audifonos', precio: 300 },
    { nombre: 'Teclado', precio: 400 },
    { nombre: 'Celular', precio: 700 },
]

// como agregar valores con spread operator (...) a un arreglo simple
const resultado = [ ...meses, 'Agosto'];
console.log(resultado);

// como agregar valores con spread operator (...) a un arreglo de objetos
const producto = {nombre: 'Disco SSD', precio: 200};
const resultado2 = [ ...carrito, {nombre: 'Portatil', precio: 1200}, producto];
console.log(resultado2);