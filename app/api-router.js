"use strict";

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

require('./routes/get-routes.js')(router);
require('./routes/post-routes.js')(router);

module.exports = router;
