//SELECCIONAR ELEMENTOS POR SU ID

// si hay mas de un elemento con el mismo id, el metodo solo va retornar el primero 
const formulario = document.getElementById('formulario');
console.log(formulario);

// si no existe         // cunado el elemento no existe retorna null
const noExiste = document.getElementById('no-existe');
console.log(noExiste);