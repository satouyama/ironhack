"use strict";

var Raid = require("./lib/raid.js");
var Viking = require("./lib/viking.js");
var Pit = require("./lib/pit.js");
var Saxon = require("./lib/saxon.js");



var pitFight1 = new Pit()


var viking1 = new Viking("john",10,4);
var viking2 = new Viking("dan",30,2);
var viking3 = new Viking("haha",100,40);
var viking4 = new Viking("hoho",10,4);
var viking5 = new Viking("hehe",15,3);
var viking6 = new Viking("hihi",10,6);

var vikingTeams = [viking1,viking2,viking3,viking4,viking5,viking6];



var saxon1 = new Saxon();
var saxon2 = new Saxon();
var saxon3 = new Saxon();
var saxon4 = new Saxon();
var saxon5 = new Saxon();
var saxon6 = new Saxon();

var saxonTeams = [saxon1,saxon2,saxon3,saxon4,saxon5,saxon6];


var raid1 = new Raid();

raid1.startRaid(vikingTeams,saxonTeams);






// pitFight1.startFight(viking1,viking2);
