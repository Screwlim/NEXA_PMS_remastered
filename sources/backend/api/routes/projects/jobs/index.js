const express = require('express');
const router = express.Router();

const task_create = require('./tcreate.js');
const job_create = require('./create.js');
const jobs = require('./jobs.js');
const task = require('./task.js');

router.use('/:jid/tasks/:tid', function(req, res, next){
    console.log('in task router level')
    req.jid = req.params.jid;
    req.tid = req.params.tid;
    next();
},task);
router.use('/job-create', job_create);
router.use('/:jid/task-create', function(req, res, next){
    console.log('in router level')
    req.jid = req.params.jid;
    next();
},task_create);

router.use('/',jobs);

module.exports = router;
