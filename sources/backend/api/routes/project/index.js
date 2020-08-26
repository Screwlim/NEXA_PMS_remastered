const express = require('express');
const router = express.Router();

const deleteproj = require('./delete.js');
const list = require('./list.js')
const newproj = require('./new.js')
const proj = require('./project.js')

router.use('/delete', deleteproj);
router.use('/list', list);
router.use('/new', newproj);
router.use('/', proj);

module.exports = router;
