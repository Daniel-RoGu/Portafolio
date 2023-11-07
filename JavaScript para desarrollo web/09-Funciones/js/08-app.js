//FUNCIONES QUE RETORNAN E INTERCAMBIAN VALORES 

/*
    function sumar (n1, n2){
        return n1+n2;
    }

    const resultado = sumar(2, 3);
    console.log(resultado);
*/

// ejemplo mas avanzado
let total = 0;

function agregarCarrito(precio){
    return total += precio;
}

function calcularImpuesto(total){
    return total * 1.15;
}

total = agregarCarrito(100);
total = agregarCarrito(300);
total = agregarCarrito(600);

const totalPagar = calcularImpuesto(total);

console.log(`El total de la compra es de: ${total}`);
console.log(`El total a pagar con impuesto es de: ${totalPagar}`);
