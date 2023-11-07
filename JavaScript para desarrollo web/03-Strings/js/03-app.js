// FORMAS DE CONCATENAR

const producto = 'Monitor de 20 pulgadas ';
const precio = '30 USD ';

console.log(producto.concat(precio));
console.log(producto.concat('En descuento'));
console.log(producto + ': ' + precio);
console.log(producto, ': ', precio);

console.log(`El producto ${producto}tiene un precio de ${precio}`) // el tipo de comilla se obtiene con alt Gr + }