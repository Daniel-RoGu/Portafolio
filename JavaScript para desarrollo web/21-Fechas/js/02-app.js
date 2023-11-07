// Manejo de libreria moment.js

console.log(moment()); // informacion general de la herramienta

moment.locale('es');

console.log(moment().format('MMMM Do YYYY')); // retorna el formato "noviembre 3º 2023"
console.log(moment().format('MMMM Do YYYY h:mm:ss a')); // retorna el formato "noviembre 3º 2023 5:58:23 pm"
console.log(moment().format('LLLL', 'Dia de hoy')); // retorna "viernes, 3 de noviembre de 2023 18:01"

// estructura ideal para manejo de fechas de vencimiento
console.log(moment().add(3, 'days').calendar()) // muestra la fecha para dentro de tres dias en formato "lunes a las 18:04"
