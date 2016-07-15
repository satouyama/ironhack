SpotifyApp.Search = class {
	constructor(song_name){
		this.song_name = song_name;
	}


	render(){

		var url = "https://api.spotify.com/v1/search?q=" + this.song_name + "&type=track"
		var boundUpdateContent = this.updateContent.bind(this)
		$.ajax({
			type:"GET",
			url: url,
			success:function(data,text,xhr){
				console.log(data)

				var first_song_object = data.tracks.items[0];

				boundUpdateContent(first_song_object);


			},
			error:SpotifyApp.handleError

		})


	}

	updateContent(song_object){
		var song_name = song_object.name;
		var artist = song_object.artists[0].name;
		var cover_image_link = song_object.album.images[0].url;

		$(".js-title").text(song_name);
		$(".js-author").text(artist);
		$(".js-cover").attr("src",cover_image_link)


	}








}























$(function(){
	$(".js-track-search").on("submit",function(event){
		event.preventDefault();
		var search_term = $(".js-track-search-box").val();
		var new_song = new SpotifyApp.Search(search_term)

		new_song.render()


	})
})