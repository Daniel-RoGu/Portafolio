//Primer PROTOTYPE

function Cliente(nombre, saldo) {
    this.nombre = nombre;
    this.saldo = saldo;
};

Cliente.prototype.tipoCliente = function () { // estructura valida para implementar funciones con Prototype
    let tipo;

    if (this.saldo > 10000) {
        tipo = 'Gold';
    }else if (this.saldo > 5000) {
        tipo = 'Platinum';
    }else {
        tipo = 'Normal';
    }

    return tipo;
};

Cliente.prototype.infoCliente = function () {
    //se usa el this porque la funcion es parte del Prototype del objeto, por tanto se accede a las propiedades del objeto (this)
    return `El cliente ${this.nombre}, tiene un saldo de ${this.saldo} y su tipo de cliente es ${this.tipoCliente()}`;
};

Cliente.prototype.retiroSaldo = function (retiro) {
    this.saldo -= retiro;
    return `El nuevo saldo del cliente ${this.nombre} es de ${this.saldo}`;
};

Cliente.prototype.consignaSaldo = function (consignacion) {
    this.saldo += consignacion;
    return `El nuevo saldo del cliente ${this.nombre} es de ${this.saldo}`;
};

//UTILIZANDO HERENCIA
function Persona(nombre, saldo, telefono){
    // estructura para usar herencia utilizando Prototypes
    Cliente.call(this, nombre, saldo); // el this refiere a los elementos propios del objeto, seguidamente los atributos a heredar 
    this.telefono = telefono
};
//heredando funciones del Prototype del objeto Cliente al objeto Persona
Persona.prototype = Object.create( Cliente.prototype ); //metodo para heredar las funciones de una clase a otra

//para asignar el constructor del Cliente en la Persona
Persona.prototype.constructor = Cliente;

Persona.prototype.infoPersona = function () {
    return `${this.infoCliente()}, ademas tiene asignado el numero de telefono ${this.telefono}`;
};

//Instanciando
const Daniel = new Persona('Daniel', 4000, 3215468);
console.log(Daniel);
console.log(Daniel.infoCliente());
console.log(Daniel.consignaSaldo(2000));
console.log(Daniel.infoCliente());
console.log(Daniel.infoPersona());