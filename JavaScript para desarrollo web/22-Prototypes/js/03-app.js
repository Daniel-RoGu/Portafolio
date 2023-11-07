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

// Instanciando
const pepito = new Cliente(`Pepito`, 8000);
console.log(pepito);
console.log(pepito.tipoCliente());
console.log(pepito.infoCliente());
console.log(pepito.retiroSaldo(2000));
console.log(pepito);
//pepito.tipoCliente(); //forma de usar funciones creadas a partir de Prototype