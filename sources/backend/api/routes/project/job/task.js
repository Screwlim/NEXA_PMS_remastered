var express = require('express');
var router = express.Router();
const {JOBS, TASKS, ACTIVITYS} = require('../../../db/models');
/* GET users listing. */
router.get('/', function(req, res) {
  console.log("task page");
  var Job;
  var Task;
  //변수를 위처럼 선언해서 각 query시 얻은 데이터를 넘기긴 했는데 이전에는 이상하게 처음 데이터인 Job은 별다른 문제 없이 넘어가고, Task만 문제였다.
  JOBS.findOne({
    where: {ID: req.query.jid}
  }).then(data => {
    Job = data;
    TASKS.findOne({
      where: {ID: req.query.tid}
    }).then(data2 => {
      Task = data2;
      ACTIVITYS.findAll({
        where: {TASK_ID: Task.ID}
      }).then(data3 =>{
      console.log('search done');
      console.log(Job);
      console.log(Task);
      console.log(data3);

      res.render('project/job/task',{
        user: req.user,
        pid: req.query.pid,
        jid: req.query.jid,
        job: Job,
        task: Task,
        acts: data3
      })
    })
  }).catch(err => {
    console.error(err)
  })
})
});

module.exports = router;
