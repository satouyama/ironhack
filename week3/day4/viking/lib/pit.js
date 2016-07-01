"use strict";


class Pit {
	constructor(){
		this.turns = 5;
	}

	getTurns(){
		return this.turns;
	}
	reduceTurns(){
		this.turns -=1;
	}

	moraleBoost(){
		console.log("hulululululululullululululu!!!");
		console.log("Kill them all!!!");
	}

	startFight(viking1,viking2){

		while (this.getTurns() >0){
			this.reduceTurns();
			viking1.attack(viking2);
			if (this.lifeMonitor(viking1,viking2) === false){
				break;
			}

		}

	}

	lifeMonitor(viking1,viking2){
		if (viking1.health <=0 || viking2.helath<= 0){
			
			console.log("the fight has ended because of peace!")
			return false
		}
	}

}



module.exports = Pit