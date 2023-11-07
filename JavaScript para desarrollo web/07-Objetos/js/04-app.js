//DESTRUCTURING DE OBJETOS

//estructura de objeto denominada object literal
    const producto = {
        //Llave : valor de la llave
        nombre: "Monitor de 20 pulgadas",
        precio: 300,
        disponibilidad: true
    };

//Formas de abstraer informacion del objeto
    /*
        //forma antigua de hacerlo
        const nombre = producto.nombre;
        console.log(nombre);
    */

    //forma moderna
    /*
        const { nombre } = producto;
        const { precio } = producto;
        const { disponibilidad } = producto;
    */
    const { nombre, precio, disponibilidad } = producto; //forma simplificada de las lineas 20 a 22
    console.log(nombre);
    console.log(precio);
    console.log(disponibilidad);