var Lab08 = (function() {
  var entity = {};

  /**
   * Request the version from the server and provide it
   * as an input to the callbackFn
   * @param function callbackFn The function to call with the version data.
   */
  entity.version = function(callbackFn) {
    entity.request(
      "GET", 
      "api.php", 
      true, 
      function() {
        if (this.readyState == 4 && this.status == 200) {
          var data = JSON.parse(this.responseText);
          callbackFn(data);
        }
      }
    );
  }

  /**
   * Make a request to the server and attach the provided callbackFn
   * @param string method The HTTP Method (e.g. GET, POST, PUT, DELETE)
   * @param string endpoint The endpoint (aka URL) to send the request to
   * @param boolean async True if you want the call to be asynchronous
   * @param function callbackFn The function to attach to the onreadystatechange
   */
  entity.request = function(method, endpoint, async, callbackFn) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = callbackFn;
    xhttp.open(method, endpoint, async);
    xhttp.send();    
  }
 

  return entity;
}());