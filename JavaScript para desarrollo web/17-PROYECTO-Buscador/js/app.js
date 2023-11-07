//VARIABLES
const marca = document.querySelector('#marca');
const year = document.querySelector('#year');
const precioMinimo = document.querySelector('#minimo');
const precioMaximo = document.querySelector('#maximo');
const puertas = document.querySelector('#puertas');
const transmision = document.querySelector('#transmision');
const color = document.querySelector('#color');

//contenedor para los resultados
const resultado = document.querySelector('#resultado');

//rango maximo y minimo de años para valorar en el filtro por año
const maxy = new Date().getFullYear();
const miny = maxy - 10;

//generar un objeto con la busqueda
const datosBusqueda = {
    marca: '',
    year: '',
    minimo: '',
    maximo: '',
    puertas: '',
    transmision: '',
    color: ''
} 

//EVENTOS

document.addEventListener('DOMContentLoaded', () => {
    //muestra los autos disponibles al cargar
    mostrarAutos(autos);

    //llena los años en la opcion de filtrado por año
    llenarSelectYear();
})

//evento listener para los select de busqueda
marca.addEventListener('change', evento => {
    datosBusqueda.marca = evento.target.value;
    filtrarAuto();
});

year.addEventListener('change', evento => {
    datosBusqueda.year = parseInt(evento.target.value);
    filtrarAuto();
});

precioMinimo.addEventListener('change', evento => {
    datosBusqueda.minimo = evento.target.value;
    filtrarAuto();
});

precioMaximo.addEventListener('change', evento => {
    datosBusqueda.maximo = evento.target.value;
    filtrarAuto();
});

puertas.addEventListener('change', evento => {
    datosBusqueda.puertas = parseInt(evento.target.value);
    filtrarAuto();
});

transmision.addEventListener('change', evento => {
    datosBusqueda.transmision = evento.target.value;
    filtrarAuto();
});

color.addEventListener('change', evento => {
    datosBusqueda.color = evento.target.value;
    filtrarAuto();
});


//FUNCIONES

//muestra los autos de la base de datos en el html
function mostrarAutos(autos) {

    LimpiarHtml(); //elimina el contenido de autos previo en el html

    autos.forEach(auto => {

        const {marca, modelo, year, puertas, transmision, precio, color} = auto;
        const autoHTML = document.createElement('p'); 

        autoHTML.textContent = `
            ${marca} ${modelo} - ${year} - ${puertas} Puertas - Transmision: ${transmision} - Precio: ${precio} - Color: ${color}
        `;

        //insertar resultado en el HTML
        resultado.appendChild(autoHTML);
    });    
}

//limpia los autos mostrados desde la base de datos en el html
function LimpiarHtml(params) {
    while (resultado.firstChild) {
        resultado.removeChild(resultado.firstChild);
    }
}

//genera los años para el selector del filtro por años
function llenarSelectYear(params) {
    
    //muestra desde el año actual hasta el año minimo definido para mostrar
    for (let index = maxy; index > miny; index--) {
        const opcion = document.createElement('option');
        opcion.value = index;
        opcion.textContent = index;
        year.appendChild(opcion); //agrega las opciones de año en el select del filtro por año
    }

}

//filtra carros segun la busqueda elaborada por el usuario
function filtrarAuto(params) {
                        //el metodo .filter permite la implementacion del metodo de encadenamiento 
    const resultado = autos.filter( filtrarMarca ).filter( filtrarYear ).filter( filtrarMin ).filter( filtrarMax ).filter( filtrarPuertas ).filter( filtrarTransmision ).filter( filtrarColor );  // .filter( funcion ) debe poseer una funcion o llamar una

    if (resultado.length) {
        mostrarAutos(resultado);
    } else {
        noResultado();
    }
    
}

function noResultado() {

    LimpiarHtml();

    const noResultado = document.createElement('div');
    noResultado.classList.add('alerta', 'error');
    noResultado.textContent = 'No hay resultados, intenta con otros terminos de busqueda';
    resultado.appendChild(noResultado);
}

function filtrarMarca (auto) {
    const { marca } = datosBusqueda;
    if ( marca ) {
        return auto.marca === marca;
    }
    return auto; //para no perder otros filtros, caundo no hay referencia a marca
}

function filtrarYear(auto) {
    const { year } = datosBusqueda;
    if ( year ) {
        return auto.year === year;
    }
    return auto; //para no perder otros filtros, caundo no hay referencia al año
}

function filtrarMin(auto) {
    const { minimo } = datosBusqueda;
    if ( minimo ) {
        return auto.precio >= minimo;
    }
    return auto; //para no perder otros filtros, caundo no hay referencia a un tope minimo
}

function filtrarMax(auto) {
    const { maximo } = datosBusqueda;
    if ( maximo ) {
        return auto.precio <= maximo;
    }
    return auto; //para no perder otros filtros, caundo no hay referencia a un tope maximo
}

function filtrarPuertas(auto) {
    const { puertas } = datosBusqueda;
    if ( puertas ) {
        return auto.puertas === puertas;
    }
    return auto; //para no perder otros filtros, caundo no hay referencia al numero de puertas
}

function filtrarTransmision(auto) {
    const { transmision } = datosBusqueda;
    if ( transmision ) {
        return auto.transmision === transmision;
    }
    return auto; //para no perder otros filtros, caundo no hay referencia al tipo de transmision 
}

function filtrarColor(auto) {
    const { color } = datosBusqueda;
    if ( color ) {
        return auto.color === color;
    }
    return auto; //para no perder otros filtros, caundo no hay referencia al tipo de color
}
