var numbers = "80:70:90:100";

function averageColon(string){
	var newArray = string.split(/\D/);
	// console.log(newArray);
	var length = newArray.length;

	var sum = newArray.reduce(function(sum,current){
		
		current = parseInt(current);
		sum = parseInt(sum);
		// console.log(typeof(current));
		// console.log("results this round" + (sum+current));
		
		return sum + current;

	})

	// console.log("final sum" +sum);
	return sum/length;

}


console.log(averageColon(numbers));