//FOR IN

const pendientes = ['tarea', 'comer', 'proyecto', 'estudiar'];

const automovil = {
    modelo: 'Camaro',
    year: 1969,
    motor: '6.0'
}

// es igual al for of, sin embargo este es para objetos
for( let carro in automovil){ // funciona igual que un alias en sql, al alias se le asignan los valores del objeto
    console.log(`${carro}: ${automovil[carro]}`); // y en el for se recorre cada valor
}

// forma eficiente de iterar sobre valores de un objeto
for( let [llave, valor] of Object.entries(automovil)){
    console.log(`${llave}: ${valor}`);
}
