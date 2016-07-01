"use strict";

var Question = require("./lib/question.js");
var Quiz = require("./lib/quiz.js");
var read = require('read');
var User = require("./lib/user.js");


var question1 = new Question("Which metal is heavier, silver or gold?","gold",1);
var question2 = new Question(" How many legs do butterflies have?","six",2);
var question3 = new Question("Which is the country with the most people?","china",3);
var question4 = new Question(" Which state is the biggest in the US?","alaska",4);
var question5 = new Question("Which country has the largest area of land?","russia",5);

var questions_set = [question1,question2,question3,question4,question5];


var quiz1 = new Quiz(questions_set);

var user = new User("anonymous",0,quiz1);


user.startQuiz();

// var options = {
//     prompt: question1.question
    


