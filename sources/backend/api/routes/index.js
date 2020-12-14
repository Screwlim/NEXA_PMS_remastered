const express = require('express');
const router = express.Router();

const main = require('./main');
const user = require('./user');
const auth = require('./auth');
const inprogress = require('./inprogress');
const projects = require('./projects');
const dashboard = require('./dashboard');
const invites = require('./invites');
const download = require('./download');
const comment = require('./comment');
const proj_create = require('./proj_create');
const proj_delete = require('./proj_delete');
const proj_list = require('./proj_list');

router.use('/', main);
router.use('/user', user);
router.use('/auth', auth);
router.use('/inprogress', inprogress);
router.use('/projects', projects);
router.use('/dashboard', dashboard);
router.use('/invites', invites);
router.use('/download', download);
router.use('/comment', comment);
router.use('/proj_create', proj_create);
router.use('/proj_delete', proj_delete);
router.use('/proj_list', proj_list)
module.exports = router;
