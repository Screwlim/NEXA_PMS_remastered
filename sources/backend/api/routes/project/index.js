const express = require('express');
const router = express.Router();

const proj = require('./project.js')
const notices = require('./notices.js')
const jobs = require('./jobs.js')

router.use('/notices', notices);
router.use('/jobs', jobs);
router.use('/', proj);

module.exports = router;
