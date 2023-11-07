// BUENAS PRACTICAS 

const autenticado = true;

// funciona pero es una mala practica comparar boleanos de esta manera
if (autenticado === true) {
    console.log('El usuario esta autenticado');
}

//forma adecuada
if (autenticado) {
    console.log('El usuario esta autenticado correctamente');
}

const puntaje = 500;

// considerar las prioridades de ejecucion, en el if la primera condicion valida que se ejecute terminara el proceso
if (puntaje > 300) {
    console.log('Buen puntaje'); // en este caso siempre se ejecutara esta linea
} else if(puntaje > 400){
    console.log('Excelente puntaje'); // viendose que esta linea es mucho mejor 
}
//deberia ser algo como:
if(puntaje > 400){
    console.log('Excelente puntaje'); 
} else if (puntaje > 300) {
    console.log('Buen puntaje'); 
}

// en funciones lo adecuado seria:

function revisarPuntaje(){
    if(puntaje > 400){
        console.log('Excelente puntaje'); 
        return; // con el return solo se va ejecutar la primer condicion a la que se ingrese
    } 
    if (puntaje > 300) {
        console.log('Buen puntaje');
        return; 
    }
}

revisarPuntaje();