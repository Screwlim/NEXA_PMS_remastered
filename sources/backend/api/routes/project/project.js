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
    proj = data
    JOBS.findAll({
      where: {PROJECT_ID: proj.ID}
    }).then(data => {
      if (data === undefined){
        console.log('no job data');
        jobs = []
      }
      else{
        jobs = data
      }
    }).then(data=>{
      res.render('project/project', {
        proj: proj,
        jobs: jobs,
        user: req.user,
        pid: proj.ID
      });
    });
  });    

});

module.exports = router;
