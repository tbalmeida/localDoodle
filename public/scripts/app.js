$(() => {
  $.ajax({
    method: "GET",
    url: "/events"
  }).done((events) => {
    for(event of events) {
      $("<div>").text(event.title).appendTo($("body"));
    }
  });
  $( "#time" ).timepicker();

  function copyUrl() {
    var copyText = document.querySelector("#url");
    copyText.select();
    document.execCommand("copy");
  }
  
  document.querySelector("#copy").addEventListener("click", copyUrl);
  


});
