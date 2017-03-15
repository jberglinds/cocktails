"use strict";

let mysql = require('mysql');
let database_credentials = require('../../database/database_credentials.json');

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
                    res.sendStatus(201);
                }
            });
            connection.end();
        }
    });

};

// Format a pretty print error message
function err_print(path) {
    return '\x1b[31m\x1b[1mERROR\x1b[0m in \x1b[1mPOST\x1b[0m request to \x1b[4m' + path + '\x1b[0m';
}
