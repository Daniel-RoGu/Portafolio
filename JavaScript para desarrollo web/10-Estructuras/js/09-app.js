//OPERADOR TERNARIO

const autenticado = true;
const puedePagar = true;

            // equivalente a un if            // equivalente a un else
console.log(autenticado ? 'Si esta autenticado' : 'No esta autenticado' );
console.log(autenticado && puedePagar ? 'Puede comprar' : 'Fondos insuficientes' );
console.log(autenticado || puedePagar ? 'Puede comprar' : 'Fondos insuficientes' );

// TERNARIO CON IF ANIDADO
        //if principal   //if anidado                                 //else anidado              
console.log(autenticado ? puedePagar? 'Esta autenticado y puede pagar' : 'Esta autenticado pero no tiene fondos suficientes' : 'No esta autenticado'); 
//else principal