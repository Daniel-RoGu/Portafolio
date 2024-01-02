//Class declaration - atributos privados
class Cliente { 

    #nombre; // forma de establecer un atributo como privado (#)

    /*
    #saldo; // se deben declarar de esta forma todos los atributos que se quieren dejar privados

    constructor (nombre, saldo) {
        this.#nombre = nombre;
        this.#saldo = saldo;
    };

    mostrarInfo() {
        return `Cliente ${this.#nombre}, tu saldo es de ${this.#saldo}`;
    };

    //metodos static son exclusivos de las clases, no se pueden llamar desde instancias
    static bienvenida () { //no requieren una instancia para ser llamada
        return 'Bienvenid@....';
    };

    */

    //Set y Get
    setNombre(nombre){
        this.#nombre = nombre;
    };

    getNombre(){
        return this.#nombre;
    };

};

//const cliente = new Cliente ('JJ', 500);
const cliente = new Cliente ();
//console.log(cliente.mostrarInfo());
//console.log(cliente.#nombre); // vota un error, no se puede acceder directamente a atributos privados desde instancias de clase 
cliente.setNombre('JJ');
console.log(cliente.getNombre());