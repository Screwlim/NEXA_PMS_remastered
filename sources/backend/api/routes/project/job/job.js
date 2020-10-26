var express = require('express');
var router = express.Router();
const {JOBS, TASKS, POST_JOB} = require('../../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("job page");

  JOBS.findOne({
    where: {ID: req.query.jid}
  }).then(data => {
    Job = data;
    TASKS.findAll({
      where: {JOB_ID: Job.ID}
    }).then(data => {
      Tasks = data
      POST_JOB.findAll({
        where: {JOB_ID: Job.ID}
      }).then(Posts => {
        console.log(Job);
        console.log(Tasks);
        console.log(Posts);
        res.render('project/job/job',{
          user: req.user,
          pid: req.query.pid,
          jid: req.query.jid,
          job: Job,
          posts: Posts,
          tasks: Tasks,
        });
      })
    })
  })
});

module.exports = router;
