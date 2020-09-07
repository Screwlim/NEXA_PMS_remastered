const express = require('express');
const router = express.Router();

const login = require('./login.js');
const signup = require('./signup.js')
const signup_sns = require('./signup-sns.js')
const password = require('./password.js')
const logout = require('./logout.js')
const kakao = require('./kakao.js')

router.use('/login', login);
router.use('/signup', signup);
router.use('/signup-sns', signup_sns);
router.use('/password', password);
router.use('/logout', logout);
router.use('/kakao', kakao);

module.exports = router;
