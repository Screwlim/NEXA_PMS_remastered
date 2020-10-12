var express = require('express');
var router = express.Router();
const {JOBS, TASKS, ACTIVITYS} = require('../../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("task page");

  JOBS.findOne({
    where: {ID: req.query.jid}
  }).then(Job => {
    TASKS.findOne({
      where: {JOB_ID: Job.ID}
    }).then(Task => {
      ACTIVITYS.findAll({
        where: {TASK_ID: Task.ID}
      })
    }).then(Acts =>{

      console.log(Job);
      console.log(Task);
      console.log(Acts);

      res.render('project/job/task',{
        user: req.user,
        pid: req.query.pid,
        jid: req.query.jid,
        job: Job,
        task: Task,
        acts: Acts
      })
    })
  })
});

module.exports = router;
