//CONVERCION DE STRING A NUMERO

const numero1 = "20";
const numero2 = "20.2";
const numero3 = "Uno";
const numero4 = 20;

console.log(Number.parseInt(numero1));
console.log(Number.parseInt(numero2));
console.log(Number.parseFloat(numero2));
console.log(Number.parseInt(numero3)); // retorna un "Nan" por que no hay nada que pueda convertirse a entero

// revisar si la variable es un numero entero
console.log(Number.isInteger(numero4)); // retorna una boleano dependiendo el valor de verdad de la condicion
console.log(Number.isInteger(numero3));