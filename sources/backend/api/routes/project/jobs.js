var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("업무조회 process");
  res.render('project/jobs');
});

module.exports = router;
