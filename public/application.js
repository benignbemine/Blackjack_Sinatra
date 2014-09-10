$(document).ready(function (){
  $(document).on("click", "form#hit_form input", function (){
    $.ajax({
      type: "POST",
      url: "/hit"
    }).done(function(msg) {
      $("div#game").replaceWith(msg);
    });
    return false;
  });

  $(document).on("click", "form#stay_form input", function (){
    $.ajax({
      type: "POST",
      url: "/stay"
    }).done(function(msg) {
      $("div#game").replaceWith(msg);
    });
    return false;
  });

  $(document).on("click", "form#ace_one input", function (){
    $.ajax({
      type: "POST",
      url: "/ace_as_one"
    }).done(function(msg) {
      $("div#game").replaceWith(msg);
    });
    return false;
  });

  $(document).on("click", "form#ace_eleven_form input", function (){
    $.ajax({
      type: "POST",
      url: "/ace_as_eleven"
    }).done(function(msg) {
      $("div#game").replaceWith(msg);
    });
    return false;
  });

  $(document).on("click", "form#dealer_reveal input", function (){
    $.ajax({
      type: "POST",
      url: "/dealer_reveal"
    }).done(function(msg) {
      $("div#game").replaceWith(msg);
    });
    return false;
  });
});
