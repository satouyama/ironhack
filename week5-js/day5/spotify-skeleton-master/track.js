SpotifyApp.Track = class {
	constructor(album_id){
		this.album_id = album_id;


	}

	render(){
		var url = `https://api.spotify.com/v1/albums/${this.album_id}/tracks`
		var that = this;
		$.ajax({
			type:"GET",
			url:url,
			success:function(data,text,xhr){
				// console.log(data)
				iterate_track_data(data,that.id,)

			},
			error:SpotifyApp.handleError


		})


	}

	append_tracks(track_name,preview_url,track_id,album_id){
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

		$(".modal-body-all-tracks-from-albums").append(list_item)


	}



	iterate_track_data(data,album_id,artist_id){

		// create_modal_track(album_id);
		// console.log(data)

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
			console.log("appended")



		}
		// $(document).on('hidden.bs.modal', function(event){
		// 	$('.modal-backdrop').remove();
		// 	console.log(event)
		// 	$('#track'+album_id).modal('show')

		// })

		// $("#"+artist_id).on("hidden.bs.modal",function(e){
		// 	// $('body').removeClass('modal-open');
		// 	$('.modal-backdrop').remove();
		// 	$('#track'+album_id).modal('show')
		// })
		



	}


}



$(function(){
	
	$("#js-all-albums-modal").on("shown.bs.modal",function(event){
		console.log("all album modal is shown!")
		$(this).on("click","a",function(event){

			// console.log(this)
			// console.log(event.target)
			console.log("album clicked happened")

			var album_id = $(this).attr("id")
			// console.log("id is" + album_id)
			// console.log(album_id)
			
			var new_album = new SpotifyApp.Track(album_id)

			new_album.render();




		})

	})


})