"use strict";

var read = require('read');
var fs = require("fs");


class User {
	constructor(name,points,quiz){
		this.name = name;
		this.points = points;
		this.quiz = quiz;
		this.data;
	}

	startQuiz(){
		this.loadData();


		var options = {
			prompt: "new user?  type yes or no"
		}

		var boundDirect = this.direct.bind(this);
		read(options,boundDirect);
	}

	loadData(){
		var that = this;
		var haha = this;
		var boundSendData = this.sendData.bind(this);
		fs.readFile("lib/data.txt",function(error,saved_data){
			if (error){
				console.log("\n new game no old data");
			}else{
				try {
					that.data = JSON.parse(saved_data);
					// console.log("-----------data after json-----------")
					// console.log(that.data)
					boundSendData();
					// console.log("---------------rechecking in read-----------")
					// console.log(haha.data);
				}catch(e){
					console.log("\n no old data")
				}

				// console.log("--------------receiving data--------------" + that.data)
			}
		})


	}

	sendData(){
		// console.log("---------------------data before sending---------------")
		// console.log(this.data)

		var old_user = this.name;

		this.quiz.saved_data = this.data;
		this.quiz.questions_set = this.data[old_user][0].questions_set;
		this.quiz.question_index = this.data[old_user][0].question_index;
		this.quiz.points = this.data[old_user][0].points;
		this.quiz.award_points = this.data[old_user][0].award_points;
		this.quiz.bonus_index = this.data[old_user][0].bonus_index;

		console.log("-------------sending data-----------------------")
		console.log(this.quiz)

		this.quiz.ask();


	}

	direct(err, answer) {
		if (answer.toUpperCase() === "YES"){
			this.register();
		}else if(answer.toUpperCase() === "NO"){
			this.login();
		}else{
			console.log(" \n --------------------------")
			console.log("valid input pls")
		}
	
	}

	register(){
		var options = {
			prompt: "create your username: "
		}
		var boundSaveUsername = this.saveUsername.bind(this);
		read(options,boundSaveUsername);

	}


	login(){
		var boundCheckUser = this.check_user.bind(this);

		var options = {
			prompt: "What's your username?"
		}

		read(options,boundCheckUser);

	}

	saveUsername(err,name){
		this.name = name;
		this.quiz.setPlayer(this.name);
		this.quiz.ask();
	}

	

	check_user(err,name){



		if (name in this.data ){
			console.log(" \n --------------------log in-----------")
			console.log("you have successfully logged in!!")
			this.name = name;
			this.loadData();

		}else{
			console.log(" \n --------------------log in-----------")
			console.log("records not found pls try again or register:")

			var options = {
				prompt: "register or try?  input register or try"
			}

			var boundReroute = this.reroute.bind(this)
			read(options,boundReroute);
		}
	}

	reroute(err,answer){
		if (answer.toUpperCase() === "REGISTER"){
			this.register();
		}else{
			this.login();
		}

	}


}


module.exports = User;