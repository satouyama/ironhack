var chalk = require("chalk")
var express = require("express")
var kirbyDance = require("kirby-dance")



console.log("Hello")

var kirbies = kirbyDance(10)


console.log(chalk.white.bgBlue(kirbies))




var app = express()  // only offer routes

app.set("view engine","ejs")

app.get("/",function(request,response){   //  request == check for params,query
	response.send("home")


})


app.listen(4567);  // leaves the program port open and listen for requests.  Open the port. 


console.log("Listening on port 4567!!!")

