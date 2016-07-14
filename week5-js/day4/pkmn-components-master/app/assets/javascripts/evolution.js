PokemonApp.Evolution = class {
	constructor (id){
		this.id = id;

	}


	preload(){
		var that = this;
		// console.log("preload ran")
		$.ajax({
			type: "GET",
			url: "/api/pokemon/" + this.id,

			success: function(data,text,xhr){

				var evolutions = data.evolutions;
				// PokemonApp.getImage(evolutions);

				// console.log(evolutions.length)
				if (evolutions.length != 0){
					for (var counter=0;counter<evolutions.length;counter++){
						// console.log(counter + "time run")

						var resource_uri = evolutions[counter].resource_uri;
						// console.log(evolutions[counter])

						that.getEvlovedPokemon(resource_uri,evolutions[counter],counter)

					}	

				}else {
					$(".js-evolution-modal").find(".modal-body").text("This one is a looser. can't evolved. ")
				}

				// $(".js-evolution-modal").modal("show")


			},
			error: PokemonApp.handleError


		})

	}



	getEvlovedPokemon(resource_uri,evolution_set,counter){
		// var image_url = evolutions[counter].resource_uri)
		var that = this;
		$.ajax({
			type:'GET',
			url: resource_uri,
			success:function(data){
				console.log(data)
				if (data.sprites.length != 0){
					var resource_uri = data.sprites[0].resource_uri;
				// console.log("image object retrieved ")
				}else{
					var resource_uri = "#"
				}
				that.getEvolvedImage(resource_uri,evolution_set)
				
				

			},
			error: PokemonApp.handleError

		})
	}

	getEvolvedImage(resource_uri,evolution_set){
		var that = this;

		$.ajax({
		type:'GET',
		url: resource_uri,
		success:function(data){
			var image_url = data.image;
			console.log(image_url)
			// console.log("afterwards " + image_url)
			that.create_evolutions(image_url,evolution_set)

		},
		error: PokemonApp.handleError

		})


	}



	create_evolutions(image_url,evolution_set){
		// for (var counter = 0; counter< (evolutions.length);counter++){

			// var image_url = PokemonApp.getImage(evolutions[counter].resource_uri)

			if (!image_url){
				image_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png"
			}else{
				image_url = "http://pokeapi.co"+image_url
			}

			var evolution_element = `	<h3> Evolution Type</h3>
							          <dt>Level</dt>
							          <dd class = "js-pkmn-level">${evolution_set.level}</dd>

							          <dt >Method</dt>
							          <dd class = "js-pkmn-method">${evolution_set.method}</dd>

							          <dt>To:</dt>
							          <dd class = "js-pkmn-sp_to">${evolution_set.to}</dd>

							          <img src ="${image_url}">
									`

			$(".js-evolution-modal").find(".modal-body").append(evolution_element)
	}

		
}








$(document).on("ready",function(){
	// console.log("WHYYYYYYYYzzzz")
	$(".js-pokemon-modal").on("shown.bs.modal",function(event){
		// console.log(event)
		$(".js-evolution-modal").find(".modal-body").empty();
		var id = $(".js-pkmn-number").text();
		var pokemon = new PokemonApp.Evolution(id)

		// console.log("shown is <---------------------------->	")

		pokemon.preload()

		

	})

	$(".js-pokemon-modal").on("click",function(event){


	})


})