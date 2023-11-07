//GENERAR HTML CON JS

//Forma de crear un enlace nuevo
const enlace = document.createElement('a');

// forma de agregar texto
enlace.textContent = 'Nuevo enlace';
// forma de asignar una ruta
enlace.href = '/nuevo-enlace'
// forma de asignar atributos a la etiqueta
enlace.target = '_blank';
enlace.classList.add('alguna-clase');
// forma de agregar un evento
enlace.onclick = miFuncion;  

console.log(enlace);

//forma de añadir el nuevo enlace a una etiqueta de navegacion en el html
const navegacion = document.querySelector('.navegacion');
//navegacion.appendChild(enlace); // agrega un nuevo hijo a la etiqueta  //agrega el nuevo hijo en la ultima posicion

console.log(navegacion.children); // permite comprobar las posiciones de los hijos de la etiqueta como una estructura tipo arreglo
navegacion.insertBefore(enlace, navegacion.children[1]); // permite agregar el nuevo hijo a la etiqueta antes de la posicion de los hijos asignada (navegacion.children[1])

function miFuncion(){
    alert('Diste click');
}
//

//Forma de crear una card de forma dinamica 
const parrafo1 = document.createElement('P');
parrafo1.textContent = 'Concierto';
parrafo1.classList.add('categoria', 'concierto');

const parrafo2 = document.createElement('P');
parrafo2.textContent = 'Concierto de Imagine dragons';
parrafo2.classList.add('titulo');

const parrafo3 = document.createElement('P');
parrafo3.textContent = '800 por persona';
parrafo3.classList.add('precio');

// crear div con la clase info
const info = document.createElement('div');
info.classList.add('info');
info.appendChild(parrafo1);
info.appendChild(parrafo2);
info.appendChild(parrafo3);

console.log(info);

// crear la imagen
const imagen = document.createElement('img');
imagen.src = 'img/hacer2.jpg';
imagen.classList.add('img-fluid');
imagen.alt = 'Texto alternativo';

console.log(imagen);

// crear el card
const card = document.createElement('div');
card.classList.add('card');

// asignar la imagen
card.appendChild(imagen);

// asignar info
card.appendChild(info);


console.log(card);

//Insertar en el HTML
const contenedor = document.querySelector('.hacer .contenedor-cards'); // etiqueta tipo section con las clases .hacer y .contenedor-cards
//contenedor.appendChild(card); // insertando en la unltima posicion
contenedor.insertBefore(card, contenedor.children[0]) // insertando en la posicion deseada 
//