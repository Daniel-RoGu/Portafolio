//Manejo de PROTOTYPES

//ejemplo objeto comun (poco dinamico)
const cliente = {
    nombre: 'Daniel',
    saldo: 500
};

console.log(cliente);
console.log(typeof cliente);

//object constructor - estructura dinamica para la construccion de objetos
function Cliente(nombre, saldo) {
    this.nombre = nombre;
    this.saldo = saldo;
};

const Daniel = new Cliente('Daniel R', 1000);

console.log(Daniel);
console.log(typeof Daniel);