var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("password process");
  res.render('auth/auth-password');
});

module.exports = router;
