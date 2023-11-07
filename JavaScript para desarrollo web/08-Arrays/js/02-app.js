//ACCESO A VALORES DE UN ARRAY

const numero = [10, 20, 30, 40, 50, [1, 2, 3]]; //las [] indican que es un arreglo el que se esta creando, por su parte {} indica que es un objeto
const meses = new Array('Enero', 'Febrero', 'Marzo');

console.log(numero);
console.table(numero);

//acceder a una posicion del arreglo
console.log(numero[3]);
console.log(numero[5][1]);