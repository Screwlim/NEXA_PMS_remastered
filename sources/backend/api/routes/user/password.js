var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("password process");
  res.render('./user/auth-password.html');
});

module.exports = router;
