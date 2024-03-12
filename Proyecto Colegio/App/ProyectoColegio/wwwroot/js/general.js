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


