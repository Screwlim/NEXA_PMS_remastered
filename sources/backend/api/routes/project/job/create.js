var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("업무 생성 page");
  res.render('project/job/create', {user: req.user});
});

module.exports = router;
