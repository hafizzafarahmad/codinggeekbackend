var express = require("express");
var bodyParser = require("body-parser");
var events = require("events");
var path = require("path");
var hbs = require("hbs");
var app = express();
var routes = require("./routes_mobile");
var routes_web = require("./routes_web");
var emitter = require("events");

//Utils
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "hbs"); //View engine yang digunaka hbs
app.use(express.static(__dirname + "/public/"));
app.use(bodyParser.json()); //Dapat menggunakan json params
app.use(bodyParser.urlencoded({ extended: true })); //Dapat menggunakan url params
events.EventEmitter.defaultMaxListeners = 50; //Fix Memory Leaked

routes(app);
routes_web(app);

// Running on PORT 5000
app.listen(5000, () => {
  console.log("Running on Port 5000");
});
