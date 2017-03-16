"use strict";

let mysql = require('mysql');
let database_credentials = require('../../database/database_credentials.json');

let sync = require('synchronize');
let fiber = sync.fiber;
let wait = sync.await;
let defer = sync.defer;

/*
* API end-points for GET requests
*/

module.exports = function(router) {

    /*
    * Passphrase authorization for all GET requests to /events/:eventId
    */
    router.get('/events/:eventId(\\d+)', function(req, res, next) {
        let connection = mysql.createConnection(database_credentials);
        let auth_query = `
            SELECT passphrase
            FROM events
            WHERE events.id=${req.params.eventId};
        `;
        connection.connect();
        connection.query(auth_query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
                // Check passphrase
                if (req.query.passphrase != undefined && req.query.passphrase === rows[0].passphrase) {
                    next();
                } else {
                    res.sendStatus(401);
                }
            }
        });
        connection.end();
    });

    /*
    * GET /available-spirits
    * Returns all spirits and base_spirits from the db
    * id, name, abv, type
    */
    router.get('/available-spirits', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
            (SELECT base_spirits.id, base_spirits.name
            FROM base_spirits)
            UNION
    	    (SELECT spirits.id, spirits.name
    		FROM spirits);
    	`;
    	connection.connect();
    	connection.query(query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
    		    res.send(rows);
            }
    	});
    	connection.end();
    });

    /*
    * GET /spirits
    * Returns all spirits from the db, sorted asc by name
    * id, name, abv, type
    */
    router.get('/spirits', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT spirits.id, spirits.name, spirits.abv, base_spirits.name AS type
    		FROM spirits
    		JOIN base_spirits
    		ON spirits.type_of_liqour=base_spirits.id
    		ORDER BY spirits.name ASC;
    	`;
    	connection.connect();
    	connection.query(query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
    		    res.send(rows);
            }
    	});
    	connection.end();
    });

    /*
    * GET /spirit/spiritId
    * Returns the spirit that matches spiritId from the db
    * name, abv, description, type
    */
    router.get('/spirits/:spiritId(\\d+)', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT spirits.name, spirits.abv, spirits.description, base_spirits.name AS type
    		FROM spirits
    		JOIN base_spirits
    		ON spirits.type_of_liqour=base_spirits.id
    		WHERE spirits.id=${req.params.spiritId};
    	`;
    	connection.connect();
    	connection.query(query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
    		    res.send(rows[0]);
            }
    	});
    	connection.end();
    });

    /*
    * GET /mixers
    * Returns all mixers from the db, sorted asc by name
    * id, name
    */
    router.get('/mixers', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT mixers.id, mixers.name
    		FROM mixers
    		ORDER BY mixers.name ASC;
    	`;
    	connection.connect();
    	connection.query(query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
    		    res.send(rows);
            }
    	});
    	connection.end();
    });

    /*
    * GET /mixer/mixerId
    * Returns the mixer that matches mixerId from the db
    * name, description
    */
    router.get('/mixers/:mixerId(\\d+)', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT mixers.name, mixers.description
    		FROM mixers
    		WHERE mixers.id=${req.params.mixerId};
    	`;
    	connection.connect();
    	connection.query(query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
    		    res.send(rows[0]);
            }
    	});
    	connection.end();
    });

    /*
    * GET /drinks
    * Returns all drinks from the db, sorted asc by name
    * id, name, image url, json storing which spirits are used
    */
    router.get('/drinks', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT drinks.id, drinks.name, drinks.image_url, drinks.spirits_json
    		FROM drinks
    		ORDER BY drinks.name ASC;
    	`;
    	connection.connect();
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
    	});
    	connection.end();
    });

    /*
    * GET /drink/drinkId
    * Returns the drink that matches drinkId from the db
    * name, description, image url, howto-json, spirits-json, mixers-json
    */
    router.get('/drinks/:drinkId(\\d+)', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT drinks.name, drinks.description, drinks.image_url, drinks.howto_json, drinks.spirits_json, drinks.mixers_json
    		FROM drinks
    		WHERE drinks.id=${req.params.drinkId};
    	`;
    	connection.connect();
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
        });
    	connection.end();
    });

    /*
    * GET /base_spirit/base_spiritId
    * Returns the base_spirit that matches base_spiritId from the db
    * name
    */
    router.get('/base_spirit/:base_spiritId(\\d+)', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT base_spirits.name
    		FROM base_spirits
    		WHERE base_spirits.id=${req.params.base_spiritId};
    	`;
    	connection.connect();
    	connection.query(query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
                res.send(rows[0]);
            }
    	});
    	connection.end();
    });

    /*
    * GET /events
    * Returns all events from the db, sorted asc by name
    * id, name, start_date
    */
    router.get('/events', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT events.id, events.name, events.start_date
    		FROM events
    		WHERE events.start_date + INTERVAL 1 DAY > NOW();
    	`;
    	connection.connect();
    	connection.query(query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
                res.send(rows);
            }
    	});
    	connection.end();
    });

    /*
    * GET /events/:eventId
    * Returns the event that matches the given id
    * id, name, description, passphrase, start_date
    */
    router.get('/events/:eventId(\\d+)', function(req, res) {
    	let connection = mysql.createConnection(database_credentials);
    	let query = `
    		SELECT events.id, events.name, events.description, events.passphrase, events.start_date
    		FROM events
    		WHERE events.id=${req.params.eventId};
    	`;
    	connection.connect();
    	connection.query(query, function (err, rows, fields) {
    		if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
                res.send(rows[0]);
            }
    	});
    	connection.end();
    });

    /*
    * GET /events/:eventId/spirits
    * Returns all spirits listed in the inventory for the passed event, sorted asc by name
    * id, name, abv, type
    */
    router.get('/events/:eventId/spirits', function(req, res) {
        let connection = mysql.createConnection(database_credentials);
        let data_query = `
            SELECT inventory_spirits.spirit_id, spirits.name
            FROM inventory_spirits
            JOIN spirits
            ON spirits.id=inventory_spirits.spirit_id
            WHERE inventory_spirits.event_id=${req.params.eventId};
        `;
        connection.connect();
        connection.query(data_query, function (data_err, data_rows, data_fields) {
            if (data_err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(data_err);
            } else {
                res.send(data_rows);
            }
        });
        connection.end();
    });

    /*
    * GET /events/:eventId/mixers
    * Returns all mixers listed in the inventory for the passed event, sorted asc by name
    * id, name
    */
    router.get('/events/:eventId/mixers', function(req, res) {
        let connection = mysql.createConnection(database_credentials);
        let query = `
             SELECT inventory_mixers.mixer_id, mixers.name
             FROM inventory_mixers
             JOIN mixers
             ON mixers.id=inventory_mixers.mixer_id
             WHERE inventory_mixers.event_id=${req.params.eventId};
        `;
        connection.connect();
        connection.query(query, function (err, rows, fields) {
            if (err) {
            res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {
                res.send(rows);
            }
        });
        connection.end();
    });

    /*
    * GET /events/:eventId/drinklist
    * Returns the drinklist associated with the event, if there is one
    * id
    */
    router.get('/events/:eventId(\\d+)/drinklist', function(req, res) {
        let connection = mysql.createConnection(database_credentials);
        let query = `
             SELECT event_drinklist.drinks_json
             FROM event_drinklist
             WHERE event_drinklist.event_id=${req.params.eventId};
        `;
        connection.connect();
        connection.query(query, function (err, rows, fields) {
            if (err) {
                res.sendStatus(500);
                console.log(err_print(req.path));
                console.log(err);
            } else {

                fiber(function(){
                    let drinks = [];
                    for (let i = 0; i < rows.length; i++) {
                        drinks.push(JSON.parse(rows[i].drinks_json)[0].id);
                    }

                    if (drinks.length > 0) {
                        wait((function(drinks, callback){
                            let connection = mysql.createConnection(database_credentials);
                        	let query = `
                        		SELECT drinks.id, drinks.name, drinks.image_url, drinks.spirits_json
                        		FROM drinks
                                WHERE drinks.id=${drinks[0]}
                            `;

                            for (let i = 1; i < drinks.length; i++) {
                                query += ` OR drinks.id=${drinks[i]}`;
                            }

                            query += `
                        		ORDER BY drinks.name ASC;
                        	`;
                            console.log(query);
                        	connection.connect();
                        	connection.query(query, function (err, rows, fields) {
                                if (err) {
                                    res.sendStatus(500);
                                    console.log(err_print(req.path));
                                    console.log(err);
                                } else {
                            		res.send(rows);
                                }
                                callback();
                        	});
                        	connection.end();
                        })(drinks, defer()));
                    } else {
                        res.json([]);
                    }
                });

            }
        });
        connection.end();
    });

};

// Format a pretty print error message
function err_print(path) {
    return '\x1b[31m\x1b[1mERROR\x1b[0m in \x1b[1mGET\x1b[0m request to \x1b[4m' + path + '\x1b[0m';
}
