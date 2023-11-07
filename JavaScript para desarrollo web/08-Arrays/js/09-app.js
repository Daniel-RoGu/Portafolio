//FOREACH

const carrito = [
    {nombre: 'Moninor 20"', precio: 280},
    {nombre: 'Moninor 28"', precio: 300},
    {nombre: 'Moninor 42"', precio: 380},
    {nombre: 'Moninor 50"', precio: 420},
    {nombre: 'Moninor 52"', precio: 428},
    {nombre: 'Moninor 70"', precio: 620},
]

for (let index = 0; index < carrito.length; index++) {
    /* const element = array[index]; */
    //console.log(carrito[index]); //muestra todo el contenido del array
    //console.log(carrito[index].nombre); //accede a un atributo especifico del objeto almacenado en el array
    console.log(`${carrito[index].nombre} - Precio: ${carrito[index].precio}`); // accede a los elementos subdivididos de los objetos del array
}

//el for como el forEach hacen lo mismo y tienen el mismo tiempo de ejecucion

//array method forEach
carrito.forEach( function(producto) { // el forEach tambien se implementa como una funcion cuando es llamada en este caso desde un arreglo
    console.log(`${producto.nombre} - Precio: ${producto.precio}`);
})