//PROBLEMAS CON OBJETOS

const producto = {
    //Llave : valor de la llave
      nombre: "Monitor de 20 pulgadas",
      precio: 300,
      disponibilidad: true
};

/*A pesar de que el objeto esta definido como una constante (const) esta puede ser modificada dadas las caracteristicas
de los objetos que si lo permiten*/

producto.disponibilidad = false; //ejemplo de modificacion del objeto
console.log(producto);

//delete producto.disponibilidad; //otro ejemplo de modificacion de la estructura del objeto