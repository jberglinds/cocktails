"use strict";

let express = require('express');
let mysql = require('mysql')

let router = express.Router();

/*
* GET /spirits
* Returns all spirits from the db, sorted asc by name
* id, name, abv, type
*/
router.get('/spirits', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT spirits.id, spirits.name, spirits.abv, base_spirits.name AS type
		FROM spirits
		JOIN base_spirits
		ON spirits.type_of_liqour=base_spirits.id
		ORDER BY spirits.name ASC;
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) throw err
		res.send(rows);
	})
	connection.end()
})

/*
* GET /spirit/spiritId
* Returns the spirit that matches spiritId from the db
* name, abv, description, type
*/
router.get('/spirit/:spiritId(\\d+)', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT spirits.name, spirits.abv, spirits.description, base_spirits.name AS type
		FROM spirits
		JOIN base_spirits
		ON spirits.type_of_liqour=base_spirits.id
		WHERE spirits.id=${req.params.spiritId};
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) throw err
		res.send(rows);
	})
	connection.end()
})

/*
* GET /mixers
* Returns all mixers from the db, sorted asc by name
* id, name
*/
router.get('/mixers', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT mixers.id, mixers.name
		FROM mixers
		ORDER BY mixers.name ASC;
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) throw err
		res.send(rows);
	})
	connection.end()
})

/*
* GET /mixer/mixerId
* Returns the mixer that matches mixerId from the db
* name, description
*/
router.get('/mixer/:mixerId(\\d+)', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT mixers.name, mixers.description
		FROM mixers
		WHERE mixers.id=${req.params.mixerId};
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) throw err
		res.send(rows);
	})
	connection.end()
})

/*
* GET /drinks
* Returns all drinks from the db, sorted asc by name
* id, name, image url, json storing which spirits are used
*/
router.get('/drinks', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT drinks.id, drinks.name, drinks.image_url, drinks.spirits_json
		FROM drinks
		ORDER BY drinks.name ASC;
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) throw err
		for (let i = 0; i < rows.length; i++) {
			rows[i].spirits_json = JSON.parse(rows[i].spirits_json);
		}
		res.send(rows);
	})
	connection.end()
})

/*
* GET /drink/drinkId
* Returns the drink that matches drinkId from the db
* name, description, image url, howto-json, spirits-json, mixers-json
*/
router.get('/drink/:drinkId(\\d+)', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT drinks.name, drinks.description, drinks.image_url, drinks.howto_json, drinks.spirits_json, drinks.mixers_json
		FROM drinks
		WHERE drinks.id=${req.params.drinkId};
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) throw err
		res.send(rows);
	})
	connection.end()
});

/*
* GET /base_spirit/base_spiritId
* Returns the base_spirit that matches base_spiritId from the db
* name
*/
router.get('/base_spirit/:base_spiritId(\\d+)', function(req, res) {
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT base_spirits.name
		FROM base_spirits
		WHERE base_spirits.id=${req.params.base_spiritId};
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) throw err
		res.send(rows);
	})
	connection.end()
});

module.exports = router;
