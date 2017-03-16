"use strict";

let mysql = require('mysql');
let database_credentials = require('../../database/database_credentials.json');
let socket_controller = require('../socket-controller.js');

let sync = require('synchronize');
let fiber = sync.fiber;
let wait = sync.await;
let defer = sync.defer;

/*
* API end-points for POST requests
*/

module.exports = function(router) {

    /*
    * Passphrase authorization for all POST requests to /events/:eventId
    */
    router.post('/events/:eventId/*', function(req, res, next) {
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
                if (req.body != undefined) {
                    if (req.body.passphrase != undefined && req.body.passphrase === rows[0].passphrase) {
                        next();
                    } else {
                        res.sendStatus(401);
                    }
                } else {
                    res.sendStatus(400);
                }
            }
        });
        connection.end();
    });

    /*
    * POST /events/:eventsId/add-spirit
    * eventId as url-param, passphrase as post body-param
    */
    router.post('/events/:eventId/add-spirit', function(req, res) {
        if (req.body.spiritId === undefined) {
            res.sendStatus(400);
        } else {
            let connection = mysql.createConnection(database_credentials);
            let query = `
                INSERT IGNORE INTO inventory_spirits
                    (event_id, spirit_id)
                VALUES
                    (${req.params.eventId}, ${req.body.spiritId});
            `;
            connection.connect();
            connection.query(query, function (err, rows, fields) {
                if (err) {
                    res.sendStatus(500);
                    console.log(err_print(req.path));
                    console.log(err);
                } else {
                    socket_controller.emitSpiritUpdate(req.params.eventId, req.body.spiritId, 'add');
                    res.sendStatus(204);
                }
            });
            connection.end();
        }
    });

    /*
    * POST /events/:eventsId/remove-spirit
    * eventId as url-param, passphrase as post body-param
    */
    router.post('/events/:eventId/remove-spirit', function(req, res) {
        if (req.body.spiritId === undefined) {
            res.sendStatus(400);
        } else {
            let connection = mysql.createConnection(database_credentials);
            let query = `
                DELETE FROM inventory_spirits
                WHERE inventory_spirits.event_id=${req.params.eventId}
                AND inventory_spirits.spirit_id=${req.body.spiritId};
            `;
            connection.connect();
            connection.query(query, function (err, rows, fields) {
                if (err) {
                    res.sendStatus(500);
                    console.log(err_print(req.path));
                    console.log(err);
                } else {
                    socket_controller.emitSpiritUpdate(req.params.eventId, req.body.spiritId, 'remove');
                    res.sendStatus(204);
                }
            });
            connection.end();
        }
    });

    /*
    * POST /events/:eventsId/add-mixer
    * eventId as url-param, passphrase as post body-param
    */
    router.post('/events/:eventId/add-mixer', function(req, res) {
        if (req.body.mixerId === undefined) {
            res.sendStatus(400);
        } else {
            let connection = mysql.createConnection(database_credentials);
            let query = `
                INSERT IGNORE INTO inventory_mixers
                    (event_id, mixer_id)
                VALUES
                    (${req.params.eventId}, ${req.body.mixerId});
            `;
            connection.connect();
            connection.query(query, function (err, rows, fields) {
                if (err) {
                    res.sendStatus(500);
                    console.log(err_print(req.path));
                    console.log(err);
                } else {
                    socket_controller.emitMixerUpdate(req.params.eventId, req.body.mixerId, 'add');
                    res.sendStatus(204);
                }
            });
            connection.end();
        }
    });

    /*
    * POST /events/:eventsId/remove-mixer
    * eventId as url-param, passphrase as post body-param
    */
    router.post('/events/:eventId/remove-mixer', function(req, res) {
        if (req.body.mixerId === undefined) {
            res.sendStatus(400);
        } else {
            let connection = mysql.createConnection(database_credentials);
            let query = `
                DELETE FROM inventory_mixers
                WHERE inventory_mixers.event_id=${req.params.eventId}
                AND inventory_mixers.mixer_id=${req.body.mixerId};
            `;
            connection.connect();
            connection.query(query, function (err, rows, fields) {
                if (err) {
                    res.sendStatus(500);
                    console.log(err_print(req.path));
                    console.log(err);
                } else {
                    socket_controller.emitMixerUpdate(req.params.eventId, req.body.mixerId, 'remove');
                    res.sendStatus(204);
                }
            });
            connection.end();
        }
    });

    /*
    * POST /events/add
    * name, description and passphrase
    */
    router.post('/events/add', function(req, res) {
        if (req.body.name === undefined || req.body.description === undefined ||
            req.body.date === undefined || req.body.passphrase === undefined){
            res.sendStatus(400);
        } else {
            let connection = mysql.createConnection(database_credentials);
            let query = `
                INSERT IGNORE INTO events
                    (name, description, passphrase, start_date)
                VALUES
                    (
                        "${req.body.name}",
                        "${req.body.description}",
                        "${req.body.passphrase}",
                        "${req.body.date}"
                    );
            `;
            connection.connect();
            connection.query(query, function (err, rows, fields) {
                if (err) {
                    res.sendStatus(500);
                    console.log(err_print(req.path));
                    console.log(err);
                } else {
                    res.sendStatus(204);
                }
            });
            connection.end();
        }
    });

    /*
    * POST /drinks/add
    * name, description, image_url, spirits, mixers, instructions
    */
    router.post('/drinks/add', function(req, res) {
        if (req.body.name === undefined || req.body.description === undefined ||
            req.body.image_url === undefined || req.body.spirits === undefined ||
            req.body.mixers === undefined || req.body.instructions === undefined){
            res.sendStatus(400);
        } else {

            fiber(function() {
                let instructions = req.body.instructions;
                let spirits = [];
                for (let i = 0; i < req.body.spirits.length; i++) {
                    let obj = {};
                    obj.amount = req.body.spirits[i].amount;
                    if (req.body.spirits[i].id < 1000) {
                        // Base spirit
                        function add_base_spirit_data(obj, defer) {
                            let connection = mysql.createConnection(database_credentials);
                            let query = `
                                SELECT base_spirits.name
                                FROM base_spirits
                                WHERE base_spirits.id=${req.body.spirits[i].id};
                            `;
                            connection.connect();
                            connection.query(query, function (err, rows, fields) {
                                if (err) {
                                    console.log(err_print(req.path));
                                    console.log(err);
                                    obj.base_spirit = {id: -1, name: "Error"};
                                } else {
                                    if (rows.length === 0) {
                                        obj.base_spirit = {id: req.body.spirits[i].id, name: "Unknown"};
                                    } else {
                                        obj.base_spirit = {id: req.body.spirits[i].id, name: rows[0].name};
                                    }
                                    defer();
                                }
                            });
                            connection.end();
                        }
                        // Synchronous mysql query for base_spirits
                        wait(add_base_spirit_data(obj, defer()));
                        spirits.push(obj);

                    } else {
                        // Spirit
                        function add_spirit_data(obj, defer) {
                            let connection = mysql.createConnection(database_credentials);
                            let query = `
                                SELECT spirits.name, base_spirits.id AS ba_id , base_spirits.name AS ba_name
                                FROM spirits
                                JOIN base_spirits
                                ON spirits.type_of_liqour=base_spirits.id
                                WHERE spirits.id=${req.body.spirits[i].id};
                            `;
                            connection.connect();
                            connection.query(query, function (err, rows, fields) {
                                if (err) {
                                    console.log(err_print(req.path));
                                    console.log(err);
                                    obj.spirit = {id: -1, name: "Error"};
                                } else {
                                    if (rows.length === 0) {
                                        obj.base_spirit = {id: -1, name: "Unknown"};
                                        obj.spirit = {id: req.body.spirits[i].id, name: "Unknown"};
                                    } else {
                                        obj.base_spirit = {id: rows[0].ba_id, name: rows[0].ba_name};
                                        obj.spirit = {id: req.body.spirits[i].id, name: rows[0].name};
                                    }
                                    defer();
                                }
                            });
                            connection.end();
                        }
                        // Synchronous mysql query for spirits
                        wait(add_spirit_data(obj, defer()));
                        spirits.push(obj);
                    }
                }

                let mixers = [];
                for (let i = 0; i < req.body.mixers.length; i++) {
                    let obj = {};
                    obj.amount = req.body.mixers[i].amount;

                    function add_mixer_data(obj, defer) {
                        let connection = mysql.createConnection(database_credentials);
                        let query = `
                            SELECT mixers.name
                            FROM mixers
                            WHERE mixers.id=${req.body.mixers[i].id};
                        `;
                        connection.connect();
                        connection.query(query, function (err, rows, fields) {
                            if (err) {
                                console.log(err_print(req.path));
                                console.log(err);
                                obj.mixer = {id: -1, name: "Error"};
                            } else {
                                if (rows.length === 0) {
                                    obj.mixer = {id: req.body.mixers[i].id, name: "Unknown"};
                                } else {
                                    obj.mixer = {id: req.body.mixers[i].id, name: rows[0].name};
                                }
                                defer();
                            }
                        });
                        connection.end();
                    }
                    // Synchronous mysql query for mixers
                    wait(add_mixer_data(obj, defer()));
                    mixers.push(obj);
                }

                // Add the constructed drink to the database
                let connection = mysql.createConnection(database_credentials);
                let query = `
                    INSERT IGNORE INTO drinks
                        (name, description, image_url, howto_json, spirits_json, mixers_json)
                    VALUES
                        (
                            "${req.body.name}",
                            "${req.body.description}",
                            "${req.body.image_url}",
                            "${JSON.stringify(instructions).replace(new RegExp('"', 'g'), '\\"')}",
                            "${JSON.stringify(spirits).replace(new RegExp('"', 'g'), '\\"')}",
                            "${JSON.stringify(mixers).replace(new RegExp('"', 'g'), '\\"')}"
                        );
                `;
                connection.connect();
                connection.query(query, function (err, rows, fields) {
                    if (err) {
                        res.sendStatus(500);
                        console.log(err_print(req.path));
                        console.log(err);
                    } else {
                        res.sendStatus(204);
                    }
                });
                connection.end();
            });
        }
    });

};

// Format a pretty print error message
function err_print(path) {
    return '\x1b[31m\x1b[1mERROR\x1b[0m in \x1b[1mPOST\x1b[0m request to \x1b[4m' + path + '\x1b[0m';
}
