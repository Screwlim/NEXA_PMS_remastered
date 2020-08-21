var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("signup process");
  res.render('./user/auth-register.html');
});

module.exports = router;
