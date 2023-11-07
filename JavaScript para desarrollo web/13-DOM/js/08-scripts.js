//TRAVERSING THE DOM


    const navegacion = document.querySelector('.navegacion');
/*
    console.log(navegacion);
    console.log(navegacion.childNodes); // childNodes considera los espacios entre etiquetas de navegacion //alternativa no limpia
    console.log(navegacion.children); // lista las etiquetas de navegacion de forma limpia   
    
    console.log(navegacion.children);
    console.log(navegacion.children[0]);
*/

    const card = document.querySelector('.card');
/*
    console.log(card.children);
    console.log(card.children[1]);
    console.log(card.children[1].children);
    console.log(card.children[1].children[1]);
    console.log(card.children[1].children[1].textContent);

    card.children[1].children[1].textContent = 'Nuevo heading desde traversing the dom';
    console.log(card.children[1].children[1].textContent);

    console.log(card.children[0]);
    card.children[0].src = 'img/hacer2.jpg';
    console.log(card.children[0]);
*/

/*
// traversing de hijo al padre 
console.log(card.parentNode); //forma no limpia
console.log(card.parentElement);
console.log(card.parentElement.parentElement); // muestra el nodo padre del nodo padre anterior
// se se agrega mas .parentElement muestra el padre anterior y asi hasta hallar el body del html

// .children // recorre los nodos hijos
// .parentElement // recorreo los nodos padres

console.log(card.nextElementSibling); // permite navegar entre nodos hermanos (del mismo tipo y nodo padre)
console.log(card.nextElementSibling.nextElementSibling); // permite navegar entre nodos hermanos (del mismo tipo y nodo padre)
// al agregarse mas .nextElementSibling salta al siguiente nodo hermano hasta que no haya mas nodos hermanos

// -para navegar entre nodos hermanos sin tener que hacer saltos
const ultimoCard = document.querySelector('.card:nth-child(4)')
console.log(ultimoCard);
console.log(ultimoCard.previousElementSibling); // permite acceder al nodo anterior
*/

console.log(navegacion.firstElementChild); // accede al primer elemento
console.log(navegacion.lastElementChild); // accede al ultimo elemento
