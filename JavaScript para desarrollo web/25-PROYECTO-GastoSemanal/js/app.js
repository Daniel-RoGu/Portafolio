// Variables y selectores

const formulario = document.querySelector('#agregar-gasto');
const gastoListado = document.querySelector('#gastos ul');

let presupuesto;

// Eventos

eventListeners();
function eventListeners(){

    document.addEventListener('DOMContentLoaded', preguntarPresupuesto);

    formulario.addEventListener('submit', agregarGasto);
}


// Clases

class Presupuesto{
    constructor(presupuesto){
        this.presupuesto = Number(presupuesto);
        this.restante = Number(presupuesto);
        this.gastos = [];
    };

    nuevoGasto(gasto){
        this.gastos = [...this.gastos, gasto]; // ...this.gastos hace una copia de los elementos del areglo, para poder sobreescribir nuevos datos, sin perder los existentes        
        this.calcularRestante();
    };

    //metodo para obtener el acumulado de los gastos con el array method (reduce()), para su descuento al presupuesto
    calcularRestante(){                   //recive dos parametros, donde va acumular y el objeto sobre el que va iterar  
        const gastado = this.gastos.reduce( (total, gasto) => total + gasto.cantidad, 0); // determina la operacion que se va llevar a cabo y el valor en el que se va iniciar (0)
        this.restante = this.presupuesto - gastado;
        console.log(this.restante);
    };
}

class UI {
    ingresarPresupuesto(cantidad){
        //extrayendo los valores
        const {presupuesto, restante} = cantidad;

        //mostrando en el html
        document.querySelector('#total').textContent = presupuesto;
        document.querySelector('#restante').textContent = restante;
    };

    //metodo de alertas dinamico, recibe el texto del mensaje y que tipo de mensaje es
    imprimirAlerta(mensaje, tipo){
        //crear el div
        const divMensaje = document.createElement('div');
        divMensaje.classList.add('text-center', 'alert');

        if (tipo === 'error') {
            divMensaje.classList.add('alert-danger');
        }else{
            divMensaje.classList.add('alert-success');
        };

        //agregando mensaje 
        divMensaje.textContent = mensaje;

        //agregando al elemento html que posee la clase "primario"
        document.querySelector('.primario').insertBefore(divMensaje, formulario); 

        //quitar la alerta del html
        setTimeout(() => {
            divMensaje.remove();
        }, 3000);
    };

    agregarGastoListado(gastos){
        //elimina el html previo
        this.limpiarHtml();

        //iterar sobre los gastos
        gastos.forEach(gasto => {
            const {cantidad, nombre, id} = gasto;

            //crear un LI
            const nuevoGasto = document.createElement('li');
            nuevoGasto.className = 'list-group-item d-flex justify-content-between align-items-center';
            //nuevoGasto.setAttribute('data-id', id); // actualmente se hace: nuevoGasto.dataset.id = id;
            nuevoGasto.dataset.id = id;

            //agregar el html del gasto
            nuevoGasto.innerHTML = `${nombre} <span class="badge badge-primary badge-pill"> $ ${cantidad} </span>`;

            //boton para borrar el gasto
            const btnBorrar = document.createElement('button');
            btnBorrar.classList.add('btn', 'btn-danger', 'borrar-gasto');
            btnBorrar.innerHTML = 'Borrar &times';
            nuevoGasto.appendChild(btnBorrar);

            //agregar al html
            gastoListado.appendChild(nuevoGasto);
        });
    };

    limpiarHtml(){
        while (gastoListado.firstChild) {
            gastoListado.removeChild(gastoListado.firstChild);
        };
    };

    actualizarRestante(restante) {
        document.querySelector('#restante').textContent = restante;
    }
};

// Instancias Globales
const ui = new UI(); //User Interface

// Funciones

function preguntarPresupuesto() {
    const presupuestoUsuario = prompt('Cual es tu presupuesto');
    //console.log(Number(presupuestoUsuario)); // Numbre() convierte el input si es valido en formato de numero sea (int, float, etc..)

    //recarga la ventana actual y valida que se registre un valor de presupuesto correcto
    if (presupuestoUsuario === '' || presupuestoUsuario === null || isNaN(presupuestoUsuario) || presupuestoUsuario <= 0) {
        // isNaN() valida si el input es un numero
        window.location.reload();
    };

    presupuesto = new Presupuesto(presupuestoUsuario);
    //console.log(presupuesto);

    ui.ingresarPresupuesto(presupuesto);
};

function agregarGasto(evento) {
    evento.preventDefault();

    //Leer datos del formulario
    const nombre = document.querySelector('#gasto').value;
    const cantidad = Number(document.querySelector('#cantidad').value);

    //validar
    if (nombre === '' || cantidad === '') {
        ui.imprimirAlerta('Ambos campos son obligatorios', 'error');
        return;
    } else if (cantidad <= 0 || isNaN(cantidad)){
        ui.imprimirAlerta('Cantidad no valida', 'error');
        return;
    };

    //Generar un objeto con el gasto
    const gasto = {nombre, cantidad, id: Date.now()}; // estructura conocida como Object Literal - toma el valor de los atributos 
                                                     // anteriormente definidos y los reasigna al literal "gasto", ademas agrega un identificador
    //Agrega un nuevo gasto 
    presupuesto.nuevoGasto(gasto);

    //Mensaje de aprobacion del gasto
    ui.imprimirAlerta('Gasto agregado correctamente'); // no se agrega tipo, por que el metodo no lo requiere cuando es una accion correcta

    //Imprimir los gastos
    const { gastos, restante } = presupuesto;
    ui.agregarGastoListado(gastos);
    ui.actualizarRestante(restante);

    //Reiniciar Formulario
    formulario.reset();
};