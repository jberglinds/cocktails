"use strict";

let express = require('express');
let router = express.Router();

require('./routes/get-routes.js')(router);
require('./routes/post-routes.js')(router);

module.exports = router;
