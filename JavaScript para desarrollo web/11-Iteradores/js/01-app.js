//ITERADORES INTRODUCCION

for (let i = 1; i <= 20; i++) {
    console.log(i % 2 === 0 ? `${i} es par...` : `${i} es inpar`);
}

const carrito = [
    {nombre: 'Moninor 20"', precio: 280},
    {nombre: 'Moninor 28"', precio: 300},
    {nombre: 'Moninor 42"', precio: 380},
    {nombre: 'Moninor 50"', precio: 420},
    {nombre: 'Moninor 52"', precio: 428},
    {nombre: 'Moninor 70"', precio: 620},
]

for (let i = 0; i < carrito.length; i++) {
    console.log(carrito[i]);
}