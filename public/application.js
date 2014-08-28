$(document).ready(function() {
  $("#hit_form .hit").click(function() {
    alert("hit");
    $.ajax({
      type: 'POST',
      url: '/hit'
    }).done(function(msg){
      alert(msg)
      $("div#game").replaceWith(msg);
    });
    return false;
  });
});
