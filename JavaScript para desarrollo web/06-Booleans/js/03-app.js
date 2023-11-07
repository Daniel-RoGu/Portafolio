//BUENAS PRACTICAS EVALUANDO BOOLEANOS

const autentificacion = false;

if (autentificacion === true) {
    console.log("Puede ingresar");
}else{
    console.log("No puede ingresar");
}

const autentificacion1 = true;

//Operador ternario
console.log(autentificacion1 ? 'Puede ingresar' : 'No puede ingresar'); // funciona como el condicional anterior
/* la condicion parte de la variable evaluada "autentificacion1", seguidamente inicia la condicion con el operador "?"
   considerando que si la variable es "true" se ejecute la primera accion, de no serlo, el operador ":" representa el else
   condicional ejecutandoce en efecto la accion que le precede*/