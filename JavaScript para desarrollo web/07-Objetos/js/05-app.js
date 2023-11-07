//OBJETO DENTRE DE UN OBJETO

//estructura de objeto denominada object literal
const producto = {
    //Llave : valor de la llave
    nombre: "Monitor de 20 pulgadas",
    precio: 300,
    disponibilidad: true,
    informacion : {
        descripcion: {
            peso: "18kg",
            dimencion: "40x26cm"
        },
        fabricacion: {
            pais: "China"
        }
    }
};

console.log(producto);
console.log(producto.informacion);

console.log(producto.informacion.descripcion);
console.log(producto.informacion.descripcion.peso);
console.log(producto.informacion.descripcion.dimencion);

console.log(producto.informacion.fabricacion);
console.log(producto.informacion.fabricacion.pais);