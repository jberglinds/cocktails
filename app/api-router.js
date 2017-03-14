"use strict";

let express = require('express');
let mysql = require('mysql')

let router = express.Router();

/*
* GET /available-spirits
* Returns all spirits and base_spirits from the db
* id, name, abv, type
*/
router.get('/available-spirits', function(req, res) {
    console.log(GET_print(req.path));
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
        (SELECT base_spirits.id, base_spirits.name
        FROM base_spirits)
        UNION
	    (SELECT spirits.id, spirits.name
		FROM spirits);
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
		    res.send(rows);
        }
	})
	connection.end()
})

/*
* GET /spirits
* Returns all spirits from the db, sorted asc by name
* id, name, abv, type
*/
router.get('/spirits', function(req, res) {
    console.log(GET_print(req.path));
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
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
		    res.send(rows);
        }
	})
	connection.end()
})

/*
* GET /spirit/spiritId
* Returns the spirit that matches spiritId from the db
* name, abv, description, type
*/
router.get('/spirit/:spiritId(\\d+)', function(req, res) {
    console.log(GET_print(req.path));
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
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
		    res.send(rows[0]);
        }
	})
	connection.end()
})

/*
* GET /mixers
* Returns all mixers from the db, sorted asc by name
* id, name
*/
router.get('/mixers', function(req, res) {
    console.log(GET_print(req.path));
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT mixers.id, mixers.name
		FROM mixers
		ORDER BY mixers.name ASC;
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
		    res.send(rows);
        }
	})
	connection.end()
})

/*
* GET /mixer/mixerId
* Returns the mixer that matches mixerId from the db
* name, description
*/
router.get('/mixer/:mixerId(\\d+)', function(req, res) {
    console.log(GET_print(req.path));
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT mixers.name, mixers.description
		FROM mixers
		WHERE mixers.id=${req.params.mixerId};
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
		    res.send(rows[0]);
        }
	})
	connection.end()
})

/*
* GET /drinks
* Returns all drinks from the db, sorted asc by name
* id, name, image url, json storing which spirits are used
*/
router.get('/drinks', function(req, res) {
    console.log(GET_print(req.path));
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT drinks.id, drinks.name, drinks.image_url, drinks.spirits_json
		FROM drinks
		ORDER BY drinks.name ASC;
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
            for (let i = 0; i < rows.length; i++) {
    			rows[i].spirits_json = JSON.parse(rows[i].spirits_json);
    		}
    		res.send(rows);
        }
	})
	connection.end()
})

/*
* GET /drink/drinkId
* Returns the drink that matches drinkId from the db
* name, description, image url, howto-json, spirits-json, mixers-json
*/
router.get('/drink/:drinkId(\\d+)', function(req, res) {
    console.log(GET_print(req.path));
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT drinks.name, drinks.description, drinks.image_url, drinks.howto_json, drinks.spirits_json, drinks.mixers_json
		FROM drinks
		WHERE drinks.id=${req.params.drinkId};
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
    		rows[0].howto_json = JSON.parse(rows[0].howto_json);
    		rows[0].spirits_json = JSON.parse(rows[0].spirits_json);
    		rows[0].mixers_json = JSON.parse(rows[0].mixers_json);
    		res.send(rows[0]);
        }
    })
	connection.end()
})

/*
* GET /base_spirit/base_spiritId
* Returns the base_spirit that matches base_spiritId from the db
* name
*/
router.get('/base_spirit/:base_spiritId(\\d+)', function(req, res) {
    console.log(GET_print(req.path));
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT base_spirits.name
		FROM base_spirits
		WHERE base_spirits.id=${req.params.base_spiritId};
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
            res.send(rows[0]);
        }
	})
	connection.end()
})

/*
* GET /events
* Returns all events from the db, sorted asc by name
* id, name, start_date
*/
router.get('/events', function(req, res) {
    console.log(GET_print(req.path));
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT events.id, events.name, events.start_date
		FROM events
		WHERE events.start_date + INTERVAL 1 DAY > NOW();
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
        if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
            res.send(rows);
        }
	})
	connection.end()
})

/*
* GET /event/:eventId/:passphrase
* Returns the event that matches the given id only if the passed passphrase is valid
* id, name, description, passphrase, start_date
*/
router.get('/event/:eventId/:passphrase', function(req, res) {
    console.log(GET_print(req.path));
	let connection = mysql.createConnection(require('../database/database_credentials.json'));
	let query = `
		SELECT events.id, events.name, events.description, events.passphrase, events.start_date
		FROM events
		WHERE events.id=${req.params.eventId}
        AND events.passphrase="${req.params.passphrase}";
	`
	connection.connect()
	connection.query(query, function (err, rows, fields) {
		if (err) {
            res.sendStatus(500);
            console.log(err_print(req.path));
            console.log(err);
        } else {
            res.send(rows[0]);
        }
	})
	connection.end()
});

// Format a pretty print notification for receival of GET requests
function GET_print(path) {
    return '\x1b[32m\x1b[1mGET\x1b[0m request to \x1b[4m' + path + '\x1b[0m'
}

// Format a pretty print notification for receival of POST requests
function POST_print(path) {
    return '\x1b[33m\x1b[1mPOST\x1b[0m request to \x1b[4m' + path + '\x1b[0m'
}

// Format a pretty print error message
function err_print(path) {
    return '\x1b[31m\x1b[1mERROR\x1b[0m in request to \x1b[4m' + path + '\x1b[0m';
}

module.exports = router;
