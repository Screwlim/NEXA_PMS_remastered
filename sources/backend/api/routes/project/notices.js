var express = require('express');
const { NOT } = require('sequelize/types/lib/deferrable');
var router = express.Router();
const { NOTICES } = require('../../db/models');


/* GET users listing. */
router.get('/', function(req, res, next) {
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

router.post('/', function(req,res) {
  console.log('create notice')

  NOTICES.create({
    PROJECT_ID: req.query.pid,
    TITLE: req.body.title,
    CONTENT: req.body.content,
    AUTHOR: req.user.ID,
    AUTHOR_NAME: req.user.NAME,
    FILEURL: 'url'
  })
})

module.exports = router;
