var express = require('express');
var router = express.Router();
const {TASKS, JOBS, PROJECTS} = require('../../../db/models');

router.get('/', function(req, res) {
  console.log("업무 생성 page");
  res.render('project/job/task-create',{
    user: req.user,
    pid: req.pid,
    isPM: req.isPM,
    invites: req.invites
  });
});

router.post('/', function(req, res) {
  console.log('in task creating process')
  TASKS.create({
    JOB_ID: req.jid,
    TITLE: req.body.title,
    START_DATE: req.body.start_date,
    END_DATE: req.body.end_date,
    DESCRIPTION: req.body.desc, 
    AUTHOR: req.user.NAME,
    AUTHOR_ID: req.user.ID, 
    WEIGHT: 0,
    STATUS: 0
  }).then(data => {
    JOBS.increment('NUM_TASKS', {
      where: {ID: req.jid}
    })
  }).then(data=> {
    PROJECTS.increment('NUM_TASKS', {
      where: {ID: req.pid}
    })
  })

  res.redirect('/projects/'+req.pid+'/jobs/'+req.jid);
});



module.exports = router;
