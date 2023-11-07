//alert("!Hola mundo¡");
const nombre = prompt('¿Cual es tu nombre?') // emergente que permite generar una especie de alert, pero desde el cual se solicitan datos
//document.querySelector  - permite seleccionar elementos (clases, id, etc) del html
document.querySelector('.contenido').innerHTML = `${nombre} a hechar codigo se dijo`;
/* Lineas que permiten observar cuanto tiempo demora un codigo en ser ejecutado
console.time(`Tiempo`)
    algo de codigo para evaluar
console.timeEnd(`Tiempo_finalizado`)
*/