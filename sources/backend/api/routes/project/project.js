var express = require('express');
var router = express.Router();
const { PROJECTS, JOBS, TASKS } = require('../../db/models');

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("project " + req.query.pid+ " process");
  var jobs
  var proj
  PROJECTS.findOne({
    where : {ID: req.query.pid}
  }).then(data => {
      jobs = JOBS.findAll({
      where: {PROJECT_ID: data.ID}
    })
    proj = data
  }).then(data2 => {
    if (data2 === undefined){
      console.log('no job data');
      data2 = []
    }
    else{
      console.log('job data = ');
      jobs = data2
    }
    res.render('project/project', {
      proj: proj,
      jobs: jobs,
      user: req.user,
      pid: proj.ID
    });
  })    


});

module.exports = router;
