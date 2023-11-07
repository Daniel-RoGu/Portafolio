//.MAP

const carrito = [
    {nombre: 'Moninor 20"', precio: 280},
    {nombre: 'Moninor 28"', precio: 300},
    {nombre: 'Moninor 42"', precio: 380},
    {nombre: 'Moninor 50"', precio: 420},
    {nombre: 'Moninor 52"', precio: 428},
    {nombre: 'Moninor 70"', precio: 620},
]

//array method forEach
carrito.forEach( function(producto) { // el forEach tambien se implementa como una funcion cuando es llamada en este caso desde un arreglo
    console.log(`${producto.nombre} - Precio: ${producto.precio}`);
})

// el .map hace lo mismo que el .forEach

//array method map
carrito.map( function(producto) { // el map tambien se implementa como una funcion cuando es llamada en este caso desde un arreglo
    console.log(`${producto.nombre} - Precio: ${producto.precio}`);
})

// la diferencia del .map es que este crea un arreglo nuevo, pudiendo asignarse a una variable que lo contenga
const nuevoArreglo = carrito.map( function(producto) { 
    return `${producto.nombre} - Precio: ${producto.precio}`;
})