//FOR OF

const pendientes = ['tarea', 'comer', 'proyecto', 'estudiar'];

pendientes.forEach((pendiente, indice) => {  // estructura de foreach usado como metodo, que a su vez posee una estructura de funcion al ejecutarse
    console.log(`${indice}: ${pendiente}`);
})

//pendientes.forEach( pendiente => console.log(pendiente)); // se puede simplificar ya que genera un solo parametro y esta conformado por una sola linea

const carrito = [
    {nombre: 'Moninor 20"', precio: 280},
    {nombre: 'Moninor 28"', precio: 300},
    {nombre: 'Moninor 42"', precio: 380},
    {nombre: 'Moninor 50"', precio: 420},
    {nombre: 'Moninor 52"', precio: 428},
    {nombre: 'Moninor 70"', precio: 620},
];

for( let pendiente of pendientes){ // funciona igual que un alias en sql, al alias se le asignan los valores del arreglo
    console.log(pendiente);        // y en el for se recorre cada valor
}

for( let producto of carrito){
    console.log(producto);
    console.log(producto.nombre);
}