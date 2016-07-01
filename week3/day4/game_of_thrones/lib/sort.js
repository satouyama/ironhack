
function sort(episodes_array){

	episodes_array.sort(function(a,b){
		return a.episode_number - b.episode_number;
	});

	// return episodes_array;
}


module.exports = sort

