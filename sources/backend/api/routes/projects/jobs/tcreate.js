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
    JOBS.findOne({
      where: {ID: req.jid}
    }).then(data => {
      data.NUM_TASKS = data.NUM_TASKS + 1;
      data.save();
      PROJECTS.findOne({
        where: {ID : req.pid}
      }).then(data => {
        date = data.END_DATE - data.START_DATE;
        data.NUM_TASKS = data.NUM_TASKS + 1;
        data.save();
        today = new Date();
        time_passed = today - data.START_DATE
        expect = Math.round((time_passed / date)*100);
        current = Math.round((data.NUM_DONE_TASKS/ data.NUM_TASKS)*100);
        if( expect > current){
          data.STATUS = -1;
          data.save();
        }else if(expect <= current){
          data.STATUS = 0;
          data.save();
        }
        console.log(expect);
        console.log(current);
      });
    });
    res.redirect('/projects/'+req.pid+'/jobs/'+req.jid);
  });
});



module.exports = router;
