// Obtener referencia al dialog
const dialog = document.getElementById('formulario');

// Obtener referencia al botón para mostrar el formulario
const mostrarFormularioBtn = document.getElementById('boton-agregar');

// Abrir el dialog al hacer clic en el botón
mostrarFormularioBtn.addEventListener('click', () => {
  dialog.showModal();
});

// Cerrar el dialog al enviar el formulario
dialog.querySelector('form').addEventListener('submit', () => {
  dialog.close();
});
