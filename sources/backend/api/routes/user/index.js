const express = require('express');
const router = express.Router();

const profile = require('./profile.js');

router.use('/profile', profile);

module.exports = router;
