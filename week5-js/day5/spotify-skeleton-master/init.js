if (window.SpotifyApp === undefined){
	window.SpotifyApp = {};   // checking if already there is one

}

SpotifyApp.init = function(){
	console.log("SpotifyApp App ONLINE");
}

$(document).on("ready",function(){
	SpotifyApp.init();
})
