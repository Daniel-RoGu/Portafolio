const producto = 'Monitor de 20 pulgadas';
console.log(producto);

//para remplazar
console.log(producto.replace('pulgadas', '"'));
console.log(producto.replace('Monitor', 'Monitor curvo'));

//para cortar
console.log(producto.slice(0, 14));
console.log(producto.slice(8));
console.log(producto.substring(0, 14));
console.log(producto.charAt(0));
