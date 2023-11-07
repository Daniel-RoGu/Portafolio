// Agregar o eliminar propiedades de un objeto

//estructura de objeto denominada object literal
const producto = {
    //Llave : valor de la llave
      nombre: "Monitor de 20 pulgadas",
      precio: 300,
      disponibilidad: true
};

// para agregar nuevas propiedades (atributos) al objeto
producto.imagen = "imagen.jpg";// se esta asignando un nuevo tipo de atributo al objeto, por tanto este debe inicializarse

// para eliminar propiedades (atributos) del objeto
delete producto.disponibilidad;

console.log(producto);