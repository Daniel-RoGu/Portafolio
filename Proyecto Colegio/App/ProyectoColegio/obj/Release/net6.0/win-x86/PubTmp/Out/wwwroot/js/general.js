function fetchGet(url, callback) {
    let raiz = document.getElementById("hdfoculto").value;
    let urlAbsoluta = window.location.protocol + "//" +
        window.location.host + raiz + url;
   
    fetch(urlAbsoluta).then(res => res.json())
        .then(res => {
            callback(res)
        }).catch(err => {
            console.log(err)
        })

}
function fetchGetText(url, callback) {
    let raiz = document.getElementById("hdfoculto").value;
    let urlAbsoluta = window.location.protocol + "//" +
        window.location.host + raiz + url;

    fetch(urlAbsoluta).then(res => res.text())
        .then(res => {
            callback(res)

        }).catch(err => {
            console.log(err)

        })

}
function fetchPostText(url, frm, callback) {
    let raiz = document.getElementById("hdfoculto").value;
    let urlAbsoluta = window.location.protocol + "//" +
        window.location.host + raiz + url;

    fetch(urlAbsoluta, {
        method: "POST",
        body: frm
    }).then(res => res.text())
        .then(res => {
            callback(res)

        }).catch(err => {
            console.log(err)

        })

}

function setUrl(url) {
    var raiz = document.getElementById("hdfoculto").value;
    var urlAbsoluta = window.location.protocol + "//" +
        window.location.host + raiz + url;
    return urlAbsoluta;
}



function borrarContenidoPorClase(clase) {

    var inputs = document.querySelectorAll('.' + clase);

    inputs.forEach(function (input) {

        if (input.type === 'text' || input.type === 'textarea') {

            input.value = '';
        } else if (input.type === 'checkbox') {

            input.checked = false;
        } else {

            input.value = '';
        }
    });
}


