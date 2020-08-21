const express = require('express');
const router = express.Router();

const main = require('./main');
const user = require('./user')
const dashboard = require('./dashboard');

router.use('/', main);
router.use('/user', user);
router.use('/dashboard', dashboard);

module.exports = router;
