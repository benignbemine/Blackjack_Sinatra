$(document).ready(function (){
  $("form#hit_form input").click(function (){
    $.ajax({
      type: "POST",
      url: "/hit"
    }).done(function(msg) {
      $("div#game").html(msg);
    });
    return false;
  });

  $("form#stay_form input").click(function (){
    alert("stay")
    $.ajax({
      type: "POST",
      url: "/stay"
    }).done(function(msg) {
      $("div#game").html(msg);
    });
    return false;
  });
});
