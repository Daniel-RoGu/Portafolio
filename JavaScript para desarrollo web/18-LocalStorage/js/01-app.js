//agregando elementos al localStorage
localStorage.setItem('nombre', 'Daniel'); //requiere una llave y un valor // solo almacena string

//agregando elementos al sessionStorage
sessionStorage.setItem('nombre', 'DanielRG'); //requiere una llave y un valor

const producto = {
    nombre: "Monitor 24 pulgadas",
    precio: 300
};

const productoString = JSON.stringify( producto ); //encapsula un objeto en una variable de tipo JSON, convirtiendo su contenido a string
console.log(productoString);
console.log(typeof productoString);
localStorage.setItem('producto', productoString); //almacenando un objeto JSON en el localStorage

//agregando un arreglo al localStorage
const meses = ['Enero', 'Febrero', 'Marzo'];
const mesesString = JSON.stringify( meses );
localStorage.setItem('meses', mesesString);
// localStorage.setItem('meses', JSON.stringify( meses )); // sin usar variable intermediaria