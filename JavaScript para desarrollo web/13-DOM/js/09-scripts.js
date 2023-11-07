//ELLIMINAR ELEMENTOS DEL DOM

/*
    const primerEnlace = document.querySelector('a');
    //console.log(primerEnlace);
    primerEnlace.remove();
*/

// eliminar desde el padre
const navegacion = document.querySelector('.navegacion');
console.log(navegacion.children);
navegacion.removeChild(navegacion.children[2]);