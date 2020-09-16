var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  console.log("in progress page");
  res.render('inprogress')
});

module.exports = router;
