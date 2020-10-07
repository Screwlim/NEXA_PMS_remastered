var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("인원 관리 process");

  res.render('project/members', {
    pid: req.query.pid,
    user: req.user
  });
});

module.exports = router;
