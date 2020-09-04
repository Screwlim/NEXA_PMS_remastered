const express = require('express');
const router = express.Router();

const deleteproj = require('./delete.js');
const list = require('./list.js')
const newproj = require('./new.js')

router.use('/delete', deleteproj);
router.use('/list', list);
router.use('/new', newproj);

module.exports = router;
