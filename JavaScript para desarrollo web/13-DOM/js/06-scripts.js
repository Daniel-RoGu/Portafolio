//MODIFICANDO TEXTO O IMAGENES

const encabezado = document.querySelector('.contenido-hero h1');
console.log(encabezado);

console.log(encabezado.innerText); // muesta en consola el contenido textual de la variable encabezado // no encuentra textos ocultos
console.log(encabezado.textContent); // muesta en consola el contenido textual de la variable encabezado separando con un espaciado extra cada palabra
console.log(encabezado.innerHTML); // muesta en consola el contenido textual de la variable encabezado junto a su estructura html

const encabezado2 = document.querySelector('.contenido-hero h1').textContent;
console.log(encabezado2);

/*
    //Forma de remplazar fragmentos de texto en el html desde js
    const nuevoHeading = 'Nuevo Heading';
    document.querySelector('.contenido-hero h1').textContent = nuevoHeading;
*/

//Forma de cambiar imagenes html desde js
const imagen = document.querySelector('.card img');
imagen.src = 'img/hacer2.jpg';