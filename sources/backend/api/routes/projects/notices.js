const express = require('express');
var router = express.Router();
const { NOTICES, FILE, COMMENTS_NOTICES, USERS } = require('../../db/models');
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
  console.log("project notice list process");

  NOTICES.findAll({
    where: {PROJECT_ID: req.pid}
  }).then(data => {
    res.render('project/notice-list',{
      user: req.user,
      pid: req.pid,
      notices: data,
      isPM: req.isPM,
      invites: req.invites
    });
  }).catch(err => {
    console.error(err);
  });
});



router.get('/notice-create', function(req, res){
  res.render('project/notice-create',{
    user: req.user, 
    pid: req.pid,
    isPM: req.isPM,
    invites: req.invites
  });
});


router.get('/:nid', function(req, res) {
  console.log("project notice detail process");
  NOTICES.findOne({
    where: {ID: req.params.nid}
  }).then(data => {
    notice = data;
    FILE.findAll({
      where:{
         SRC_TYPE: 0,
         SRC_ID: data.ID
      }
    }).then((data) => {
      files = data
      COMMENTS_NOTICES.findAll({
        include:[{
          model: USERS
        }],
        where: {
          NOTICE_ID: req.params.nid
        }
      }).then(data=>{
        res.render('project/notice-detail',{
          user: req.user,
          pid: req.pid,
          notice: notice,
          files: files,
          comments: data,
          isPM: req.isPM,
          invites: req.invites
        });
      })
    });
  });
});

router.post('/',upload.array('noticeFiles'),function(req,res) {
  console.log('create notice');
  console.log('number of files : ' + req.files.length);
  console.log(req.files)
  NOTICES.create({
    PROJECT_ID: req.pid,
    TITLE: req.body.title,
    CONTENT: req.body.content,
    AUTHOR_ID: req.user.ID,
    AUTHOR: req.user.NAME,
    FILES: req.files.length
  }).then(data => {
    console.log("file create");
    if (req.files.length != 0){
      req.files.forEach(element => {
        FILE.create({
          SRC_TYPE: 0,
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
    res.redirect('/projects/'+req.pid+'/notices');
  });
});

module.exports = router;