$(function(){
	// $("body").text("fuck")  only useful when dev tools are on

	if ("geolocation" in navigator){
		console.log("Browser has geolocation!");
		navigator.geolocation.getCurrentPosition(showPosition,handleError,options);
		// console.log("haha")
	}else{
		console.log("Browser doesn't have it");
		// console.log("hooh")
	}

	console.log(navigator)
	console.log("the document is ready!")


	var options = {
		enableHighAccuracy: true,
		timeout:1000

	}

	function showPosition(position){
		console.log(position)

		var lat = position.coords.latitude;
		var lng = position.coords.longitude;

		var coords = `
						<h2> Your position</h2>
						<ul>
							<li> latitude: ${lat} </li>

							<li> longitude: ${lng} </li>
						</ul>

					`

		$("body").append(coords)




	}



	function handleError(error){
		console.log("error getting location");
		console.log(error)

		if (error.code===1){
			var html = `<h2> Come on! Give me your location.</h2>`
			$("body").append(html);

		}
	}


})




// $(document).ready(function(){
// 	console.log("the document is ready!")

// 	if ("geolocation" in navigator){
// 		console.log("Browser has geolocation!");
// 	}else{
// 		console.log("Browser doesn't have it")
// 	}

// 	console.log(navigator)


// })