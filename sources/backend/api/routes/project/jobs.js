var express = require('express');
var router = express.Router();
const {JOBS, sequelize} = require('../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("업무조회 page");

  JOBS.findAll({
    // attributes: [
    //   'ID',
    //   'TITLE',
    //   'AUTHOR',
    //   'AUTHOR_ID',
    //   'NUM_TASTKS',
    //   'NUM_DONE_TASKS',
    //   'DESCRIPTION',
    //   [sequelize.fn('date_format', sequelize.col('START_DATE'), '%Y-%m-%d'), 'start_date'],
    //   [sequelize.fn('date_format', sequelize.col('END_DATE'), '%Y-%m-%d'), 'end_date'],
    //   [sequelize.fn('date_format', sequelize.col('updatedAt'), '%Y-%m-%d'), 'updatedat'],
    //   [sequelize.fn('date_format', sequelize.col('createdAt'), '%Y-%m-%d'), 'createdat']
    // ],
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
