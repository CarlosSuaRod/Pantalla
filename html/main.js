//

function refrescar() {
    document.getElementsByClassName("container-fluid")[0].classList.add("vanish");
    setTimeout(window.location.reload(),1000);
}

setTimeout(refrescar, 60000);

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
for(var i=0; i<tablas.length; i++) {
    for(var j=0; j<tablas[i].children.length; j++) {
        var fun = (tablas,i,j)=>{tablas[i].children[j].classList.add("colocar");};
        setTimeout(fun, 500*j, tablas, i, j);
    }
}

//Reloj analógico
const secondHand = document.querySelector('.second-hand');
const minsHand = document.querySelector('.min-hand');
const hourHand = document.querySelector('.hour-hand');

 function setDate() {
  const now = new Date();

  const seconds = now.getSeconds();
  const secondsDegrees = ((seconds / 60) * 360) + 90;
  secondHand.style.transform = `rotate(${secondsDegrees}deg)`;

  const mins = now.getMinutes();
  const minsDegrees = ((mins / 60) * 360) + ((seconds/60)*6) + 90;
  minsHand.style.transform = `rotate(${minsDegrees}deg)`;

  const hour = now.getHours();
  const hourDegrees = ((hour / 12) * 360) + ((mins/60)*30) + 90;
  hourHand.style.transform = `rotate(${hourDegrees}deg)`;
}

setInterval(setDate, 1000);

setDate();