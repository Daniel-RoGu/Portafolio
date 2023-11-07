//Relevancia de Prototypes - manejo avanzaado de objetos 

//object constructor - estructura dinamica para la construccion de objetos
function Cliente(nombre, saldo) {
    this.nombre = nombre;
    this.saldo = saldo;
};

const Daniel = new Cliente('Daniel R', 1000);

function formatoCliente(cliente) {
    const {nombre, saldo} = cliente;
    return `El cliente ${nombre}, tiene un saldo de ${saldo}`;
};

console.log(formatoCliente(Daniel));

function Empresa(nombre, saldo, categoria) {
    this.nombre = nombre;
    this.saldo = saldo;
    this.categoria = categoria;
};

const CCJ = new Empresa('CCJ', 2000, 'Streamer');

function formatoEmpresa(empresa) {
    const {nombre, saldo, categoria} = empresa;
    return `El cliente ${nombre}, tiene un saldo de ${saldo} y pertenece a la categoria de ${categoria}`;
};

console.log(formatoEmpresa(CCJ));