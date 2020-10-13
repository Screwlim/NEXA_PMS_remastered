var express = require('express');
var router = express.Router();
const {JOBS, TASKS} = require('../../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("job page");

  JOBS.findOne({
    where: {ID: req.query.jid}
  }).then(Job => {
    TASKS.findAll({
      where: {JOB_ID: Job.ID}
    }).then(Tasks => {
      console.log(Job);
      console.log(Tasks);

      res.render('project/job/job',{
        user: req.user,
        pid: req.query.pid,
        jid: req.query.jid,
        job: Job,
        tasks: Tasks,
      });
    })
    
  })

});

module.exports = router;
