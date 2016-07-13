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
		var location = lat + "," + lng

		$("body").append(coords)

		// show_static_map(location);

		initMap(lat,lng);


	}
	


	function show_static_map(location){
		var key ="AIzaSyCkUOdZ5y7hMm0yrcCQoCvLwzdM6M8s5qk"
		var static_map = `
						<img src = "https://maps.googleapis.com/maps/api/staticmap?center=${location}&zoom=14&size=400x400& key =${key}" alt = "current location map" height = "400" weight = "400">

						`

		$("body").append(static_map)
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