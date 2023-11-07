//OPERACIONES USANDO MATH

let resultado;

// obteniendo Pi

resultado = Math.PI;
console.log(resultado);

// para redondear

resultado = Math.round(resultado);
console.log(resultado);

// para redondear arriba

resultado = Math.ceil(2.2);
console.log(resultado);

// para redondear abajo

resultado = Math.floor(2.9);
console.log(resultado);

// para obtener la raiz cuadrada

resultado = Math.sqrt(64);
console.log(resultado);

// para obtener el valor absoluto

resultado = Math.abs(64,2);
console.log(resultado);

// para obtener potencias

resultado = Math.pow(2, 8); // multiplica el primer numero por si mismo el numero de veces de el segundo numero 
console.log(resultado);

// para obtener el minimo

resultado = Math.min(2, 8, 6, 15, 1, -1); 

// para obtener el maximo

resultado = Math.max(2, 8, 6, 15, 1, -1); 
console.log(resultado);

// aleatorios

resultado = Math.random() * 20; // obtiene valores entre los primeros 20 numeros, aroja numeros flotantes
console.log(resultado);
resultado =  Math.floor(Math.random() * 20); // obtiene valores entre los primeros 20 numeros y los redondea a la baja
console.log(resultado);

