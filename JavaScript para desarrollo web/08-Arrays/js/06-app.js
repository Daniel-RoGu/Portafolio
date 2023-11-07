//CREAR UN NUEVO ARRAY CON SPREAD OPERATOR

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

// metodologia de mantenimiento de arrays usando spread operator
let resultado;
resultado = [...carrito, new Producto('Nevera', 380)]; // los tres puntos (...carrito) hacen una copia del array carrito y se agrega elementos a la copia
resultado = [...resultado, new Producto('Moto', 800)]; // en esta ocacion para agregar nuevos valores al resultado se debe hacer una copia del resultado para luego agregar 
console.table(resultado);
resultado = [new Producto('Moto2', 820), ...resultado]; // en esta ocacion agrega el nuevo valor al resultado y luego hace una copia del areglo 
console.table(resultado);
