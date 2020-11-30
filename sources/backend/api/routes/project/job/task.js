var express = require('express');
var router = express.Router();
const {JOBS, TASKS, ACTIVITYS, POST_TASK, PROJECTS, FILE} = require('../../../db/models');
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

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("task page");
  var Job;
  var Task;
  //변수를 위처럼 선언해서 각 query시 얻은 데이터를 넘기긴 했는데 이전에는 이상하게 처음 데이터인 Job은 별다른 문제 없이 넘어가고, Task만 문제였다.
  JOBS.findOne({
    where: {ID: req.query.jid}
  }).then(data => {
    Job = data;
    TASKS.findOne({
      where: {ID: req.query.tid}
    }).then(data => {
      Task = data;
      ACTIVITYS.findAll({
        where: {TASK_ID: Task.ID}
      }).then(data =>{
        Acts = data;
        POST_TASK.findAll({
          where: {TASK_ID: req.query.tid}
        }).then(data=>{
          Posts = data
          FILE.findAll({
            where: {
              [Op.or] : [
                {SRC_TYPE: 2},
                {SRC_TYPE: 3}
              ]
            }
          }).then(data => {
            res.render('project/job/task',{
              user: req.user,
              pid: req.query.pid,
              jid: req.query.jid,
              job: Job,
              task: Task,
              acts: Acts,
              posts: Posts,
              files: data
            })
          })
        })
    })
  }).catch(err => {
    console.error(err)
  })
})
});

router.post('/', upload.array('activityFiles'),function(req, res) {
  console.log('create activity process');

  ACTIVITYS.create({
    TASK_ID: req.query.tid,
    TITLE: req.body.title,
    CONTENTS: req.body.contents,
    AUTHOR: req.user.NAME,
    AUTHOR_ID: req.user.ID,
    FILEURL: req.files.length
  }).then(data => {
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
    res.redirect('/project/job/task?pid='+req.query.pid+'&jid='+req.query.jid+'&tid='+req.query.tid);
  })
})

router.get('/done', function(req,res){
  console.log('task done process');

  TASKS.findOne({
    where: {
      [Op.and] : [
        {JOB_ID : req.query.jid}, 
        {ID : req.query.tid} 
      ]
    }
  }).then(data => {
    data.STATUS = 1;
    data.save()
  }).then(data=>{
    JOBS.findOne({
      where: {ID: req.query.jid}
    }).then(data => {
      data.NUM_DONE_TASKS = data.NUM_DONE_TASKS + 1;
      data.save();
      PROJECTS.findOne({
        where: {ID : req.query.pid}
      }).then(data => {
        data.NUM_DONE_TASKS = data.NUM_DONE_TASKS + 1;
        data.save();
      })
    })
  }).then(data=> {
    res.redirect('/project/job?pid='+req.query.pid+'&jid='+req.query.jid);
  });
})

router.get('/notDone', function(req,res){
  console.log('task not done process');

  TASKS.findOne({
    where: {
      [Op.and] : [
        {JOB_ID : req.query.jid}, 
        {ID : req.query.tid} 
      ]
    }
  }).then(data => {
    data.STATUS = 0;
    data.save()
  }).then(data=>{
    JOBS.findOne({
      where: {ID: req.query.jid}
    }).then(data => {
      data.NUM_DONE_TASKS = data.NUM_DONE_TASKS - 1;
      data.save();
      PROJECTS.findOne({
        where: {ID : req.query.pid}
      }).then(data => {
        data.NUM_DONE_TASKS = data.NUM_DONE_TASKS - 1;
        data.save();
      })
    })
  }).then(data=> {
    res.redirect('/project/job?pid='+req.query.pid+'&jid='+req.query.jid);
  });
})


module.exports = router;
