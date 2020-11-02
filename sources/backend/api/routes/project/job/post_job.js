var express = require('express');
var router = express.Router();
const {POST_JOB} = require('../../../db/models');

router.get('/', function(req, res) {
  console.log("post 생성 page");
  res.render('project/job/job_post_create',{
    user: req.user,
    pid: req.query.pid,
    jid: req.query.jid
  });
});

router.post('/', function(req, res) {
  console.log('in post-job creating process')

  POST_JOB.create({
    JOB_ID: req.query.jid,
    TITLE: req.body.title,
    CONTENT: req.body.cont, 
    AUTHOR: req.user.NAME,
    AUTHOR_ID: req.user.ID,
    FILEURL: 'url'
  })

  res.redirect('/project/job?pid='+req.query.pid+'&jid='+req.query.jid);
});

module.exports = router;