var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("project detail process");
  res.render('project/project');
});

module.exports = router;
