var express = require('express');
var router = express.Router();
const {POST_TASK} = require('../../../db/models');

router.get('/', function(req, res) {
  console.log("post_task 생성 page");
  res.render('project/job/task_post_create',{
    user: req.user,
    pid: req.query.pid,
    jid: req.query.jid,
    tid: req.query.tid
  });
});

router.post('/', function(req, res) {
  console.log('in post-job creating process')

  POST_TASK.create({
    TASK_ID: req.query.tid,
    TITLE: req.body.title,
    CONTENT: req.body.cont, 
    AUTHOR: req.user.NAME,
    AUTHOR_ID: req.user.ID,
    FILEURL: 'url'
  })

  res.redirect('/project/job/task?pid='+req.query.pid+'&jid='+req.query.jid+'&tid='+req.query.tid);
});

module.exports = router;
