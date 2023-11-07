//COMUNICACION ENTRE FUNCIONES

iniciarApp();

function iniciarApp(){
    console.log('Iniciando App...');
    segundaFuncion();
}

function segundaFuncion(){
    console.log('Desde la segunda funcion...');
    autenticarUsuario();
}

function autenticarUsuario(){
    console.log('Autenticando usuario.... espere...');
    console.log('Usuario autentificado exitosamente');
}