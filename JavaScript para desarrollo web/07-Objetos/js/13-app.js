//Object .keys, .values y .entries

const producto = {
    //Llave : valor de la llave
      nombre: "Monitor de 20 pulgadas",
      precio: 300,
      disponibilidad: true,
      /*mostrarInfo: function() {
            console.log(`El producto: ${this.nombre} tiene un precio de: ${this.precio}`);
      }*/
};

console.log(Object.keys(producto)); //retorna un areglo con los atributos del objeto
console.log(Object.values(producto)); //retorna un areglo con el valor de los atributos del objeto
console.log(Object.entries(producto)); //retorna todo el objeto con sus caracteristicas