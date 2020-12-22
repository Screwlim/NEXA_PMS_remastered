var express = require('express');
var router = express.Router();
const path = require("path");
const fs = require('fs');
const {COMMENTS_ACTIVITY, COMMENTS_JOB_POST, COMMENTS_NOTICES, COMMENTS_TASK_POST, USERS} = require('../db/models');

//notice comments
router.get('/notices/:nid', function(req, res) {
  COMMENT_NOTICES.findAll({
    where: {
      NOTICE_ID: req.params.nid,
    }
  }).then((data)=> {
    res.json(data);
  })

});//no use currently

router.post('/notices/:nid', function(req, res) {
  COMMENTS_NOTICES.create({
    NOTICE_ID: req.params.nid,
    AUTHOR_ID: req.user.ID,
    CONTENT: req.body.comment
  }).then(()=> {
    res.redirect('/projects/'+req.body.pid+'/notices/'+req.params.nid);
  })
})

//job post comments
router.get('/job_posts/:post_id', function(req, res){
  COMMENTS_JOB_POST.findAll({
    include:[{
      model: USERS,
    }],
    where:{
      POST_ID: req.params.post_id
    }
  }).then(data=>{
    res.json(data);
  })
})

router.post('/job_posts/:post_id', function(req, res){
  COMMENTS_JOB_POST.create({
    POST_ID: req.params.post_id,
    AUTHOR_ID: req.user.ID,
    CONTENT: req.body.comment
  }).then(()=>{
    COMMENTS_JOB_POST.findAll({
      include:[{
        model: USERS,
      }],
      where:{
        POST_ID: req.params.post_id
      }
    }).then(data=>{
      res.json(data);
    })
  })
})


//task_post comments
router.get('/task_posts/:post_id', function(req, res){
  COMMENTS_TASK_POST.findAll({
    include:[{
      model: USERS,
    }],
    where:{
      POST_ID: req.params.post_id
    }
  }).then(data=>{
    res.json(data);
  })
})

router.post('/task_posts/:post_id', function(req, res){
  COMMENTS_TASK_POST.create({
    POST_ID: req.params.post_id,
    AUTHOR_ID: req.user.ID,
    CONTENT: req.body.comment
  }).then(()=>{
    COMMENTS_TASK_POST.findAll({
      include:[{
        model: USERS,
      }],
      where:{
        POST_ID: req.params.post_id
      }
    }).then(data=>{
      res.json(data);
    })
  }) 
})


//activity comments
router.get('/activitys/:id', function(req, res){
  COMMENTS_ACTIVITY.findAll({
    include:[{
      model: USERS,
    }],
    where:{
      ACTIVITY_ID: req.params.id
    }
  }).then(data=>{
    res.json(data);
  })
})

router.post('/activitys/:id', function(req, res){
  COMMENTS_ACTIVITY.create({
    ACTIVITY_ID: req.params.id,
    AUTHOR_ID: req.user.ID,
    CONTENT: req.body.comment
  }).then(()=>{
    COMMENTS_ACTIVITY.findAll({
      include:[{
        model: USERS,
      }],
      where:{
        ACTIVITY_ID: req.params.id
      }
    }).then(data=>{
      res.json(data);
    })
  })
})
module.exports = router;