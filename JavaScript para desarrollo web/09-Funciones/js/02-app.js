//DIFERENCIA ENTRE FUNTION DECLARATION Y EXPRESSION

// Declaracion de funcion ( Function declaration)
function sumar (n1, n2){
    return n1+n2;
}

console.log(sumar(2, 2));

// Expresion de funcion ( Function expression )
const sumar2 = function (n1, n2) { // este tipo de estructura es mas segura de usar, dado que solo se puede llamar si ya se a inicializado
    return n1+n2;
}

console.log(sumar2(2, 2));