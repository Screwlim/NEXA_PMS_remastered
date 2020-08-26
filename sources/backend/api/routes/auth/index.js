const express = require('express');
const router = express.Router();

const login = require('./login.js');
const signup = require('./signup.js')
const password = require('./password.js')

router.use('/login', login);
router.use('/signup', signup);
router.use('/password', password);

module.exports = router;
