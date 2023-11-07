//RECORRIDO DE ARRAYS

const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio']; 
console.table(meses);
console.table(meses[0]);
console.table(meses[1]);
console.table(meses[3]);

for (let index = 0; index < meses.length; index++) {
    /* const element = array[index]; */
    console.log(meses[index]);
}