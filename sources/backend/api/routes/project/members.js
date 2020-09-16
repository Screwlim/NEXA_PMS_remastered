var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("인원 관리 process");
  res.render('project/members');
});

module.exports = router;
