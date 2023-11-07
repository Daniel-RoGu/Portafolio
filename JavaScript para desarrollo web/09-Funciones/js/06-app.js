//PARAMETROS POR DEFAULT

//sin usar parametros por default
function saludar(nombre, apellido){
    console.log(`Hola ${nombre} ${apellido}`); // estructura string dinamica
}

saludar('Daniel', 'Rojas');

//con parametros por default
function saludar2(nombre = 'Desconosido', apellido = ''){
    console.log(`Hola ${nombre} ${apellido}`); // estructura string dinamica
}

saludar2();