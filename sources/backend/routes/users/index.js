const express = require('express');
const router = express.Router();

const main = require('./login.js');
const user = require('./signup.js')

router.use('/login', main);
router.use('/signup', user);

module.exports = router;
