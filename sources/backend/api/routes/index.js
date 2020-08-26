const express = require('express');
const router = express.Router();

const main = require('./main');
//const user = require('./user');
const auth = require('./auth');
const project = require('./project');
const dashboard = require('./dashboard');

router.use('/', main);
//router.use('/user', user);
router.use('/auth', auth);
router.use('/project', project);
router.use('/dashboard', dashboard);

module.exports = router;
