// tipos de declaracion de clases en JS

//Class declaration
class Cliente { 
    constructor (nombre, saldo) {
        this.nombre = nombre;
        this.saldo = saldo;
    };

    mostrarInfo() {
        return `Cliente ${this.nombre}, tu saldo es de ${this.saldo}`;
    };

    //metodos static son exclusivos de las clases, no se pueden llamar desde instancias
    static bienvenida () { //no requieren una instancia para ser llamada
        return 'Bienvenid@....'
    }
};

const juan = new Cliente('Juan', 400);
console.log(juan);
console.log(juan.mostrarInfo());

//llamando clase static, se llama directamente desde la clase
console.log(Cliente.bienvenida()); // no se puede llamar desde una instancia

//Class expression
const Cliente2 = class {
    constructor (nombre, saldo) {
        this.nombre = nombre;
        this.saldo = saldo;
    }

    mostrarInfo2() {
        return `Cliente2 ${this.nombre}, tu saldo es de ${this.saldo}`;
    };
}

const juan2 = new Cliente2('Juan2', 400);
console.log(juan2.mostrarInfo2());
console.log(juan2);
