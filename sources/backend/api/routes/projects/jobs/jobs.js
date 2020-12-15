var express = require('express');
var router = express.Router();
const {JOBS, TASKS, POST_JOB, FILE} = require('../../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("업무조회 page");

  JOBS.findAll({
    where: {PROJECT_ID: req.pid}
  }).then(Jobs => {
    console.log(Jobs);
    res.render('project/jobs',{
      pid: req.pid,
      user: req.user,
      jobs: Jobs
    });
  })
  
});

router.get('/:jid', function(req, res) {
  console.log("job page");

  JOBS.findOne({
    where: {ID: req.params.jid}
  }).then(data => {
    Job = data;
    TASKS.findAll({
      where: {JOB_ID: Job.ID}
    }).then(data => {
      Tasks = data
      POST_JOB.findAll({
        where: {JOB_ID: Job.ID}
      }).then(data => {
        Posts = data
        FILE.findAll({
          where: {
            SRC_TYPE: 1
          }
        }).then((data)=>{
          console.log(Job);
          console.log(Posts);
          console.log(Tasks);
          console.log(data);
          res.render('project/job/job',{
            user: req.user,
            pid: req.pid,
            jid: req.params.jid,
            job: Job,
            posts: Posts,
            tasks: Tasks,
            files: data
          });
        });
      })
    });
  });
});

module.exports = router;
