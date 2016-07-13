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

		var list_item = `
							<h3> Album name: ${album_name}</h3>
							<img src="${image_url}" alt="${album_name} pictures" height="100" width="100">
			
						`

		$("#"+artist_id).find(".modal-content").append(list_item)


	}

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
	    	artist.attr("data-target","#"+	artist_id);

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