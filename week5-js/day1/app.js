$(function(){
	// alert("haha")
	$(".js-special-button").click(function(){
		$(".js-fadedInfo").fadeToggle("slow","linear")

	})
	var counter = 0;
	
	$(".unicorn-mode").click(function(){
		if (counter ===0){
		
			$("body").css({"background-color": "red"})
			counter = 1
		}else{
			$("body").css({"background-color": "white"})
			counter = 0
		}
	})



	$(".js-submit-button").click(function(){
		var input_array = $(".box")
		// console.log("function passed")
		for (var counter = 0;counter<input_array.length;counter++){
			if (input_array.eq(counter).val() === ""){
				alert("pls input something")
				break;
			}
			console.log(counter)
		}
	})



	// if (counter ===0){
	// 	$(".unicorn-mode").click(function(){
	// 		$("body").css({"background-color": "red"})
	// 		counter = 1
	// 	})
	// }else{
	// 	$(".unicorn-mode").click(function(){
	// 		$("body").css({"background-color": "white"})
	// 		counter = 0
	// 	})

	// }

	// $(".unicorn-mode").click(
	// 	{
	// 		function(){$("body").css({"background-color": "red"})}
	// 		counter = 1;
	// 	}else{
	// 		function(){$("body").css({"background-color": "white"})}
	// 		counter = 0;
	// 	}
	// 	// function(){$("body").css({"background-color": "blue"});},
	//     // function(){$("body").css({"background-color": "green"});
	// })



})







// $( document ).ready(function() {
//   // Handler for .ready() called.
//   alert("haha")
// });

