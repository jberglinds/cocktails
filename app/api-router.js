"use strict";

let express = require('express');
let mysql = require('mysql')

let router = express.Router();

router.get('/test', function(req, res) {
	res.send('It works!');
})

router.get('/spirits', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	connection.connect()
	connection.query('SELECT id, name, abv FROM spirits', function (err, rows, fields) {
		if (err) throw err
		res.send(rows);
	})
	connection.end()
});

module.exports = router;
