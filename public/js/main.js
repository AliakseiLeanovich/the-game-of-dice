$(document).ready(function(){
  $("#rateForm").submit(function(e) {
    $.ajax({
           type: "POST",
           url: "/rate",
           data: $("#rateForm").serialize(),
           success: function(data)
           {
             $('#score').text(data.score);
             $('#dice1').text(data.dice1);
             $('#dice2').text(data.dice2);
             $('#input_score').val(data.score);
           }
         });
    e.preventDefault();
  });
});
