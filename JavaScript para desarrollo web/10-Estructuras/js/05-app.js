//SWITCH

const metodoPago = 'Cheque';

switch (metodoPago){
    case 'Efectivo':
        console.log(`Pagaste con ${metodoPago}`);
        pagar();
        break;
    case 'Cheque':
        console.log(`Pagaste con ${metodoPago}`);
        pagar();
        break;
    case 'Tarjeta':
        console.log(`Pagaste con ${metodoPago}`);
        pagar();
        break;
    default:
        console.log('No has seleccionado metodo de pago');
        break;
}

function pagar(){
    console.log('Pagando...');
}