var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("login process");
  res.render('./user/auth-login.html');
});

module.exports = router;
