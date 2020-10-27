const express = require('express');
const router = express.Router();

const tcreate = require('./tcreate.js');
const create = require('./create.js');
const job = require('./job.js');
const task = require('./task.js');
const job_post = require('./post_job.js');
const task_post = require('./post_task.js');

router.use('/create', create);
router.use('/tcreate', tcreate);
router.use('/task', task);
router.use('/job_post', job_post);
router.use('/task_post', task_post);
router.use('/', job);

module.exports = router;
