
window.onload = function() {

  Lab08.version(function(data){
    var version = document.getElementById("version");
    version.innerHTML = data["name"] + " v" + data["version"];
  })

};