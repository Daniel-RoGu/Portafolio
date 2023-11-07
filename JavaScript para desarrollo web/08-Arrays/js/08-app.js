//DESTRUCTURING DE ARRAYS

//estructura de objeto denominada object literal
const producto = {
    //Llave : valor de la llave
    nombre: "Monitor de 20 pulgadas",
    precio: 300,
    disponibilidad: true
};

// destructuring de objeto
const { nombre, precio, disponibilidad } = producto; 

// destructuring con arreglos
const numeros = [10,20,30,40,50];

const [ uno, dos, tres ] = numeros; // cada variable creada dentro de los [] se le asigna su correspondiente valor de posicion en el arreglo
console.log(tres); // retorna el tercer valor de la posicion del arreglo numeros

const [ , , , cuatro ] = numeros; // para acceder a un valor especifico se deben recorrer los espacios hasta la posicion deseada en el arreglo dejando vacios los que no se requieran
console.log(cuatro); // retorna el cuarto valor de la posicion del arreglo numeros

const [ , , , ...demas ] = numeros; // para retornar un grupo de valores se deben recorrer los espacios hasta la posicion deseada en el arreglo dejando vacios los que no se requieran
console.log(demas); // retorna los valor despues de la tercer posicion del arreglo numeros