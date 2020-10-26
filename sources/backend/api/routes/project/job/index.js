const express = require('express');
const router = express.Router();

const tcreate = require('./tcreate.js');
const create = require('./create.js');
const job = require('./job.js');
const task = require('./task.js');
const post = require('./post_job.js');

router.use('/create', create);
router.use('/tcreate', tcreate);
router.use('/task', task);
router.use('/post_job', post);
router.use('/', job);

module.exports = router;
