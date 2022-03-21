<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>LAB 08</title>
    <link type="text/css" rel="stylesheet" href="assets/styles.css">
    <script type="text/javascript" src="assets/library.js"></script>
    <script>
function loadXMLDoc(st)
{
var xmlhttp;

  xmlhttp=new XMLHttpRequest();
  
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById('A1').innerHTML=xmlhttp.status;
    document.getElementById('A3').innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET",st,true);
xmlhttp.send();
}
</script>
  </head>
  <body>
  
  <h1>Reading the XML file</h1>
<p><b>Status:</b><span id="A1"></span></p>
<p><b>Response:</b><span id="A3"></span></p>
<button onclick="loadXMLDoc('file.xml')">Get XML data</button>

    <p id="version">Loading ...</p>
    <div id="b12">
    <button id="b1" onclick="write1()">GET PASSWORD HINT</button>
</div>


    <script type="text/javascript" src="assets/events.js"></script>
    <script>
      function write1() {
        var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("b12").innerHTML =this.responseText;
    }
  };
  xhttp.open("GET", "change.txt", true);
  xhttp.send();
}

    </script>
    
  </body>
  
</html>
