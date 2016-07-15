SpotifyApp.Album = class {
	constructor(artist_id){
		this.artist_id = artist_id;

	}





	prepareData (){
		var url = `https://api.spotify.com/v1/artists/${this.artist_id}/albums`
		console.log(url)
		var boundPopulateModal = this.populateModal.bind(this)
		$.ajax({
			type:"GET",
			url: url,
			success:function(data,text,xhr){
				// console.log(data)
				boundPopulateModal(data.items);


			},
			error:SpotifyApp.handleError

		})

	}

	populateModal(all_albums){

		// create_modal_struc(artist_id)
		for (var counter = 0; counter <all_albums.length;counter++){
			var album_name = all_albums[counter].name;
			// console.log(counter)

			var album_id = all_albums[counter].id;

			try {
				var image_url = all_albums[counter].images[0].url;
			}catch(err) {
				var image_url = "images.png";
			}

			 


			this.append_albums(album_name,image_url,album_id)

		}
		// // display_albums()
		// $('#'+artist_id).modal('show')

		// $('#'+artist_id).on('shown.bs.modal',function(e){

		// 	install_click_track(artist_id);	
		// });
	
		// setTimeout(install_click_track(),3000);

	}

	append_albums(album_name,image_url,album_id){
		var album_id = album_id;	
		var album_name = album_name;
		// var artist_id = artist_id;
		var image_url = image_url;

		var list_item = `	<a id = "${album_id}" href ="#">
							<h3> Album name: ${album_name}</h3>
							<img src="${image_url}" alt="${album_name} pictures" height="100" width="100">
							</a>
						`

		$("#js-all-albums-modal").find(".modal-body-all-albums").append(list_item)
	}




}



$(function(){
	$("#js-artist-info-modal").on("shown.bs.modal",function(event){
		var artist_id = $("li#name").attr("data-id");
		// console.log(artist_id)

		// console.log("i am clicked")
		var new_album = new SpotifyApp.Album(artist_id);
		// console.log(new_album)

		// new SpotifyApp.Album(12123).prepareData();

		new_album.prepareData();



	})

	$(".js-album-button").on("click",function(event){
		$("#js-artist-info-modal").modal("hide")
		$("#js-artist-info-modal").on("hidden.bs.modal",function(event){
			$("#js-all-albums-modal").modal("show")
		})

		
	})


})