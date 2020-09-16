const express = require('express');
const router = express.Router();

const main = require('./main');
const user = require('./user');
const auth = require('./auth');
const inprogress = require('./inprogress');
const project = require('./project');
const projects = require('./projects');
const dashboard = require('./dashboard');

router.use('/', main);
router.use('/user', user);
router.use('/auth', auth);
router.use('/inprogress', inprogress);
router.use('/project', project);
router.use('/projects', projects);
router.use('/dashboard', dashboard);

module.exports = router;
