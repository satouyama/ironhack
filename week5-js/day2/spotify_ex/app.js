// app.js



$(function(){



	function iterate_artist_data(data){

		for (var counter = 0; counter <data.artists.items.length;counter++){
			var name = data.artists.items[counter].name;
			// console.log(counter)

			var id = data.artists.items[counter].id;

			try {
				var image_url = data.artists.items[counter].images[0].url;
			}catch(err) {
				var image_url = "asset/no_artist.svg";
			}

			 


			display_artists(name,image_url,id)

		}
		
	}

	function display_artists(name,image_url,id){
		var id = id;	
		var actual_name = name;
		var name =`<h2 class ='${actual_name}'> Name: ${name} </h2>`
		var image = `<img src="${image_url}" alt="${actual_name} face" height="200" width="200">` 

		$("body").append(`<a class = '${id}' href = '#'></a>`)
		$("." + id).append(name).append(image)

	}

	function iterate_album_data(data,artist_id){
		create_modal_struc(artist_id)
		for (var counter = 0; counter <data.items.length;counter++){
			var album_name = data.items[counter].name;
			// console.log(counter)

			var album_id = data.items[counter].id;

			try {
				var image_url = data.items[counter].images[0].url;
			}catch(err) {
				var image_url = "asset/no_artist.svg";
			}

			 


			append_albums(album_name,image_url,album_id,artist_id)

		}
		// display_albums()
		$('#'+artist_id).modal('show')

		$('#'+artist_id).on('shown.bs.modal',function(e){

			install_click_track(artist_id);	
		});
	
		// setTimeout(install_click_track(),3000);

	}

	function create_modal_struc(artist_id){
		var modal = `
						<div id="${artist_id}" class="modal fade" role="dialog" style ='display:none'>
							<div class="modal-dialog">
								<div class="modal-content">
									


								</div>
						  </div>
						</div>

					`;
		$("body").append(modal);


	}

	function append_albums(album_name,image_url,album_id,artist_id){
		var album_id = album_id;	
		var album_name = album_name;
		var artist_id = artist_id;
		var image_url = image_url;

		var list_item = `	<a id = "${album_id}" href ="#">
							<h3> Album name: ${album_name}</h3>
							<img src="${image_url}" alt="${album_name} pictures" height="100" width="100">
							</a>
						`

		$("#"+artist_id).find(".modal-content").append(list_item)


	}


	function install_click_track(artist_id){
		$(".modal-content > a:visible").click(function(event){
			event.preventDefault();
			// console.log("happy")

			var album_id = $(this).prop("id")


			var album = $(this)

			if (album.attr("data-toggle")=== "modal"){
	    		return;
	    	}

	    	album.attr("data-toggle","modal");
	    	album.attr("data-target","#"+	album_id);
			// console.log(album_id)

			var track_url =  `https://api.spotify.com/v1/albums/${album_id}/tracks`
			$.ajax({
				method: "GET",
				url: track_url,
				success:function(data,text,xhr){
					console.log(data)
					iterate_track_data(data,album_id,artist_id)
				},
				error: function(){console.log('error')}

			})



		})

	}


	function create_modal_track(album_id){
		var modal = `
						<div id="track${album_id}" class="modal fade" role="dialog" style ='display:none'>
							<div class="modal-dialog">
								<div class="modal-content">
									


								</div>
						  </div>
						</div>

					`;
		$("body").append(modal);

	}


	function iterate_track_data(data,album_id,artist_id){

		create_modal_track(album_id);
		console.log(data)

		for (var counter = 0; counter <data.items.length;counter++){
			var track_name = data.items[counter].name;
			// console.log(counter)

			var track_id = data.items[counter].id;

			try {
				var preview_url = data.items[counter].preview_url;
			}catch(err) {
				var preview_url = "#";
			}

			



			append_tracks(track_name,preview_url,track_id,album_id)



		}
		$("#"+artist_id).modal("hide")
		$("#"+artist_id).on("hidden.bs.modal",function(e){
			$('#track'+album_id).modal('show')
		})
		



	}

	function append_tracks(track_name,preview_url,track_id,album_id){
		var track_id = track_id;	
		var track_name = track_name;
		var album_id = album_id;
		var preview_url = preview_url;

		var list_item = `	<a id = "${track_id}" href ="#">
							<h3> Track name: ${track_name}</h3>
							<audio controls>
							  <source src="${preview_url}" type="audio/mpeg">
							 
								Your browser does not support the audio element.
							</audio>
							</a>
						`

		$("#track"+album_id).find(".modal-content").append(list_item)


	}

							// <audio src="${preview_url}" type="audio/mpeg"></audio>


	// function display_albums(){
		
	// 	$('a').on('shown.bs.modal', function () {
 //  			$('#myInput').focus()
	// 	})


	// }

	function install_click_album(){
		$("a").click(function(event){
	    	// let artist_id = event.currentTarget;



	    	var artist = $(this)

	    	var artist_id = artist.prop("class")

	    	if (artist.attr("data-toggle")=== "modal"){
	    		return;
	    	}

	    	artist.attr("data-toggle","modal");
	    	artist.attr("data-target","#track"+	artist_id);

	    	// console.log(artist_id)
	    	// $.ajax({
	    	var album_url = `https://api.spotify.com/v1/artists/${artist_id}/albums`

	    	// })
	    	$.ajax({
	    		method: "GET",
	    		url: album_url,
	    		success: function(data,text,xhr){
	    			console.log(data)
	    			// var name = data.artists.items[0].name;
	    			// var image_url = data.artists.items[0].images[0].url;
	    			iterate_album_data(data,artist_id);
	    			

	    		},
	    		error: function(data,text,xhr){
	    			console.log("error!");
	    		}

	    	})


	    })


	}


	$(".js-character-form").on("submit", function (event) {
    	event.preventDefault();


    	var artist_name = $(".name").val();

    	var spotify_url = "https://api.spotify.com/v1/search?type=artist&query=" + artist_name;


    	// var data = {
    	// 	type: "artist",
    	// 	name: artist_name
    	// }
 	

    	$.ajax({
    		method: "GET",
    		url: spotify_url,
    		success: function(data,text,xhr){
    			// console.log(data)
    			// var name = data.artists.items[0].name;
    			// var image_url = data.artists.items[0].images[0].url;
    			iterate_artist_data(data);
    			install_click_album();

    		},
    		error: function(data,text,xhr){
    			console.log("error!");
    		}

    	})



    })

		


})

// better structure
//  events activation on in one.  
// functions outside.




//1. inline block items parents can give it to children
//2. 