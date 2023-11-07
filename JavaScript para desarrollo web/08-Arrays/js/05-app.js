//AÑADIR ELEMENTOS AL COMIENZO O FINAL DEL ARRAY

/*
const meses = ['Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio']; 
console.table(meses);

//agregar al final
meses.push('Julio');
meses.push('Agosto');
console.table(meses);
*/

const carrito = [];

function Producto(nombre, precio){
    this.nombre = nombre;
    this.precio = precio;
    this.disponibilidad = true;
}

carrito.push(new Producto('PC', 600)); //agrega al final
carrito.push(new Producto('Celular', 300));
carrito.unshift(new Producto('Tv 55"', 480)); //agrega al comienzo
console.table(carrito);
console.log(carrito);