//BREAKE Y CONTINUE

/*
for (let i = 1; i <= 20; i++) {
    //console.log(i % 2 === 0 ? `${i} es par...` : `${i} es inpar`);
    if (i === 7) {
        break; // termina el proceso
    }    
    console.log(`Numero:${i}`);
}

for (let i = 1; i <= 20; i++) {
    //console.log(i % 2 === 0 ? `${i} es par...` : `${i} es inpar`);
    if (i === 7) {
        console.log('Siste');
        continue; // da por terminado el rrecorido asignado del siclo, dando continuidad al siguiente recorrido
    }    
    console.log(`Numero:${i}`);
}
*/

const carrito = [
    {nombre: 'Moninor 20"', precio: 280},
    {nombre: 'Moninor 28"', precio: 300, descuento: true},
    {nombre: 'Moninor 42"', precio: 380},
    {nombre: 'Moninor 50"', precio: 420},
    {nombre: 'Moninor 52"', precio: 428, descuento: true},
    {nombre: 'Moninor 70"', precio: 620},
]

for (let i = 0; i < carrito.length; i++) {
    if (carrito[i].descuento) {
        console.log(`El producto: ${carrito[i].nombre} tiene descuento`);
        continue;
    }
    console.log(carrito[i]);
}
