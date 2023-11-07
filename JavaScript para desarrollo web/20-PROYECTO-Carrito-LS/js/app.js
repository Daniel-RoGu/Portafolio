//PROYECTO CARRITO

//Variables
const carrito = document.querySelector('#carrito');
const contenedorCarrito = document.querySelector('#lista-carrito tbody');
const vaciarCarritobtn = document.querySelector('vaciar-carrito');
const listaCursos = document.querySelector('#lista-cursos');
let articulosCarrito = [];

cargarEventListeners();
function cargarEventListeners() {
    //cuando se agrega un curso al presionar el boton "Agregar al carrito";
    listaCursos.addEventListener('click', agregarCurso);

    //eliminar cursos del carrito
    carrito.addEventListener('click', eliminarCurso);

    //muestra los cursos del localStorage
    document.addEventListener('DOMContentLoaded', () => {
        articulosCarrito = JSON.parse( localStorage.getItem('carrito')) || []; // agrega el contenido almacenado en el local storage al areglo del carrito, de no haber contenido agrega el areglo vacio
        carritoHTML(); // se llama para imprimir el contenido agregado desde el localStorage
    })

    //vaciar el carrito
    vaciarCarritobtn.addEventListener('click', () => {
        articulosCarrito = []; // se recetea el arreglo del carrito
        limpiarCarrito(); // se limpia el contenido del carrito en el html
    });
}

//obtener el curso seleccionado en el html para su cargue al carrito
function agregarCurso(evento) {
    evento.preventDefault(); // es bueno usarlo cuando el boton no redirecciona
    if (evento.target.classList.contains('agregar-carrito')) {
        const cursoSeleccionado = evento.target.parentElement.parentElement; // ubica la seleccion del elemento html desde el boton hasta el card 
        console.log(cursoSeleccionado); 
        leerDatosCurso(cursoSeleccionado); // se envia un curso a la funcion
    }
    
} 

//abstrae la informacion del curso seleccionado
function leerDatosCurso(curso) {
    //crea un objeto con el contenido del curso actual
    const infoCurso = {
        imagen: curso.querySelector('img').src,
        titulo: curso.querySelector('h4').textContent,
        precio: curso.querySelector('.precio span').textContent,
        id: curso.querySelector('a').getAttribute('data-id'),  // busca entre los elementos de la etiqueta padre, la referente a ('a') y en la misma 
                                                              //busca si esta posee un atributo llamado ('data-id) 
        cantidad: 1                                                       
    };

    //Revisa si un articulo ya existe en el carrito
    const existe = articulosCarrito.some( curso => curso.id === infoCurso.id);
    if (existe) {
        //se actualiza la cantidad del articulo en el carrito
        const cursos = articulosCarrito.map( curso => {
            if (curso.id === infoCurso.id) {
                curso.cantidad++;
                return curso; // retorna el objeto actualizado
            } else {
                return curso; // retorna los objetos que no son los duplicados
            }
        });
        articulosCarrito = [...cursos];
    }else {
        //se agrega el articulo al carrito
        articulosCarrito = [...articulosCarrito, infoCurso];
    }
        
    //llamando la funcion para mostrar el carrito con el contenido actualizado
    carritoHTML();
};

//Muestra el carrito de compras en el HTML
function carritoHTML() {

    //limpiar el contenido del html para sobreescribir los datos del arreglo en el html, evitando repetir elementos 
    limpiarCarrito();

    // recorre el carrito y genera el html para mostrar su contenido
    articulosCarrito.forEach( curso => {
        const {imagen, titulo, precio, cantidad, id} = curso;
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>
                <img src="${imagen}" width=100>
            </td>
            <td>
                ${titulo}
            </td>
            <td>
                ${precio}
            </td>
            <td>
                ${cantidad}
            </td>
            <td>
                <a href="#" class="borrar-curso" data-id="${id}"> X </a>
            </td>
        `;// template string o template literal ` `

         // agregando el html del carrito al DOM principal del index
        contenedorCarrito.appendChild(row); // contenedor tbody donde se muestra los articulos agregados al carrito
       
    });
   
    // agregar el carrito de compras al storage
    sincronizarStorage();

};

// cargar el contenido del carrito en el localStorage
function sincronizarStorage() {
    localStorage.setItem('carrito', JSON.stringify(articulosCarrito));
}

// elimina el contenido del carrito en el html (en el tbody)
function limpiarCarrito() {
    //forma de ejecucion lenta
    //contenedorCarrito.innerHTML = '';

    //forma de ejecucion eficiente para el sistemas
    while (contenedorCarrito.firstChild) {
        contenedorCarrito.removeChild(contenedorCarrito.firstChild);
    }
};

// elimina un curso cargado en el carrito
function eliminarCurso (evento) {
    //la condicion valida si el objeto html seleccionado posee la clase 'borrar-curso', dicha clase corresponde al boton de eliminar
    if (evento.target.classList.contains('borrar-curso')) {
        const cursoId = evento.target.getAttribute('data-id');

        //eliminar elemento del arreglo articulosCarrito por el data-id
        articulosCarrito = articulosCarrito.filter( curso => curso.id !== cursoId); // retorna todos los elementos exepto el que se quiere eliminar

        //se debe volver a iterar sobre el carrito y mostrar su contenido actualizado en el html
        carritoHTML();
    }
}