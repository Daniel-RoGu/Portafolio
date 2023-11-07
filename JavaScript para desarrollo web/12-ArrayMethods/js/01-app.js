//SABER SI EL ARREGLO TIENE ELEMENTOS 

const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio'];

const carrito = [
    { nombre: 'Monitor 27 Pulgadas', precio: 500 },
    { nombre: 'Televisión', precio: 100 },
    { nombre: 'Tablet', precio: 200 },
    { nombre: 'Audifonos', precio: 300 },
    { nombre: 'Teclado', precio: 400 },
    { nombre: 'Celular', precio: 700 },
]

// comprobar si un valor existe en un arreglo sencillo
const resultado = meses.includes('Enero');
console.log(resultado);

// para comprobar si un valor existe en un arreglo de objetos se usa .some
const existe = carrito.some( (producto) => {
    return producto.nombre === 'Celular';
})

// forma simplificada de (existe), solo se puede hacer por que tiene un solo parametro y un solo retorno
const existe2 = carrito.some( producto => producto.nombre === 'Celular');

console.log(existe);

// comprobar si un valor existe en un arreglo con .some
const resultado2 = meses.some( mes => mes === 'Febrero' );
console.log(resultado2);