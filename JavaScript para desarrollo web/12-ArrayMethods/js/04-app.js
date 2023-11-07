// FUNCION .filter

const carrito = [
    { nombre: 'Monitor 27 Pulgadas', precio: 500 },
    { nombre: 'Televisión', precio: 100 },
    { nombre: 'Tablet', precio: 200 },
    { nombre: 'Audifonos', precio: 300 },
    { nombre: 'Teclado', precio: 400 },
    { nombre: 'Celular', precio: 700 },
]

let resultado;

// filtra los valores del carrito que tengan un precio superior a (400)
resultado = carrito.filter( producto => producto.precio > 400 );

console.log(resultado);

// filtra los valores del carrito que tengan un precio inferior a (600)
resultado = carrito.filter( producto => producto.precio < 600 );

console.log(resultado);

// filtra los valores del carrito que no son audifonos
resultado = carrito.filter( producto => producto.nombre !== 'Audifonos' );

console.log(resultado);