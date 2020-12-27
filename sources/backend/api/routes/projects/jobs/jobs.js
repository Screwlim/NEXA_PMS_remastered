var express = require('express');
var router = express.Router();
const {JOBS, TASKS, POST_JOB, FILE} = require('../../../db/models');
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
  console.log("업무조회 page");

  JOBS.findAll({
    where: {PROJECT_ID: req.pid}
  }).then(Jobs => {
    console.log(Jobs);
    res.render('project/jobs',{
      proj: req.proj,
      pid: req.pid,
      user: req.user,
      jobs: Jobs,
      isPM: req.isPM,
      invites: req.invites
    });
  })
  
});

router.get('/:jid', function(req, res) {
  console.log('job'+req.params.jid+'page');

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
          res.render('project/job/job',{
            proj: req.proj,
            user: req.user,
            pid: req.pid,
            jid: req.params.jid,
            job: Job,
            posts: Posts,
            tasks: Tasks,
            files: data,
            isPM: req.isPM,
            invites: req.invites
          });
        });
      })
    });
  });
});

//create job_post
router.post('/:jid/posts', upload.array('postFiles') ,function(req, res) {
  console.log('in post-job creating process')
  POST_JOB.create({
    JOB_ID: req.params.jid,
    TITLE: req.body.postTitle,
    CONTENT: req.body.postContent, 
    AUTHOR: req.user.NAME,
    AUTHOR_ID: req.user.ID,
    FILES: req.files.length
  }).then((data)=> {
    if (req.files.length != 0){
      req.files.forEach(element => {
        FILE.create({
          SRC_TYPE: 1,
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
    res.redirect('/projects/'+req.pid+'/jobs/'+req.params.jid);
  });
});


module.exports = router;