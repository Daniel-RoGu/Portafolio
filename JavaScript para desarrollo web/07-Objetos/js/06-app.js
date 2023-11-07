// DESTRUCTURING EN OBJETOS ANIDADOS

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

//Estructuras de consulta en objetos anidados

    /*const { nombre, precio, disponibilidad, informacion } = producto;
    console.log(producto);*/

    /*const { nombre, precio, disponibilidad, informacion: {descripcion, fabricacion} } = producto;
    console.log(producto);*/

    /*const { nombre, precio, disponibilidad, informacion: {descripcion: {peso, dimencion}, fabricacion: {pais}} } = producto;
    console.log(producto);*/
                                                        //la estructura de consulta prioriza los atributos por sobre el objeto                          
    const { nombre, precio, disponibilidad, informacion, informacion: {descripcion, descripcion: {peso, dimencion}, 
                                                                       fabricacion, fabricacion: {pais}} } = producto;
    //se escriben dos veces los objetos anidados dado que de no hacerse no se priorizan y no pueden ser consultadas de manera independiente
    console.log(producto);
    console.log(informacion);
    console.log(descripcion);
    console.log(fabricacion);
