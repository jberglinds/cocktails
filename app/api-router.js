"use strict";

let mysql = require('mysql');
let database_credentials = require('../database/database_credentials.json');

let express = require('express');
let router = express.Router();

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
