"use strict";

let mysql = require('mysql');
let database_credentials = require('../../database/database_credentials.json');

/*
* API end-points for POST requests
*/

module.exports = function(router) {

};

// Format a pretty print notification for receival of GET requests
function GET_print(path) {
    return '\x1b[32m\x1b[1mGET\x1b[0m request to \x1b[4m' + path + '\x1b[0m';
}

// Format a pretty print error message
function err_print(path) {
    return '\x1b[31m\x1b[1mERROR\x1b[0m in \x1b[1mPOST\x1b[0m request to \x1b[4m' + path + '\x1b[0m';
}
