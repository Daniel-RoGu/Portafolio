// Evitar la propagación (EVENT BUBBLING) con contenido creado...
const parrafo1 = document.createElement('P');
parrafo1.textContent = 'Concierto';
parrafo1.classList.add('categoria');
parrafo1.classList.add('concierto');

// Segundo parrafo
const parrafo2 = document.createElement('P');
parrafo2.textContent = 'Concierto de Rock';
parrafo2.classList.add('titulo');

// 3er parrafo...
const parrafo3 = document.createElement('p');
parrafo3.textContent = '$800 por persona';
parrafo3.classList.add('precio');
// parrafo3.onclick = nuevaFuncion; // agregando contenido a un evento desde un elemento html // aociado sin parametros
parrafo3.onclick = function() { // agregando contenido a un evento desde un elemento html // asociado con parametros
    nuevaFuncion(1);
}; // la estructura superior como la inferior son las mismas, cambia la sintaxis de definicion de funcion
parrafo3.onclick = () => { // agregando contenido a un evento desde un elemento html // asociado con parametros
    nuevaFuncion(1);
}; 

// crear el div...
const info = document.createElement('div');
info.classList.add('info');
info.appendChild(parrafo1)
info.appendChild(parrafo2)
info.appendChild(parrafo3);

// Vamos a crear la imagen
const imagen = document.createElement('img');
imagen.src = 'img/hacer2.jpg';

// Crear el Card..
const contenedorCard = document.createElement('div');
contenedorCard.classList.add('contenedorCard');

// Vamos a asignar la imagen al card...
contenedorCard.appendChild(imagen);

// y el info
contenedorCard.appendChild(info);

// Insertarlo en el HTML...
const contenedor = document.querySelector('.hacer .contenedor-cards');
contenedor.appendChild(contenedorCard); // al inicio info

function nuevaFuncion(id){
    console.log('Desde la nueva funcion con el ID: ',1);
};
