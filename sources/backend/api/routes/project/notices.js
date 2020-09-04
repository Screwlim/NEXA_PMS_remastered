var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("project notice list process");
  res.render('project/notice-list.html');
});

router.get('/detail', function(req, res, next) {
    console.log("project notice list process");
    res.render('project/notice-detail.html');
  });

module.exports = router;
