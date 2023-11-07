// FUNCION REDUCER .reduce

const carrito = [
    { nombre: 'Monitor 27 Pulgadas', precio: 500 },
    { nombre: 'Televisión', precio: 100 },
    { nombre: 'Tablet', precio: 200 },
    { nombre: 'Audifonos', precio: 300 },
    { nombre: 'Teclado', precio: 400 },
    { nombre: 'Celular', precio: 700 },
]

// con un forEach
let total = 0;
carrito.forEach(producto => total += producto.precio );

console.log(total);

// con el .reduce                                                         // el valor asignado despues de la coma (0) es el valor de inicio del acumulador (total)   
let resultado = carrito.reduce( (total, producto) => total + producto.precio, 0 );
// el .reduce recive dos parametros, el primero corresponde a la variable asignada para acumular (total)
// el segundo parametro corresponde al iterador que va recorrer el arreglo
console.log(resultado);