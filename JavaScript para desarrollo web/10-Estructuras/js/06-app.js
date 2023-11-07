// OPERADOR &&

const usuario = true;
const puedePagar = true;

if(usuario && puedePagar){
    console.log('Puedes comprar...');
} else {
    console.log('No puedes comprar...')
}

if(usuario){ // valida si es verdadero
    console.log('Es usuario');
}
if(!usuario){ // valida que no sea el valor comparado
    console.log('No es usuario');
}