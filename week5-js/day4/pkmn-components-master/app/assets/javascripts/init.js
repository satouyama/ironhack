if (window.PokemonApp === undefined){
	window.PokemonApp = {};   // checking if already there is one

}

PokemonApp.init = function(){
	console.log("PokemonApp App ONLINE");
}

$(document).on("ready",function(){
	PokemonApp.init();
})
