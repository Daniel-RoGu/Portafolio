//POSICIONES EN UN ARREGLO

const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio'];

const carrito = [
    { nombre: 'Monitor 27 Pulgadas', precio: 500 },
    { nombre: 'Televisión', precio: 100 },
    { nombre: 'Tablet', precio: 200 },
    { nombre: 'Audifonos', precio: 300 },
    { nombre: 'Teclado', precio: 400 },
    { nombre: 'Celular', precio: 700 },
]
//(mes) retorna el valor del indice, (indice) retorna la posicion del indice en el arreglo 
meses.forEach((mes, indice) => {
    console.log(`${indice}: ${mes}`);
})

// encontrando una posicion
meses.forEach((mes, indice) => {
    if (mes === 'Abril') {
        console.log(`${mes} encontrado en el indice ${indice}`);
    }
})

// encontrar un indice con findIndex - resultado similar al metodo de la linea 19
// en caso de no encontrarse resultado este retorna un -1
const indice = meses.findIndex( mes => mes === 'Abril');
console.log(indice);

// encontrar indice de un arreglo de objetos
const indice2 = carrito.findIndex( producto => producto.nombre === 'Teclado' );
console.log(indice2);