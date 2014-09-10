$(document).ready(function (){

  $("form#hit_form input").click(function (){

    $.ajax({
      type: "POST",
      url: "/hit"
    }).done(function(msg) {
      $("#game").html(msg);
    });


    return false;
  });


});


// $(document).ready(function (){
//   $("form#stay_form input").click(function (){

//     $.ajax({
//       type: "POST",
//       url: "/stay"
//     }).done(function(msg) {
//       $("#game").html(msg);
//     });


//     return false;
//   });
// });