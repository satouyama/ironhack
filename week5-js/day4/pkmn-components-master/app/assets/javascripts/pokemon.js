// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// var PokemonApp = PokemonApp || {}

// class PokemonApp.Pokemon {
PokemonApp.Pokemon = class {
	constructor (pokemonUri){
		this.id = PokemonApp.idFromUri( pokemonUri);

	}

	render (){
		console.log("Rendering pokemon: #" + this.id);
		// var start = new Date().getTime();

		// var end;
		// var that = this.id;
		$.ajax({
			type: "GET",
			url: "/api/pokemon/" + this.id,

			success: function(response){
				// console.log("Pokemon info:");
				// console.log("name: " + response.name);
				// console.log("number: " + response.pkdx_id);
				// console.log("height: " + response.height);
				// console.log("weight: " + response.weight);
				// var resource = PokemonApp.getImageLink();
				PokemonApp.getImage(response.sprites[0].resource_uri);

				var length = response.descriptions.length
				PokemonApp.getDescription(response.descriptions[length-1].resource_uri);

				// console.log(response.descriptions)

				// $(".js-pokemon-current-modal").attr("data-uri",that)

				$(".js-pkmn-name").text(response.name);
				$(".js-pkmn-number").text(response.pkdx_id);
				$(".js-pkmn-height").text(response.height);
				$(".js-pkmn-weight").text(response.weight);
				$(".js-pkmn-hp").text(response.hp);
				$(".js-pkmn-attack").text(response.attack);
				$(".js-pkmn-defense").text(response.defense);
				$(".js-pkmn-sp_atk").text(response.sp_atk);
				$(".js-pkmn-sp_def").text(response.sp_def);
				$(".js-pkmn-speed").text(response.speed);
				// $(".js-pkmn-type").text(response.types[0].name);


				// end = new Date().getTime();
				console.log(response)

				// console.log("Time used" + (end-start))
				$(".js-pokemon-modal").modal("show")
				
			},
			error: PokemonApp.handleError


		})


	}


}

PokemonApp.handleError = function (){
	console.log("error")
}


PokemonApp.getImage = function(resource_uri){

	$.ajax({
		type:'GET',
		url: resource_uri,
		success:function(data){
			var image_url = data.image;
			console.log("afterwards " + image_url)
			$(".js-pkmn-image").prop("src","http://pokeapi.co" + image_url)

		},
		error: PokemonApp.handleError

	})

}

PokemonApp.getDescription = function(resource_uri){
	$.ajax({
		type:'GET',
		url: resource_uri,
		success:function(data){
			// console.log(data)
			// var image_url = data.image;
			// $(".js-pkmn-image").prop("src","http://pokeapi.co" + image_url)
			var description = data.description;
			$(".js-pkmn-description").text(description)

		},
		error: PokemonApp.handleError

	})

}





PokemonApp.idFromUri = function(pokemonUri){
	var uriSegments = pokemonUri.split("/");  
	var secondLast = uriSegments.length - 2
	return uriSegments[secondLast];


}



$(document).on("ready",function(){
	$(".js-show-pokemon").on("click",function(event){

		var $button = $(event.currentTarget);
		var pokemonUri = $button.data("pokemon-uri")
		var pokemon = new PokemonApp.Pokemon(pokemonUri);

		pokemon.render();
	})
})