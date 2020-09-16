var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("project list process");
  res.render('projects/list');
});

module.exports = router;
