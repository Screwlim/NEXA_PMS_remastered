const express = require('express');
const router = express.Router();

const proj = require('./project.js')
const notices = require('./notices.js')
const jobs = require('./jobs.js')
const members = require('./members.js')

router.use('/notices', notices);
router.use('/jobs', jobs);
router.use('/members', members);
router.use('/', proj);

module.exports = router;
