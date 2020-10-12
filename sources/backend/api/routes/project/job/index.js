const express = require('express');
const router = express.Router();

const tcreate = require('./tcreate.js');
const create = require('./create.js');
const job = require('./job.js');
const task = require('./task.js');

router.use('/create', create);
router.use('/tcreate', tcreate);
router.use('/task', task);
router.use('/', job);

module.exports = router;
