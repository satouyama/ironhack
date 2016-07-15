SpotifyApp.Artist = class {
	constructor(artist_name){
		this.artist_name = artist_name;
	}


	render(){

		var url = "https://api.spotify.com/v1/search?q=" + this.artist_name + "&type=artist"
		var boundPopulateModal = this.populate_modal.bind(this)
		$.ajax({
			type:"GET",
			url: url,
			success:function(data,text,xhr){
				console.log(data)

				boundPopulateModal(data);

				$("#js-artist-info-modal").modal("show")


			},
			error:SpotifyApp.handleError

		})

	}

	populate_modal(artist_object){
		var name = this.artist_name;
		var image_url = artist_object.artists.items[0].images[0].url;
		var genres = artist_object.artists.items[0].genres[0];
		var followers = artist_object.artists.items[0].followers.total;
		var popularity = artist_object.artists.items[0].popularity;




		var artist_info = `
							<ul class="list-group js-artist-info">
							  <li class="list-group-item">Name: ${name}</li>
							  <img src ="${image_url}" height = "100" width = "100">
							  <li class="list-group-item">Genres: ${genres}</li>
							  <li class="list-group-item">Followers: ${followers}</li>
							  <li class="list-group-item">Popularity: ${popularity}</li>
							</ul>
		

							`
		$(".modal-body-artist").append(artist_info);					



	}


}



$(function(){
	$(".js-author").on("click",function(event){
		// console.log("backdrop created by other")  NOT ME
		// event.preventDefault();
		// console.log("clicked");
		var name = $(".js-author").text();
		var artist = new SpotifyApp.Artist(name);

		artist.render();


	});

	$("#js-artist-info-modal").on("hidden.bs.modal",function(event){
		// console.log("backdrop created by other")  Not me
		$(".modal-body-artist").empty()
	})

});