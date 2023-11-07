//recuperando datos del localStorage
const nombre = localStorage.getItem('nombre');// recupera el valor de la llave con el nombre asignado en el parametro ('nombre')
console.log(nombre); // si el elemento buscado no existe se retorna un null

//recuperando el objeto
const productoJson = localStorage.getItem('producto');
console.log(productoJson);
console.log(JSON.parse( productoJson )); //convierte el elemento en parametros a su estructura especifica, si el string en el localStorage posee estructura de objeto, este sera convertido a un objeto

//recuperando el arreglo
const mesesJson = localStorage.getItem('meses');
console.log(mesesJson);
const mesesArray = JSON.parse( mesesJson );
console.log(mesesArray);
