//METODOS DE PROPIEDAD / FUNCIONES EN UN OBJETO

const reproductor = {
    reproducir: function(n){
        console.log(`Reproduciendo cancion #${n}....`)
    },
    pausar: function(){
        console.log('Reproduccion pausada...')
    }
}

reproductor.reproducir(20);
reproductor.pausar();

// agregando funciones al objeto
reproductor.borrar = function(n){
    console.log(`Cancion #${n} ...borrada`);
}

reproductor.borrar(20);