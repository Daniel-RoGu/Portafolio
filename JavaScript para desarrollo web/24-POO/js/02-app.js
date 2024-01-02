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
        return 'Bienvenid@....';
    };
};

//HERENCIA
class Empresa extends Cliente {
    constructor (nombre, saldo, telefono, categoria) {
        super(nombre, saldo); //para acceder al constructor de la clase padre
        this.telefono = telefono;
        this.categoria = categoria;
    };

    static bienvenida () { //al tener el mismo nombre de un metodo de la clase padre, este se sobre escribe al ser utilizado desde la clase hijo
        return 'Bienvenid@ a la empresa....';
    };
}

//DECLARACIONES
const juan = new Cliente('Juan', 400);
console.log(juan);
console.log(juan.mostrarInfo());

const empresa = new Empresa('CJ', 500, 123654, 'Educacion');
console.log(empresa);
console.log(empresa.mostrarInfo());

console.log(Cliente.bienvenida());
console.log(Empresa.bienvenida());
