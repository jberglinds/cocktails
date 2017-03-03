"use strict";

let express = require('express');
let http = require('http');
// let socketio = require('socket.io');

let port = 8080;

let app = express();
app.use(express.static(__dirname + '/../public'));

let httpServer = http.Server(app);

let router = require('./api-router.js');
app.use('/api', router);

httpServer.listen(port, function () {
  console.log("Server listening on port", port);
});
