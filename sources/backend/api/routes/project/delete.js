var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("project delete process");
  res.render('project/delete.html');
});

module.exports = router;
