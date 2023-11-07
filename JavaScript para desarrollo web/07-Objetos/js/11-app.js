//Funciones en objeto y acceso a sus variables

const producto = {
    //Llave : valor de la llave
      nombre: "Monitor de 20 pulgadas",
      precio: 300,
      disponibilidad: true,
      mostrarInfo: function() {
            console.log(`El producto: ${this.nombre} tiene un precio de: ${this.precio}`);
            /*muestra los atributos de este objeto, para haceder a ellos directamente se debe usar la 
              palabra recervada (this)*/
      }
};

const producto2 = {
    //Llave : valor de la llave
      nombre: "Tablet",
      precio: 400,
      disponibilidad: true,
      mostrarInfo: function() {
            console.log(`El producto: ${this.nombre} tiene un precio de: ${this.precio}`);
            /*muestra los atributos de este objeto, para haceder a ellos directamente se debe usar la 
              palabra recervada (this)*/
      }
};

producto.mostrarInfo();
producto2.mostrarInfo();