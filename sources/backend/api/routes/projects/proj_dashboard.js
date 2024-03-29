var express = require('express');
var router = express.Router();
const { PROJECTS, JOBS, TASKS } = require('../../db/models');

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("project " + req.pid+ " process");
  req.pid = req.pid;
  var jobs
  var proj
  PROJECTS.findOne({
    where : {ID: req.pid}
  }).then(data => {
    proj = data
    JOBS.findAll({
      where: {PROJECT_ID: proj.ID}
    }).then(data=>{
        if(proj.STATUS == 0 || proj.STATUS == -1){
          date = proj.END_DATE - proj.START_DATE;
          today = new Date();
          time_passed = today - proj.START_DATE
          expect = Math.round((time_passed / date)*100);
          current = Math.round((proj.NUM_DONE_TASKS/ proj.NUM_TASKS)*100);
          if( expect > current){
            proj.STATUS = -1;
            proj.save();
          }else if(expect <= current){
            proj.STATUS = 0;
            proj.save();
          }
        }
      res.render('project/proj_dashboard', {
        proj: proj,
        jobs: data,
        user: req.user,
        pid: proj.ID,
        isPM: req.isPM,
        invites: req.invites
      });
    });
  });    

});

module.exports = router;
