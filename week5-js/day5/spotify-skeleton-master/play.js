SpotifyApp.Play = class {
	// constructor(song_name){
	// 	this.song_name = song_name;
	// }


	// updateTime = function(){

	// 	var current = $('.js-preview').prop('currentTime');
	// 	console.debug('Current time: ' + current);
	
	// }

	update(){
		var current = $('.js-preview').prop('currentTime');
  		$(".js-progress-bar").val(current)
	}

}



$(function(){
	$(".js-play").on("click",function(event){
		var button = $(this);
		if (button.prop("class").match(/playing/)){
		      $(".js-preview").trigger("pause")
		      button.removeClass("playing")
		      console.log('music paused');
		  } else {
		       $(".js-preview").trigger("play");
		      button.addClass("playing")
		      console.log('music playing');
		  }
	})

	// // Have printTime be called when the time is updated
	$('.js-preview').on('timeupdate', function(event){
		var play = new SpotifyApp.Play();

		play.update();

	});

	$(".js-preview").on("ended",function(event){
		$(".js-play").removeClass("playing");
		
	})




})