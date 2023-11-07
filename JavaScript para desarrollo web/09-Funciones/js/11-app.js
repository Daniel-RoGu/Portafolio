//PARAMETROS Y ARGUMENTOS EN UN ARROW FUNCTION

const aprendiendo = function(lenguaje, lenguaje2){
    console.log(`Aprendiendo ${lenguaje} y ${lenguaje2}`);
}

aprendiendo('JavaScript', 'Node.js');

const aprendiendo2 = () => { // el function es equivalente al =>, simplificando en efecto la sintaxis de las funciones en JS
    console.log('Aprendiendo JavaScript');
}

//const aprendiendo3 = () => console.log('Aprendiendo JavaScript'); // sin parametros

//const aprendiendo3 = (lenguaje) => `Aprendiendo ${lenguaje}`; // con parentisis
const aprendiendo3 = lenguaje => `Aprendiendo ${lenguaje}`; // cuando se pasa un solo parametro es opcional dejar los parentesis
console.log(aprendiendo3('JS'));

const aprendiendo4 = (lenguaje, lenguaje2) => `Aprendiendo ${lenguaje} y ${lenguaje2}`; // con parentisis y dos parametros
console.log(aprendiendo4('JS', 'Nd.js'));