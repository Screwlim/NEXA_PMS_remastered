var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("user profile");
  res.render('user/profile');
});

module.exports = router;
