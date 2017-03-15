"use strict";

let mysql = require('mysql');
let database_credentials = require('../database/database_credentials.json');

let express = require('express');
let router = express.Router();

/*
* Log all incoming requests
*/
router.use('/', function(req, res, next) {
    switch (req.method) {
        case 'GET':
            console.log('\x1b[32m\x1b[1m'+ req.method + '\x1b[0m request to \x1b[4m' + req.path + '\x1b[0m');
            break;
        case 'POST':
            console.log('\x1b[33m\x1b[1m'+ req.method + '\x1b[0m request to \x1b[4m' + req.path + '\x1b[0m');
            break;
        default:
            console.log('\x1b[31m\x1b[1m'+ req.method + '\x1b[0m request to \x1b[4m' + req.path + '\x1b[0m');
    }
    next();
});

/*
* Passphrase authorization for all requests to /events/:eventId
*/
router.use('/events/:eventId', function(req, res, next) {
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

require('./routes/get-routes.js')(router);
require('./routes/post-routes.js')(router);

module.exports = router;
