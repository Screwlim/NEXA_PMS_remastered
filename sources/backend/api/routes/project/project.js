var express = require('express');
var router = express.Router();
const { PROJECTS, JOBS, TASKS } = require('../../db/models');

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("project " + req.query.pid+ " process");
  var jobs;
  var proj
  PROJECTS.findOne({
    where : {ID: req.query.pid}
  }).then(data => {
      jobs = JOBS.findAll({
      where: {PROJECT_ID: data.ID}
    })
    proj = data
  })
  .then(data2 => {
    if (data2 === undefined){
      data2 = []
    }
    console.log(proj)
    console.log(jobs)
    res.render('project/project', {proj: proj, jobs: data2, user: req.user});
  })    


});

module.exports = router;
