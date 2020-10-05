const express = require('express');
const router = express.Router();

const create = require('./create.js');

router.use('/create', create);

module.exports = router;
