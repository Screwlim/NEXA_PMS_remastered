var express = require('express');
var router = express.Router();
const {JOBS, TASKS, ACTIVITYS, POST_TASK, PROJECTS, FILE, COMMENTS_ACTIVITY} = require('../../../db/models');
const { Op } = require('sequelize');
var multer = require('multer');
const path = require("path");

const upload = multer({
  storage: multer.diskStorage({
    //위치 지정
    destination: (req, file, done) => {
      done(null, "uploads/");
    }, 
    filename: (req, file, done) => {
      const ext = path.extname(file.originalname);
      done(null, path.basename(file.originalname, ext) + Date.now() + ext);
      // cb(null, new Date().valueOf() + path.extname(file.originalname));
    }
  })
});

router.get('/', function(req, res) {
  console.log("task page");
  var Job;
  var Task;
  JOBS.findOne({
    where: {ID: req.jid}
  }).then(data => {
    Job = data;
    TASKS.findOne({
      where: {ID: req.tid}
    }).then(data => {
      Task = data;
      ACTIVITYS.findAll({
        where: {TASK_ID: Task.ID}
      }).then(data =>{
        Acts = data;
        Act_ids = [];
        Acts.forEach(act => {
          Act_ids.push(act.ID);
        })
        POST_TASK.findAll({
          where: {TASK_ID: req.tid}
        }).then(data=>{
          Posts = data
          FILE.findAll({
            where: {
                SRC_TYPE: 2
            }
          }).then(data => {
            post_files = data;
            FILE.findAll({
              where: {
                SRC_TYPE: 3
            }
          }).then(data=>{
            act_files = data;
            console.log(act_files);
            COMMENTS_ACTIVITY.findAll({
              where: {ID: Act_ids}
            }).then(data =>{
              res.render('project/job/task',{
                proj: req.proj,
                user: req.user,
                pid: req.pid,
                jid: req.jid,
                job: Job,
                task: Task,
                acts: Acts,
                posts: Posts,
                post_files: post_files,
                act_files: act_files,
                act_comments: data,
                isPM: req.isPM,
                invites: req.invites
              })
            })
          })          
        })
      })
    })
  }).catch(err => {
    console.error(err)
  })
})
});

router.post('/activitys', upload.array('activityFiles'),function(req, res) {
  console.log('create activity process');

  ACTIVITYS.create({
    TASK_ID: req.tid,
    TITLE: req.body.title,
    CONTENTS: req.body.contents,
    AUTHOR: req.user.NAME,
    AUTHOR_ID: req.user.ID,
    FILEURL: req.files.length
  }).then(data => {
    if (req.files.length != 0){
      req.files.forEach(element => {
        FILE.create({
          SRC_TYPE: 3,
          SRC_ID: data.ID,
          PATH: element.path,
          server_NAME: element.filename,
          original_NAME: element.originalname
        })
      });
    }
    else{
      console.log("no file attached");
    }
  }).then(()=>{
    res.redirect('/projects/'+req.pid+'/jobs/'+req.jid+'/tasks/'+req.tid);
  })
})


router.post('/posts',upload.array('postFiles'), function(req, res) {
  console.log('in post-job creating process')
  POST_TASK.create({
    TASK_ID: req.tid,
    TITLE: req.body.title,
    CONTENT: req.body.contents, 
    AUTHOR: req.user.NAME,
    AUTHOR_ID: req.user.ID,
    FILEURL: req.files.length
  }).then((data)=> {
    if (req.files.length != 0){
      req.files.forEach(element => {
        FILE.create({
          SRC_TYPE: 2,
          SRC_ID: data.ID,
          PATH: element.path,
          server_NAME: element.filename,
          original_NAME: element.originalname
        })
      });
    }
    else{
      console.log("no file attached");
    }
  }).then(()=>{
    res.redirect('/projects/'+req.pid+'/jobs/'+req.jid+'/tasks/'+req.tid);
  });

});

router.get('/done', function(req,res){
  console.log('task done process');

  TASKS.findOne({
    where: {
      [Op.and] : [
        {JOB_ID : req.jid}, 
        {ID : req.tid} 
      ]
    }
  }).then(data => {
    data.STATUS = 1;
    data.save()
  }).then(data=>{
    JOBS.findOne({
      where: {ID: req.jid}
    }).then(data => {
      data.NUM_DONE_TASKS = data.NUM_DONE_TASKS + 1;
      data.save();
      PROJECTS.findOne({
        where: {ID : req.pid}
      }).then(data => {
        data.NUM_DONE_TASKS = data.NUM_DONE_TASKS + 1;
        data.save();
      })
    })
  }).then(data=> {
    res.redirect('/projects/'+req.pid+'/jobs/'+req.jid);
  });
})

router.get('/notDone', function(req,res){
  console.log('task not done process');

  TASKS.findOne({
    where: {
      [Op.and] : [
        {JOB_ID : req.jid}, 
        {ID : req.tid} 
      ]
    }
  }).then(data => {
    data.STATUS = 0;
    data.save()
  }).then(data=>{
    JOBS.findOne({
      where: {ID: req.jid}
    }).then(data => {
      data.NUM_DONE_TASKS = data.NUM_DONE_TASKS - 1;
      data.save();
      PROJECTS.findOne({
        where: {ID : req.pid}
      }).then(data => {
        data.NUM_DONE_TASKS = data.NUM_DONE_TASKS - 1;
        data.save();
      })
    })
  }).then(data=> {
    res.redirect('/projects/'+req.pid+'/jobs/'+req.jid);
  });
})


module.exports = router;
