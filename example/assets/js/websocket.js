document.addEventListener('DOMContentLoaded', loadWindow, false)

// function loadWindow () {
//   Array.from(document.getElementsByTagName('button')).forEach(function (value, i, col) {
//     col[i].onclick = function (e) { mode(e.target.id) }
//   })}

ws = new WebSocket("ws://localhost:8080/ws")
console.log("initialized websocket")
ws.onmessage = function(evt) {
     console.log(evt.data);
     document.getElementById('out').innerHTML = evt.data
}
ws.onopen = function() {
	console.log("connected");
}
ws.onclose = function() {
	console.log("closed websocket");
}

function mode (btnID) {
    if(btnID === "close"){
      ws.onclose()
    }else{
    ws.send(btnID)}
}
 
  
  
function loadWindow () {
  Array.from(document.getElementsByTagName('button')).forEach(function (value, i, col) {
    col[i].onclick = function (e) { mode(e.target.id) }
  })

  //const interval = setInterval(function() {
  //  ws.send("")    
  //}, 1000)
}
  







