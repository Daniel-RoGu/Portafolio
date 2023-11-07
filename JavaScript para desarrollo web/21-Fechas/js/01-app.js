//Probando metodos de fecha en JS

const diaHoy = new Date();
let valor;

valor = diaHoy;
valor = diaHoy.getFullYear(); // año actual
valor = diaHoy.getMonth(); // toma los meses como en estructura de areglo, considerando a enero como el mes 0
valor = diaHoy.getMinutes(); // minuto actual
valor = diaHoy.getHours(); // hora actual en formato militar
valor = diaHoy.toLocaleString(); // trae el formato 3/11/2023, 17:50:06
valor = diaHoy.toLocaleTimeString(); // trae el formato 17:50:06
valor = diaHoy.toLocaleDateString(); // trae el formato 3/11/2023

console.log(diaHoy);
console.log(valor);


