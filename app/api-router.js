"use strict";

let express = require('express');
let mysql = require('mysql')

let router = express.Router();

router.get('/test', function(req, res) {
	res.send('It works!');
})

router.get('/spirits', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT spirits.id, spirits.name, spirits.abv, base_spirits.name AS type
		FROM spirits
		JOIN base_spirits
		ON spirits.type_of_liqour=base_spirits.id;
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) throw err
		res.send(rows);
	})
	connection.end()
});

module.exports = router;
