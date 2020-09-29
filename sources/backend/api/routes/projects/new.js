var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("project create page");
  res.render('projects/new');
});

router.post('/', function(req, res, next) {
  console.log("project create process");



  console.log(req.body);
  res.render('projects/new', {user: req.user});
});

module.exports = router;
