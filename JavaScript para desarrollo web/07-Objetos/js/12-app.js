//OBJECT CONSTRUCTOR

//object literal
const producto = {
    //Llave : valor de la llave
      nombre: "Monitor de 20 pulgadas",
      precio: 300,
      disponibilidad: true,
      /*mostrarInfo: function() {
            console.log(`El producto: ${this.nombre} tiene un precio de: ${this.precio}`);
      }*/
};

//object constructor
function Producto(nombre, precio){
    this.nombre = nombre;
    this.precio = precio;
    this.disponibilidad = true;
}

const producto2 = new Producto("Tablet", 350);
console.log(producto2);