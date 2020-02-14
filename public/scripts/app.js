$(() => {
  
  $( "#time" ).timepicker();

  function copyUrl() {
    var copyText = document.querySelector("#url");
    copyText.select();
    document.execCommand("copy");
  }
  
  document.querySelector("#copy").addEventListener("click", copyUrl);
  


});
