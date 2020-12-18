var express = require('express');
var router = express.Router();
const path = require("path");
const fs = require('fs');
const {COMMENTS_ACTIVITY, COMMENTS_JOB_POST, COMMENTS_NOTICES, COMMENTS_TASK_POST, USERS} = require('../db/models');


router.get('/notices/:nid', function(req, res) {
  console.log('notice comment in')
  COMMENT_NOTICES.findAll({
    where: {
      NOTICE_ID: req.params.nid,
    }
  }).then((data)=> {
    res.json(JSON.stringify(data));
  })

});

router.post('/notices/:nid', function(req, res) {
  console.log('comment in')
  console.log('notice commnet 작성');
  console.log(req.originalUrl);
  COMMENTS_NOTICES.create({
    NOTICE_ID: req.params.nid,
    AUTHOR_ID: req.user.ID,
    CONTENT: req.body.comment
  }).then(()=> {
    res.redirect('/projects/'+req.body.pid+'/notices/'+req.params.nid);
  })
})

router.get('/job_posts/:post_id', function(req, res){
  console.log('job comments called');
  COMMENTS_JOB_POST.findAll({
    include:[{
      model: USERS,
    }],
    where:{
      POST_ID: req.params.post_id
    }
  }).then(data=>{
    console.log(data);
    res.json(data);
  })
})


router.post('/job-posts/:post_id', function(req, res){
  console.log('job comments called');
  COMMENTS_JOB_POST.findAll({
    include:[{
      model: USERS,
    }],
    where:{
      POST_ID: req.params.post_id
    }
  }).then(data=>{
    console.log(data);
    res.json(data);
  })
})

router.get('/task_posts/:id', function(req, res){

  res.send('task comments called');
  // COMMENTS_TASK.create({
    
  // })  
})
router.get('/activitys/:id', function(req, res){
  
})

module.exports = router;