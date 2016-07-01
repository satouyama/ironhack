"use strict";

class Viking {
	constructor(name,health,strength){
		this.name = name;
		this.health = health;
		this.strength = strength;


	}

	attack(another_viking){
		var damage1 = this.strength;
		var damage2 = another_viking.strength;
		console.log("--------------attacking-----------------")
		console.log("starting viking " + this.name + "health and strengh is" + this.health + " & " + this.strength );
		console.log("starting saxon health  and strength is" + another_viking.health + " & " + another_viking.strength );

		another_viking.health -= damage1;
		this.health -= damage2;
		console.log( "viking " + this.name + " current health drops to" + this.health);
		console.log( "saxon current health drops to" + another_viking.health +"\n");
	}



}


module.exports = Viking