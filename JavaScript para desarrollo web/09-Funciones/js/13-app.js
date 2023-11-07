//ARROW FUNCTION en el reproductor de musica

const reproductor = {
    reproducir: n => console.log(`Reproduciendo cancion #${n}....`), //cuando se tiene un solo parametro no es necesario el parentesis
    pausar: () => console.log('Reproduccion pausada...'),
    crearPlayList: nombre => console.log(`Creando PlayList #${nombre}....`),
    reproducirPlayList: nombre => console.log(`Reproduciendo PlayList #${nombre}....`),

    set nuevaCancion(cancion){
        this.cancion = cancion;
        console.log(`Añadiendo ${cancion}`);
    },

    get ObtenerCancion(){
        console.log(`${this.cancion}`);
    }
}

reproductor.reproducir(20);
reproductor.pausar();

// agregando funciones al objeto
reproductor.borrar = n => console.log(`Cancion #${n} ...borrada`);

reproductor.borrar(20);
reproductor.crearPlayList('Pop');
reproductor.crearPlayList('Regueton');
reproductor.reproducirPlayList('Pop');

reproductor.nuevaCancion = 'Memoris';
reproductor.ObtenerCancion;