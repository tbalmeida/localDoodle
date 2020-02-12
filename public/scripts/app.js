$(() => {
  $.ajax({
    method: "GET",
    url: "/events"
  }).done((events) => {
    for(event of events) {
      $("<div>").text(event.title).appendTo($("body"));
    }
  });
});
