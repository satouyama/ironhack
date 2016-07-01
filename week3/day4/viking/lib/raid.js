"use strict";

class Raid {
	constructor(){
		this.turns = Math.floor((Math.random() * 3)+100);
	}

	startRaid(attacker,defender){

		this.attacker = attacker;
		this.defender = defender;

		this.moraleBoost();

		this.engage();
	}


	moraleBoost(){
		console.log(" \n hulululululululullululululu!!!");
		console.log("Kill them all!!! \n");
	}



	selectMember(attacker,defender){
		var length = this.attacker.length > this.defender.length ? this.defender.length : this.attacker.length;

		var randomIndex = Math.floor(Math.random()* length);

		console.log("----------------------------index -----------------------");
		console.log(randomIndex + "\n");

		var selected_attacker = this.attacker[randomIndex];
		var selected_defender = this.defender[randomIndex];

		return [selected_attacker,selected_defender];
	}

	engage(){
		while (this.turns >0){

			var array = this.selectMember(this.attacker,this.defender);
			var attacker = array[0];
			var defender = array[1]; 

			attacker.attack(defender);

			// if ( this.lifeMonitor(attacker,defender) instanceof Viking){   /// try to keep this dry?    Accessing another class name not working? 
			if (this.lifeMonitor(attacker,defender).constructor.name == "Viking"){
				var deadMember = this.lifeMonitor(attacker,defender);
				var index = this.attacker.indexOf(deadMember);
				this.attacker.splice(index,1);
				console.log(" \n ------------------------------------death just happened----------------------");
				console.log("viking " + deadMember.name + " just died" + "\n"  );


			}else if (this.lifeMonitor(attacker,defender).constructor.name == "Saxon"){
				var deadMember = this.lifeMonitor(attacker,defender);
				var index = this.defender.indexOf(deadMember);
				console.log("------------splicing index -------------------" + index + " and before splicing length "+ this.defender.length);
				var gone = this.defender.splice(index,1);
				gone.forEach(function(element){ console.log("my health should be 0 ? == " + element.health)})

				console.log(" \n ------------------------------------death just happened----------------------" + gone);
				console.log("saxon anonymous just died" + "\n"  );
				console.log("saxon current numbero of people" + this.defender.length);
			}

			if (this.checkMember(this.attacker)){
				console.log(" \n -------------------------the war has ended with a win--------------------------");
				console.log("------------------------viking has lost and saxon still has " + this.attacker.length + " many people \n");
				return;
			}else if (this.checkMember(this.defender)){
				console.log(" \n -------------------------the war has ended with a win--------------------------");
				console.log("------------------------saxon has lost and viking still has " + this.attacker.length + " many people \n");
				return;
			}

			this.turns --;

		}
		
		if(this.attacker.length > this.defender.length){
			console.log("------------------------the war has ended with a win from Viking ------------------");
			console.log("------------------------saxon has " + this.defender.length + " many people and viking has " + this.attacker.length +" many people");
		}else if (this.attacker.length < this.defender.length){
			console.log("------------------------the war has ended with a win from Saxons ------------------");
			console.log("------------------------saxon has " + this.defender.length + " many people and viking has " + this.attacker.length +" many people");
		}else if (this.attacker.length === this.defender.length){
			console.log("------------------------the war has ended with a tie ------------------");
			console.log("------------------------saxon has " + this.defender.length + " many people and viking has " + this.attacker.length +" many people");
		}

		





	}

	lifeMonitor(attacker,defender){
		if (attacker.health <= 0){
			return attacker;
		} else if (defender.health <= 0){
			return defender;
		}else {
			return "";
		}

	}

	checkMember(groups){
		if (groups.length === 0){
			return true;
		}
	}



}






module.exports = Raid