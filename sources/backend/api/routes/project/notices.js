const express = require('express');
var router = express.Router();
const { NOTICES } = require('../../db/models');
var multer = require('multer');
const upload = multer({
  storage: multer.diskStorage({
    // set a localstorage destination
    //   어떤이름으로 저장할지가 들어있다.

    //위치 지정
    destination: (req, file, done) => {
      done(null, "uploads/");
    }
  })
});


/* GET users listing. */
router.get('/', function(req, res) {
  console.log("project notice list process");

  NOTICES.findAll({
    where: {PROJECT_ID: req.query.pid}
  }).then(data => {
    res.render('project/notice-list',{
      user: req.user,
      pid: req.query.pid,
      notices: data
    });
  }).catch(err => {
    console.error(err);
  })
});

router.get('/detail', function(req, res) {
    console.log("project notice detail process");

    NOTICES.findOne({
      where: {ID: req.query.nid}
    }).then(data => {
      res.render('project/notice-detail',{
        user: req.user,
        pid: req.query.pid,
        notice: data
      });
    })
  });

router.post('/',upload.single('noticeFiles'),function(req,res) {
  console.log('create notice');
  console.log(req)
  NOTICES.create({
    PROJECT_ID: req.query.pid,
    TITLE: req.body.title,
    CONTENT: req.body.content,
    AUTHOR_ID: req.user.ID,
    AUTHOR: req.user.NAME,
    FILEURL: 'req.file.path'
  }).then(data => {
    res.redirect('/project/notices?pid='+req.query.pid);
  });  
});

module.exports = router;
