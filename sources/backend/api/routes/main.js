var express = require('express');
var router = express.Router();

router.get('/', function(req, res) {
  console.log("in main route");
  res.render('index')
});

module.exports = router;
