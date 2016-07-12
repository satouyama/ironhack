// Write your Pizza Builder JavaScript in this file.$(function(){
	// alert("haha")
 $(function(){



	$(".btn-pepperonni").click(function(){
		// console.log("change runs first")
		// var a = $(".btn-pepperonni")

		// console.log(a)
		pep_counter = !pep_counter

		if (pep_counter == true){
			$("#pep").show()
		}else {
			$("#pep").hide()
		}
		$(".pep").fadeToggle("fast","linear",function(){  // called once per matched element
			if (($(".pep").is(":visible"))){
				$(".btn-pepperonni").addClass("active")
				console.log("x");
			}else{
				$(".btn-pepperonni").removeClass("active")
				console.log("y")
			}
		})

	})


	$(".btn-mushrooms").click(function(){
		mush_counter = !mush_counter

		if (mush_counter == true){
			$("#mush").show()
		}else {
			$("#mush").hide()
		}

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
		green_counter = !green_counter
		if (green_counter == true){
			$("#green").show()
		}else {
			$("#green").hide()
		}
		if (($(".green-pepper").is(":visible"))){
			$(".btn-green-peppers").removeClass("active")
			console.log("x");
		}else{
			$(".btn-green-peppers").addClass("active")
			console.log("y")
		}
		$(".green-pepper").fadeToggle()
	})

	$(".btn-sauce").removeClass("active")
	$("#sauce").hide()

	$(".sauce-white").hide()
	$(".btn-sauce").click(function(){
		white_counter = !white_counter
		if (white_counter == true){
			$("#sauce").show()
		}else {
			$("#sauce").hide()
		}
		if (($(".sauce").is(":visible"))){
			$(".btn-sauce").addClass("active")
			console.log("x");
		}else{
			$(".btn-sauce").removeClass("active")
			console.log("y")
		}

		$(".sauce-white").fadeToggle("sauce-white")
	})


	$(".crust-gluten-free").removeClass("crust-gluten-free")

	$(".btn-crust").removeClass("active")
	$("#crust").hide()
	$(".btn-crust").click(function(){
		glutten_counter =!glutten_counter
		if (glutten_counter == true){
			$("#crust").show()
		}else {
			$("#crust").hide()
		}
		if (($(".crust-gluten-free").is(":visible"))){
			$(".btn-crust").addClass("active")
		}else{
			$(".btn-crust").removeClass("active")
			console.log("y")
		}

		$(".crust").toggleClass("crust-gluten-free")

	})
	var pep_counter = true;
	var mush_counter = true;
	var green_counter = true;
	var white_counter = false;
	var glutten_counter = false;
	var final = pep_counter * 1 + mush_counter * 1 + green_counter * 1 + 10

	$("strong").text("$" + final)

	$(".btn").click(function(){
		final = pep_counter * 1 + mush_counter * 1 + green_counter * 1 + white_counter * 3 + glutten_counter * 5 + 10
		$("strong").text("$" + final)


		// console.log("price runs first")

		// var button_list = $(".btn")

		// console.log(pep_counter + " " + mush_counter + " " +green_counter + " " +white_counter + " " +glutten_counter)

		// for (var counter = 0;counter<button_list.length;counter++){
		// 	switch (button_list.eq(counter).prop("class")){
		// 		case "btn btn-pepperonni active":
		// 			pep_counter = !pep_counter;
		// 			console.log(pep_counter)
		// 			break;
		// 		case "btn btn-pepperonni":
		// 			pep_counter = !pep_counter;
		// 			console.log(pep_counter)

		// 			break;
		// 		case "btn btn-mushrooms active":
		// 			mush_counter = !mush_counter;

		// 			break;
		// 		case "btn btn-mushrooms":
		// 			mush_counter = !mush_counter;

		// 			break;
		// 		case "btn btn-green-peppers active":
		// 			green_counter = !green_counter;

		// 			break;
		// 		case "btn btn-green-peppers":
		// 			green_counter = !green_counter;

		// 			break;
		// 		case "btn btn-sauce active":
		// 			white_counter = !white_counter;

		// 			break;
		// 		case "btn btn-sauce":
		// 			white_counter = !white_counter;

		// 			break;
		// 		case "btn btn-crust active":
		// 			glutten_counter = !glutten_counter;

		// 			break;
		// 		case "btn btn-crust":
		// 			glutten_counter = !glutten_counter;

		// 			break;
			
		
		// console.log(pep_counter + " " + mush_counter + " " +green_counter + " " +white_counter + " " +glutten_counter)
		


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


