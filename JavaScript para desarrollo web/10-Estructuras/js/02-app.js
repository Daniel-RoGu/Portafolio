//COMPARADOR ESTRICTO

const puntaje = 1000;

// != diferente de  // == es  igual a
// !== estrictamente diferentes, involucra tipo de dato
if(puntaje === "1000"){ // === es exactamente igual, involucra tipo de dato tambien
    console.log('Si es igual...');
} else {
    console.log('No es igual...');
}

// == no estricto (no considera el tipo de dato "1000" igual a 1000)
// === estricto (considera tanto valor como tipo de dato "1000" no es igual a 1000)