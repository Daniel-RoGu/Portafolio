// FUNCION .every

const carrito = [
    { nombre: 'Monitor 27 Pulgadas', precio: 500 },
    { nombre: 'Televisión', precio: 100 },
    { nombre: 'Tablet', precio: 200 },
    { nombre: 'Audifonos', precio: 300 },
    { nombre: 'Teclado', precio: 400 },
    { nombre: 'Celular', precio: 700 },
]

// retorna un true cuando todos los valores del arreglo complen con la condicion 
const resultado = carrito.every( producto => producto.precio < 1000); // todos los elementos deben cumplirla
console.log(resultado);

const resultado2 = carrito.every( producto => producto.precio < 700); // al menos un elemento debe cumplirla
console.log(resultado2);