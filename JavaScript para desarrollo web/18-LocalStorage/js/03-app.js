//eliminar o actulaizar elementos del localStorage

//para eliminar
localStorage.removeItem('nombre'); //se pasa el nombre de la llave que se desea eliminar

//para actualizar
const mesesArray = JSON.parse( localStorage.getItem('meses') );
console.log(mesesArray);
mesesArray.push('Abril');
console.log(mesesArray);
localStorage.setItem('meses', mesesArray); //se sobre escribe el valor en el localStorage

//para vaciar el localStorage
//localStorage.clear();