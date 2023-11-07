//Variables

const formulario = document.querySelector('#formulario');
const listaTweets = document.querySelector('#lista-tweets');
let tweets = [];


//Event Listeners

eventListeners();

function eventListeners() {
    //cuando el usuario agrega un nuevo tweet
    formulario.addEventListener('submit', agregarTweet);

    //cuando el documento esta listo
    document.addEventListener('DOMContentLoaded', () => {
        tweets = JSON.parse( localStorage.getItem('tweets') ) || []; //retorna el arreglo de tweets almacenado en el localStorage si existe, si no "||" lo deja como un arreglo vacio
        console.log(tweets);

        creandoHTML();
    })
};


//Funciones

function agregarTweet(evento) {
    evento.preventDefault();

    // valor del textArea donde el usuario escribe
    const tweet = document.querySelector('#tweet').value;
    
    //validacion
    if (tweet === '') {
        mostrarError('El tweet no puede enviarse vacio');
        return; //evita que se ejecute mas lineas
    } 
    
    const tweetObj = {
        id: Date.now(),
        //tweet: tweet //funciona
        tweet // es igual a tweet: tweet, ya que se refiere a un elemento que encapsula a uno existente y que poseen el mismo nombre
    };

    //para añadir al arreglo de tweets
    tweets = [...tweets, tweetObj]; //uso del spread operator para hacer una copia de los datos del arreglo y agregar uno nuevo, sobre escribe el arreglo
    
    //una vez agregados los tweets al arreglo se crea el html
    creandoHTML();

    //para reiniciar el formulario
    formulario.reset();
}

//para mostrar mensajes de error
function mostrarError(error) {
    const mensjaError = document.createElement('p');
    mensjaError.textContent = error;
    mensjaError.classList.add('error'); //agrega el estilo css asignado para la clase error

    //insertando error en el contenido html
    const contenido = document.querySelector('#contenido'); //div principal en el html
    contenido.appendChild(mensjaError);

    //para hacer que el mensaje de error se elimine despues de 3 segundos en el html
    setTimeout(() => {
        mensjaError.remove();
    }, 3000);
}

//para mostrar los tweets registrados por el usuario y almacenados en el arreglo de tweets en el HTML
function creandoHTML(tweet) {

    limpiarHTML(); //para evitar que se repita la lista de tweets en la lista del html cuando se inserta un nuevo tweet

    //para impedir que se ejecute cuando se eliminan todos los tweets
    if (tweets.length > 0) {
        tweets.forEach( tweet => {
            //agregando el boton para eliminar tweets en el html
            const btnEliminar = document.createElement('a');
            btnEliminar.classList.add('borrar-tweet'); //clase definida en el css para el estilo del boton
            btnEliminar.innerText = 'X';
            //añadiendo funcion de eliminar al boton
            btnEliminar.onclick = () => {
                borrarTweet(tweet.id);
            }

            //crear el HTML
            const li = document.createElement('li');
            //añadir al texto
            li.innerText = tweet.tweet;
            //asignar el boton
            li.appendChild(btnEliminar);
            //insertando en el html
            listaTweets.appendChild(li);
        } );
    }

    sincronizarStorage();
}

//Agrega los tweets actuales (arreglo de tweets) al localStorage
function sincronizarStorage() {
    localStorage.setItem('tweets', JSON.stringify(tweets));
}

//Elimina un tweet
function borrarTweet(id) {
    tweets = tweets.filter( tweet  => tweet.id !== id); // sobreescribe el arreglo de tweets excluyendo aquel que posea el id del que se esta eliminando
    creandoHTML();
}

function limpiarHTML() {
    while (listaTweets.firstChild) {
        listaTweets.removeChild(listaTweets.firstChild);
    }
}
