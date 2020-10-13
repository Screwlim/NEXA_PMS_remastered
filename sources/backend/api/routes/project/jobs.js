var express = require('express');
var router = express.Router();
const {JOBS, sequelize} = require('../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("업무조회 page");

  JOBS.findAll({
    where: {PROJECT_ID: req.query.pid}
  }).then(Jobs => {
    console.log(Jobs);
    res.render('project/jobs',{
      pid: req.query.pid,
      user: req.user,
      jobs: Jobs
    });
  })
  
});

module.exports = router;
