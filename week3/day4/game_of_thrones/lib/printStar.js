
function printStar(rating){
	var rounded = Math.floor(rating)
	var repeatStar = ("*".repeat(rounded));

	return repeatStar;
};

module.exports = printStar