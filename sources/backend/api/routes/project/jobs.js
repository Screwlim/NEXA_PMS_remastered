var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("job list process");
  res.render('project/jobs.html');
});

module.exports = router;
