var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("dashboard process");
  res.render('./dashboard.html');
});

module.exports = router;
