// Formas de caracterizar una constante como string
//const producto = "Monitor de 20p";
const producto = "Monitor de 20\""; // (\") permite usar comilla dentro de las comillas del string, la " representa pulgadas
const producto2 = String('Monitor de 40"'); // se puede usar comilla doble dentro de una estructura con comillas simples
const producto3 = new String('Monitor de 91p');

console.log(producto);
console.log(producto2);
console.log(producto3);