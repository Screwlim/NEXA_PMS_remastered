const express = require('express');
const router = express.Router();

const create = require('./create.js');
const job = require('./job.js');

router.use('/create', create);
router.use('/', job);

module.exports = router;
