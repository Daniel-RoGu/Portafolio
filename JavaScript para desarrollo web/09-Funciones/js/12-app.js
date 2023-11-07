//ARROW FUNCTION EN UN FOREACH Y UN MAP

const carrito = [
    {nombre: 'Moninor 20"', precio: 280},
    {nombre: 'Moninor 28"', precio: 300},
    {nombre: 'Moninor 42"', precio: 380},
    {nombre: 'Moninor 50"', precio: 420},
    {nombre: 'Moninor 52"', precio: 428},
    {nombre: 'Moninor 70"', precio: 620},
]

const nuevoArreglo = carrito.map( (producto) => { 
    return `${producto.nombre} - Precio: ${producto.precio}`;
})
/* estructura simplificada del .map
    const nuevoArreglo = carrito.map( producto => `${producto.nombre} - Precio: ${producto.precio}`);
*/ 


// aunque la sintaxis es valida, el .foreach no puede ser asignado a una variable como su par .map, por lo tanto no retorna nada
const nuevoArreglo2 = carrito.forEach( (producto) => { 
    return `${producto.nombre} - Precio: ${producto.precio}`;
})
/* sintaxis apropiada
    carrito.forEach( (producto) => { 
        console.log(`${producto.nombre} - Precio: ${producto.precio}`);
    })
*/
/* sintaxis simplificada
    carrito.forEach( producto => console.log(`${producto.nombre} - Precio: ${producto.precio}`));
*/

console.log(nuevoArreglo);
console.log(nuevoArreglo2);