//OBJECT METOD SEAL

"use strict"; //habilita el modo estricto para el fichero, lo que obliga a usar buenas practicas de programacion

const producto = {
    //Llave : valor de la llave
      nombre: "Monitor de 20 pulgadas",
      precio: 300,
      disponibilidad: true
};

Object.seal(producto); //object metods que "semi-congela" el objeto asignado, evitando agregar nuevos atributos al objeto

producto.disponibilidad = false; /* es valido, la configuracion del objeto con "seal" permite modificar los atributos 
                                    existentes del objeto*/
producto.imagen = "imagen.jpg"; // no es valido, la configuracion del objeto no permite agregar nuevos atributos
delete producto.disponibilidad; // tampo se pueden eliminar atributos

console.log(Object.isSealed(producto)); //permite saber si un objeto esta sellado (seal)