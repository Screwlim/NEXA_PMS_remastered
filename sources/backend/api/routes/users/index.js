const express = require('express');
const router = express.Router();

const login = require('./login.js');
const signup = require('./signup.js')

router.use('/login', login);
router.use('/signup', signup);

module.exports = router;
