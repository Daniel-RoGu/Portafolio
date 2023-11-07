//EJERCICIO FIZZ BUZZ

// multiplos de 3 imprimir fizz
// multiplos de 5 imprimir buzz
// multiplos de 3 y 5 imprimir fizz buzz

for (let i = 1; i < 100; i++) {
    /*
        console.log(i % 3 === 0 ? `${i} es multiplo de 3` : '');    
        console.log(i % 5 === 0 ? `${i} es multiplo de 5` : '');    
        console.log(i % 3 === 0 && i % 5 === 0 ? `${i} es multiplo de 3 y de 5` : '');
    */
    if (i % 3 === 0 && i % 5 === 0) {
        //console.log(`${i} es multiplo de 3 y de 5`);
        console.log(`fizz buzz `);
    } else if (i % 3 === 0) {
        //console.log(`${i} es multiplo de 3`);
        console.log("fizz");
    } else if (i % 5 === 0) {
        console.log(`buzz`);
    }    
}