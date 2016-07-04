"use strict";

var read = require('read');
var fs = require("fs");

class Quiz {

	constructor(questions_set){
		this.questions_set = questions_set;
		this.question_index = 0;
		this.points = 0;
		this.bonus_index = this.generate_bonus_index();
		this.award_points = 1;
		this.saved_data = 0;
	}

	generate_bonus_index(){
		var bonus_index = Math.floor(Math.random() * 4.9);
		return bonus_index;
	}



	adjust_points_value(){
		if (this.question_index === this.bonus_index){
			console.log("--------------jack pot!-------------")
			console.log("bonus question is worth than 2 points! or you can loose 2 points too.")
			this.award_points = 2;
		}else{
			this.award_points = 1;
		}
	}

	setPlayer(player_name){
		this.player_name = player_name;
	}

	ask(){

		console.log("----------------current game data--------------------")
		console.log(this.question_index)


		if (this.check()){
			console.log("------------congratz!--------------")
			console.log("you have answered all the qustions!")
			return;
		}

		// console.log("------------check bonus_index-------" + this.bonus_index)
		// console.log("--------------check question_index" + this.question_index)
	
		this.adjust_points_value();
		


		// console.log("--------------index is ----------");
		// console.log(this.questions_set);
		// console.log(this.question_index);


		var options = {
			prompt: (this.questions_set[this.question_index].question)
		}
		var boundEvaluate = this.evaluate.bind(this);
		read(options,boundEvaluate);
		console.log("--------------waiting for your answers-----------");
		// var i = 4;
		// while (i >= 0){
		// 	var current_question = this.questions_set[i];
		// 	// console.log("--------------index is ----------");
		// 	// console.log(i);
		// 	var options = {
		// 		prompt: current_question.question
		// 	}
		// 	read(options,this.displayName);
		// 	i -- ;
		// }

	}

	evaluate(err,answer){
		// console.log("------------------current questions set is---------------")
		// console.log(this);
		if (answer.toUpperCase() === this.questions_set[this.question_index].answer.toUpperCase()){
			// this.questions_set.splice(this.question_index,1);
			this.points += this.award_points;
			this.question_index ++ ;
			console.log("-------------------------yeah!-------------------------")
			console.log("you have got the right answer. moving on to next question")
			console.log("currently you have " + this.points + " points \n")
			this.ask();
		}else if (answer.toUpperCase() === "EXIT"){
			console.log("---------------oops-------------");
			console.log("you have decided to exit the game looooser")

		}else if (answer.toUpperCase()=== "SAVE"){
			console.log(" ---------------------what---------------")
			console.log("you have decided to save the game and come back later looooser");
			this.save();

		}else{
			this.points -= this.award_points;
			console.log("--------------nay--------------");
			console.log("pls try again");
			console.log("currently you have " + this.points + " points \n ")

			this.ask()

		}
	}

	check(){
		if (this.question_index === 5){
			return true;
		}
	}


	save(){
		
		// console.log("the current player name is " + this.player_name);

		//  console.log("the current player name is " + self.player_name);
		var new_data = {};
		console.log("-------------chechking old -data----------")
		console.log(this.saved_data);
		if (this.saved_data === 0){
			

			new_data[this.player_name] = [];
			console.log("----------the current status----------") 
			// console.log(this);

			new_data[this.player_name].push(this);

			console.log(new_data[this.player_name]);

		}else{
			// worst data manip ever


			var cloneOfOldData = JSON.parse(JSON.stringify(this.saved_data));

			for (var key in cloneOfOldData){
				if (cloneOfOldData.hasOwnProperty(key)) {
    				new_data[key] = cloneOfOldData[key];
 				 }
			}
			
			delete this.saved_data;

			var key_for_this_round = this.player_name;
			new_data[key_for_this_round] = this;

			
			console.log("------------------checking new data--------------");
			console.log(new_data)
			new_data[this.player_name] = [];
			new_data[this.player_name].push(this);
		}
		
		// console.log(data);
		var toBeSaved = JSON.stringify(new_data,null,4)
		console.log(toBeSaved);

		fs.writeFile("lib/data.txt",toBeSaved,(err)=>{
			if (err) throw err;
		});

	}
	// displayName (err, name){
 //    	console.log("Your name is: " + name)
	// }



}


module.exports = Quiz;