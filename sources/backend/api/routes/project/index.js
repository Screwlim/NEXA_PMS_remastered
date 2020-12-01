const express = require('express');
const router = express.Router();

const proj = require('./project.js')
const notices = require('./notices.js')
const jobs = require('./jobs.js')
const members = require('./members.js')
const job = require('./job')
const settings = require('./settings')

router.use('/notices', notices);
router.use('/jobs', jobs);
router.use('/job', job);
router.use('/members', members);
router.use('/', proj);
router.use('/settings', settings);

module.exports = router;
