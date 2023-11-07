// TRATAMIENTO DE ESPACIOS EN BLANCO
const producto = '     Monitor de 20 pulgadas     ';

console.log(producto);
console.log(producto.length);

// para eliminar espacios al comienzo
console.log(producto.trimStart());
console.log(producto.length);

// para eliminar espacios al final
console.log(producto.trimEnd());

// para eliminar todo
console.log(producto.trimStart().trimEnd());
console.log(producto.trim());