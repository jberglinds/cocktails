"use strict";

let express = require('express');

let router = express.Router();

router.get('/test', function(req, res) {
	res.send('It works!');
});

module.exports = router;
