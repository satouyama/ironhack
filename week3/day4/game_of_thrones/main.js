var fs = require('fs');

var printStar = require("./lib/printStar.js");
var sort = require("./lib/sort.js");
var search = require("./lib/search.js");

function fileActions(episodes){ 

    sort(episodes);

    episodes.forEach(function(episodes){



    	console.log("Title:" + episodes.title + "  " + "Episode #:" + episodes.episode_number);
    	console.log(episodes.description);
    	console.log("Rating: " + episodes.rating +" "  + printStar(episodes.rating) + "\n");

    });


}

function fileFilter(err, file){
	if (err) {
        throw err;
    }

    var episodes = JSON.parse(file);


    console.log("JON SNOW APPEARS IN:" + search(episodes))

    function goodRatingFilter(episodes){
    	return episodes.rating >= 8.5;
    }

    var episodes_filtered = episodes.filter(goodRatingFilter);


    fileActions(episodes_filtered);

}



fs.readFile("./lib/GoTEpisodes.json", 'utf8', fileFilter);