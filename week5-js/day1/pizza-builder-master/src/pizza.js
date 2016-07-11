// Write your Pizza Builder JavaScript in this file.$(function(){
	// alert("haha")
 $(function(){
	$(".btn-pepperonni").click(function(){
		$(".pep").fadeToggle("fast","linear",function(){  // called once per matched element
			if (($(".pep").is(":visible"))){
				$(".btn-pepperonni").removeClass("active")
				console.log("x");
			}else{
				$(".btn-pepperonni").addClass("active")
				console.log("y")
			}
		})

	})


	$(".btn-mushrooms").click(function(){
		if (($(".mushroom").is(":visible"))){
			$(".btn-mushrooms").removeClass("active")
			console.log("x");
		}else{
			$(".btn-mushrooms").addClass("active")
			console.log("y")
		}
		$(".mushroom").fadeToggle()




	})

	


	$(".btn-green-peppers").click(function(){
		if (($(".green-pepper").is(":visible"))){
			$(".btn-green-peppers").removeClass("active")
			console.log("x");
		}else{
			$(".btn-green-peppers").addClass("active")
			console.log("y")
		}
		$(".green-pepper").fadeToggle()
	})


	$(".sauce-white").hide()
	$(".btn-sauce").click(function(){
		if (($(".sauce").is(":visible"))){
			$(".btn-sauce").removeClass("active")
			console.log("x");
		}else{
			$(".btn-sauce").addClass("active")
			console.log("y")
		}

		$(".sauce-white").fadeToggle("sauce-white")
	})


	$(".crust-gluten-free").removeClass("crust-gluten-free")

	$(".btn-crust").click(function(){
		if (($(".crust-gluten-free").is(":visible"))){
			$(".btn-crust").addClass("active")
		}else{
			$(".btn-crust").removeClass("active")
			console.log("y")
		}

		$(".crust").toggleClass("crust-gluten-free")

	})


})






	// var counter = 0;
	
	// $(".unicorn-mode").click(function(){
	// 	if (counter ===0){
		
	// 		$("body").css({"background-color": "red"})
	// 		counter = 1
	// 	}else{
	// 		$("body").css({"background-color": "white"})
	// 		counter = 0
	// 	}
	// })



	// $(".js-submit-button").click(function(){
	// 	var input_array = $(".box")
	// 	// console.log("function passed")
	// 	for (var counter = 0;counter<input_array.length;counter++){
	// 		if (input_array.eq(counter).val() === ""){
	// 			alert("pls input something")
	// 			break;
	// 		}
	// 		console.log(counter)
	// 	}
	// })


