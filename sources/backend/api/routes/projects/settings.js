var express = require('express');
var router = express.Router();
const {PROJECTS} = require('../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("프로젝트 관리 page");
  console.log(req);
  PROJECTS.findOne({
    where: {
      ID: req.pid
    }
  }).then(data =>{
    console.log(data)
    res.render('project/settings',{
      user: req.user,
      proj: data
    });
  });
});

router.post('/', function(req,res) {
  console.log("project setting changed");

  PROJECTS.findOne({
    where : {
      ID: req.query.pid
    }
  }).then(data =>{
    console.log(req.body.start_date)
    console.log(req.body.end_date)
    data.NAME = req.body.name,
    data.DESCRIPTION = req.body.projectDesc,
    data.START_DATE = req.body.start_date,
    data.END_DATE = req.body.end_date
    data.save();
  }).then(data =>{
    res.redirect('/project?pid='+req.pid);
  })
})

module.exports = router;
