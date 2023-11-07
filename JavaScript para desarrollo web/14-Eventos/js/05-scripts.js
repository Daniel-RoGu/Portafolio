//EVENTOS DEL SCROLL

/*
window.addEventListener('scroll', () => {
    //console.log('scrolling...');
    const scrollPX = window.scrollY; // scroll en el eje y
    console.log(scrollPX);
});
*/
window.addEventListener('scroll', () => {
    const premium = document.querySelector('.premium'); // nombre de una clase en el html
    const ubicacion = premium.getBoundingClientRect(); // permite identificar varias caracteristicas de dimension y estilo entre los elementos html abordados por el scroll y el elemento deseado (premium)
                             //util para detectar elementos del html
    //console.log(ubicacion);

    if (ubicacion.top < 784) {
        console.log('El elemento ya esta visible');
    } else {
        console.log('Aun no esta visible, da mas scroll');
    }

});