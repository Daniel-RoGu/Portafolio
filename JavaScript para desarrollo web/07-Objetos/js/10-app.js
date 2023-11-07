//COPIAR OBJETOS

const producto = {
    //Llave : valor de la llave
      nombre: "Monitor de 20 pulgadas",
      precio: 300,
      disponibilidad: true
};

const medidas = {
    peso: "28kg",
    dimencion: "40x20cm"
}

console.log(producto);
console.log(medidas);

//Formas de unir objetos
const resultado = Object.assign(producto, medidas);//metodo que permite unir dos objetos en uno nuevo
console.log(resultado);

//Spread Operator o Rest Operator
const resultado2 = { ...producto, ...medidas}; // los (...) indican que se debe copiar el contenido del objeto en el nuevo objeto
console.log(resultado2);
