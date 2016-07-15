SpotifyApp.Search = class {
	constructor(song_name){
		this.song_name = song_name;
	}


	render_first(){

		var url = "https://api.spotify.com/v1/search?q=" + this.song_name + "&type=track"
		var boundUpdateContent = this.updateContent.bind(this)
		var boundPrepareFullData = this.prepareFullData.bind(this)
		$.ajax({
			type:"GET",
			url: url,
			success:function(data,text,xhr){
				console.log(data)

				var first_song_object = data.tracks.items[0];

				boundUpdateContent(first_song_object);

				$(".js-track-search-box").val("")

				boundPrepareFullData(data.tracks.items);

			},
			error:SpotifyApp.handleError

		})


	}

	prepareFullData(all_tracks){
		for (var counter=0;counter<all_tracks.length;counter++){
			var song_name = all_tracks[counter].name;

			var track_element = `
								<br>

								<a href = "#"> ${counter+1} : ${song_name}</a>
								<br>
								`

			$(".modal-body-full-track").append(track_element)
		}
	}


	updateContent(song_object){
		var song_name = song_object.name;
		var artist = song_object.artists[0].name;
		var cover_image_link = song_object.album.images[0].url;
		var preview_url = song_object.preview_url;

		$(".js-title").text(song_name);
		$(".js-author").text(artist);
		$(".js-cover").attr("src",cover_image_link)
		$(".js-preview").attr("src",preview_url)


	}








}












$(function(){
	$(".js-track-search").on("submit",function(event){
		event.preventDefault();
		var search_term = $(".js-track-search-box").val();
		var new_song = new SpotifyApp.Search(search_term)
		$(".js-preview").trigger("pause")
		$(".js-play").removeClass("playing")
		new_song.render_first()


	})

	$(".js-more-results").on("click",function(event){
		event.preventDefault();
		$("..modal-body-full-track").modal("show")

	})



})