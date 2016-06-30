"use strict";


var fs = require("fs");

fs.readFile("lib/main.txt","utf8",function(error,fileContent){
	console.log(fileContent);
})


var Car = require("./lib/car.js")

var car1 = new Car("Honda","bububu")

car1.makeNoise()