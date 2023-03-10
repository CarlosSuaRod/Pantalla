//Gestion guaguas

function refrescar() {
    document.getElementsByClassName("container-fluid")[0].classList.add("vanish");
    setTimeout(window.location.reload(),1000);
}

//setTimeout(refrescar, 60000);

var tablas = document.getElementsByTagName("tbody");

//Rellena vacío
for(var i=0; i<tablas.length; i++) {
    if(tablas[i].children.length==0) {
        const subnode = document.createElement("td");
        const node = document.createElement("tr");
        const textnode = document.createTextNode("No hay informacion");
        subnode.setAttribute("colspan", "3");
        subnode.appendChild(textnode);
        node.appendChild(subnode);
        
        tablas[i].appendChild(node);
    }
}
if(tablas.length<2) {
    setTimeout(refrescar, 5000);
}

//Colocar etiquetas tr
function animacionTablas() {
    for(var i=0; i<tablas.length; i++) {
        for(var j=0; j<tablas[i].children.length; j++) {
            var fun = (tablas,i,j)=>{tablas[i].children[j].classList.add("colocar");};
            setTimeout(fun, 500*j, tablas, i, j);
        }
    }
}


//gestion iframes



var id = setInterval(async function a() {
    var iframes = document.getElementsByTagName("iframe");
    if(iframes.length >= 4) {
        clearInterval(id);
        
        document.getElementsByTagName("html")[0].classList.add("unvanish");
        animacionTablas();
    }
}, 100);
/*
myIframe.addEventListener("load", function() {
  this.contentWindow.document.notesform.ID_client.value = Client;
});
*/