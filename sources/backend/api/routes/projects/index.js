const express = require('express');
const router = express.Router();

const proj_dashboard = require('./proj_dashboard.js')
const notices = require('./notices.js')
const jobs = require('./jobs')
const members = require('./members.js')
const settings = require('./settings')

router.use('/', proj_dashboard);
router.use('/notices', notices);
router.use('/jobs', jobs);
router.use('/members', members);
router.use('/settings', settings);

module.exports = router;
