//COMPARAR VALORES

const numero1 = 20;
const numero2 = "20";
const numero3 = 30;

// Comparar numeros iguales

console.log(numero1 == numero2);
console.log(numero1 == numero3);

// Comparador estricto

console.log(numero1 === numero2);
console.log(typeof numero1);
console.log(typeof numero2);
console.log(numero1 === parseInt(numero2));

// Diferente

const password1 = "admin";
const password2 = "Admin";

console.log(password1 != password2);
console.log(numero1 != numero2); // no es eficiente al comparar un string y un entero con el mismo valor 
console.log(numero1 !== numero2); // permite comparar ademas del valor el tipo de dato