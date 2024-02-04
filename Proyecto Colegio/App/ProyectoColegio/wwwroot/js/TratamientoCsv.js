document.getElementById('inputFile').addEventListener('change', handleFile);
let listInfo = [];

function handleFile(event) {
    const file = event.target.files[0];

    if (!file) {
        console.error('No se seleccionó ningún archivo.');
        return;
    }

    // Utiliza PapaParse para analizar el archivo CSV
    Papa.parse(file, {
        encoding: 'ISO-8859-1', // Establece la codificación del archivo
        complete: function (results) {
            // results.data contiene los datos analizados del CSV

            // Mapear los datos a una lista de objetos
            const dataList = results.data.map(row => {
                return {
                    annoElectivo: row[0], // Sabiendo que la columna 1 está en la posición 0
                    departamento: row[1],
                    estadoMatricula: row[2],
                    municipio: row[3],
                    institucion: row[4],
                    calendario: row[6],
                    sector: row[7],
                    zonaSede: row[11],
                    jornada: row[12],
                    grado: row[13],
                    grupo: row[14],
                    modalidad: row[15],
                    fechaInicio: row[17],
                    fechaFin: row[18],
                    NUI: row[19],
                    estrato: row[20],
                    sisben: row[21],
                    PERID: row[22],
                    numeroIdentificacion: row[23],
                    tipoIdentificacion: row[24],
                    apellido1: row[25],
                    apellido2: row[26],
                    nombre1: row[27],
                    nombre2: row[28],
                    genero: row[29],
                    fechaNacimiento: row[30],
                    barrio: row[31],
                    eps: row[32],
                    tipoSangre: row[33],
                    internado: row[36],
                    apoyoAcademicoEspecial: row[38],
                    discapacidad: row[40],
                    paisOrigen: row[41],
                    correo: row[42]
                };
            });

            // Ahora dataList contiene la lista de objetos con los datos específicos
            displayData(dataList);
            listInfo = dataList;
            imprimirLista(listInfo);
        }
    });
}

function imprimirLista(lista) {
    for (let i = 0; i < lista.length; i++) {
        console.log(lista[i]);
    }
}

function displayData(dataList) {
    // Haz algo con la lista de objetos, por ejemplo, mostrarlos en la consola
    console.log(dataList);
}