// QUERY SELECTOR ALL

// retorna todos los elementos de clase llamados card
const card = document.querySelectorAll('.card'); // el punto (.card) indica que es una clase
console.log(card);

// seleccionar etiquetas html
const navegacion = document.querySelectorAll('nav');
console.log(navegacion);

// si no existe  // retorna un NodeList vacio
const noExiste = document.querySelectorAll('no-existe');
console.log(noExiste);