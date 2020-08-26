var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("project list process");
  res.render('project/detail.html');
});

module.exports = router;
