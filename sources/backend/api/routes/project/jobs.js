var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("업무조회 page");

  


  res.render('project/jobs',{
    pid: req.query.pid,
    user: req.user
  });
});

module.exports = router;
