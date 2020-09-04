var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("project create process");
  res.render('projects/new.html');
});

module.exports = router;
