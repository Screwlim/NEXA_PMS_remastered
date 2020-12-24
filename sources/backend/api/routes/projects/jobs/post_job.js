var express = require('express');
var router = express.Router();
const {POST_JOB, FILE} = require('../../../db/models');
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
  console.log("post 생성 page");
  res.render('project/job/job_post_create',{
    user: req.user,
    pid: req.query.pid,
    jid: req.query.jid,
    isPM: req.isPM,
    invites: req.invites
  });
});

router.post('/', upload.array('postFiles') ,function(req, res) {
  console.log('in post-job creating process')
  POST_JOB.create({
    JOB_ID: req.query.jid,
    TITLE: req.body.title,
    CONTENT: req.body.cont, 
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
    res.redirect('/project/job?pid='+req.query.pid+'&jid='+req.query.jid);
  });
});

module.exports = router;
