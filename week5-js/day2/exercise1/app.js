// app.js

$(document).ready(function () {

  $(".js-character-form").on("submit", function (event) {
    event.preventDefault();

    var current_url = 	

    var data = {
	  	name: $(".name").val(),
	  	occupation: $(".occupation").val(),
	  	weapon: $(".weapon").val()
	}


    $.ajax({
    	method: "POST",
    	url:current_url,
    	data: data,
    	success: function(data,text,xhr){
    		console.log(xhr);
    	},
    })
    
    



    alert("FORM SUBMITTED");   
  });






  









});