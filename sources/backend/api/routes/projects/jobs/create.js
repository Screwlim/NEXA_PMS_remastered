var express = require('express');
var router = express.Router();
const {JOBS} = require('../../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("업무 생성 page");
  res.render('project/job/create',{
    user: req.user,
    pid: req.query.pid
  });
});

router.post('/', function(req, res) {
  console.log('in job creating process')

  JOBS.create({
    PROJECT_ID: req.query.pid,
    TITLE: req.body.title,
    START_DATE: req.body.start_date,
    END_DATE: req.body.end_date,
    DESCRIPTION: req.body.desc,
    AUTHOR: req.user.NAME,
    AUTHOR_ID: req.user.ID, 
    NUM_TASKS: 0,
    NUM_DONE_TASKS: 0,
  })


  res.redirect('/project?pid='+req.query.pid);
});



module.exports = router;
