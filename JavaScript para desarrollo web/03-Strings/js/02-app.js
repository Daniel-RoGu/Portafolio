// ALGUNOS METODOS STRING UTILES

const televisor = 'Monitor de 20 pulgadas';

console.log(televisor);
// para saber la dimension del string
console.log(televisor.length); 

// permite saber si la palabra parametrizada se encuentra entre la cadena del string y en que posicion esta
console.log(televisor.indexOf('pulgadas')); // si la busqueda es igual a -1 significa que no se encontro nada

// permite saber si la palabra parametrizada se encuentra entre la cadena del string
console.log(televisor.includes('Monitor')); // retorna un booleano, true si se encontro, false si no