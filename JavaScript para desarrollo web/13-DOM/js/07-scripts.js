//MODIFICANDO CSS DE UN HTML DESDE JS

/*
    const encabezado = document.querySelector('h1');
    console.log(encabezado.style); // permite ver las funciones para la ediccion del css

    encabezado.style.backgroundColor = 'red';
    encabezado.style.fontFamily = 'Arial';
    encabezado.style.textTransform = 'uppercase'; //para texto en mayuscula
*/

const card = document.querySelector('.card');
card.classList.add('nueva-clase', 'segunda-clase'); //permite agregar nuevas propiedades de clase a la etiqueta
card.classList.remove('segunda-clase'); //permite eliminar propiedades de clase a la etiqueta
console.log(card.classList);