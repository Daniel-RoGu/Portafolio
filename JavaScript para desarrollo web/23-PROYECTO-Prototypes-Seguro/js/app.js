
//CONSTRUCTORES

function Seguro(marca, year, tipo) {
    this.marca = marca;
    this.year = year;
    this.tipo = tipo;
};

// UI acronimo de interfaz de usuario 
function UI() {} //constructor sin parametros

//FUNCIONES DE PROTOTYPE

// realizacion de la cotizacion con los datos
Seguro.prototype.cotizarSeguro = function (params) { //Se debe usar la estructura normal de la funcion ya que se acceden a los datos del objeto
    /*
        1 = Americano valor de incremento del 1.15
        2 = Asiatico valor de incremento del 1.05
        1 = Europeo valor de incremento del 1.35
    */

    let cantidad;
    const base = 2000;

   switch (this.marca) {
        case '1':
            cantidad = base * 1.15;
            break;
        case '2':
            cantidad = base * 1.05;
            break;
        case '3':
            cantidad = base * 1.35;
            break;
        default:
            break;
    }

    // Descuento por año // por cada año de antiguedad se descuenta 3% a la cantidad
    const diferencia = new Date().getFullYear() - this.year;
    cantidad -= ((diferencia * 0.03) * cantidad);
    
    /*
        Si el seguro es basico tiene un incremento del 30%
        Si el seguro es completo tiene un incremento del 50%
    */
    if (this.tipo === 'basico') {
        cantidad += cantidad*0.3;
    }else {
        cantidad += cantidad*0.5;
    }

    return cantidad;
}

// elaboracion de opcion de años en la interfaz
UI.prototype.llenarYears = () => { //Se puede usar arrout funtion porque no se acceden a datos del objeto 
    const max = new Date().getFullYear(), // año maximo 
          min = max - 20;                 // año minimo  

    const selectYear = document.querySelector('#year');
    // gestion de years en elementos del DOM
    for (let i = max; i > min; i--) {
        let option = document.createElement('option');
        option.value = i;
        option.textContent = i;
        selectYear.appendChild(option);
    }
}

// muestra alertas en pantalla
UI.prototype.mostrarMensaje = (mensaje, tipo) => {
    const div = document.createElement('div');

    if (tipo === 'error') {
        div.classList.add('error'); // la clase "error" esta definida dentro de los estilos CSS
    }else {
        div.classList.add('correcto'); // la clase "correcto" esta definida dentro de los estilos CSS
    }
    
    div.classList.add('mensaje', 'mt-10');
    div.textContent = mensaje;

    // para insertar div en el formulario
    const formulario = document.querySelector('#cotizar-seguro');
    formulario.insertBefore(div, document.querySelector('#resultado')); // primero el nuevo nodo en el HTML, seguido el nodo o etiqueta de referencia para la insercion
    
    // para eliminar el div junto a su contenido despues de 3 segundos
    setTimeout(() => {
        div.remove();
    }, 3000);
};

UI.prototype.mostrarResultado = (seguro, total) => {

    const {marca, year, tipo} = seguro;

    let textoMarca;
    switch (marca) {
        case '1':
            textoMarca = 'Americano';
            break;
        case '2':
            textoMarca = 'Asiatico';
            break;
        case '3':
            textoMarca = 'Europeo';
            break;
        default:
            break;
    };

    //crear el resultado para el html
    const div = document.createElement('div');
    div.classList.add('mt-10');

    //se usa innerHTML cuando el div ya tiene contenido, si no se usa textContent
    div.innerHTML = `
        <p class="header">Tu resumen</p>
        <p class="font-bold"> Marca: <span class="font-normal"> ${textoMarca} </span> </p>
        <p class="font-bold"> Año: <span class="font-normal"> ${year} </span> </p>
        <p class="font-bold"> Tipo: <span class="font-normal capitalize"> ${tipo} </span> </p>
        <p class="font-bold"> Total: <span class="font-normal"> $ ${total} </span> </p>
    `;

    //para insertar en el html
    const resultadoDiv = document.querySelector('#resultado');

    //para mostrar el spinner
    const spinner = document.querySelector('#cargando');
    spinner.style.display = 'block';

    //para mostrar el spinner durante 3sg
    setTimeout(() => {
        spinner.style.display = 'none';
        resultadoDiv.appendChild(div); // una vez se elimina el spinner se muestra el resultado
    }, 3000);
}

//INSTANCIAS GlOBALES

const ui = new UI(); //intancia interfaz de usuario

//EVENTOS

document.addEventListener('DOMContentLoaded', () => {
    ui.llenarYears(); // llena el select con los años
});

//habilita el boton de cotizar
eventListeners();
function eventListeners () {
    const formulario = document.querySelector('#cotizar-seguro');
    formulario.addEventListener('submit', cotizarSeguro);
};

function cotizarSeguro(evento) {
    evento.preventDefault();

    //leer marca seleccionada
    const marca = document.querySelector('#marca').value;

    //leer year seleccionado
    const year = document.querySelector('#year').value;
    
    //leer tipo de cobertura (datos) seleccionada
    const tipo = document.querySelector('input[name="tipo"]:checked').value; //selecciona el input con el name = "tipo" y que este seleccionado
    
    if (marca === '' || year === '' || tipo === '') {
        ui.mostrarMensaje('Todos los campos son obligatorios..', 'error');
        return;
    }

    ui.mostrarMensaje('Cotizando..', 'correcto');

    //para ocultar las cotizaciones previas
    const resultados = document.querySelector('#resultado div');
    if (resultados != null) {
        resultados.remove();
    };

    //instancia objeto para generar el seguro
    const seguro = new Seguro(marca, year, tipo);
    const total = seguro.cotizarSeguro();

    // conecta el valor del seguro cotizado en el prototype de la interfaz de usuario (UI)
    ui.mostrarResultado(seguro, total);
};
