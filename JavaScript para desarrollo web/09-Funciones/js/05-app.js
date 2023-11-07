//PARAMETROS Y ARGUMENTOS EN FUNCIONES

function sumar (n1, n2){ // n1, n2 son parametros
    return n1+n2;
}

console.log(sumar(2, 2)); // 2, 2 son argumentos
console.log(sumar(20, 12));
console.log(sumar(16, 21));

function saludar(nombre, apellido){
    console.log(`Hola ${nombre} ${apellido}`); // estructura string dinamica
}

saludar('Daniel', 'Rojas');