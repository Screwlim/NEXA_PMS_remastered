var express = require('express');
var router = express.Router();

const db = require('../../db/models/index');
const USER = db.USERS;

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("login page");
  res.render('./user/auth-login.html');
});

router.post('/', function(req, res) {
  console.log("login processing")
  USER.findOne({
    where: {
      EMAIL: req.body.email
    }
  }).then(USER => {
    res.redirect('/dashboard.html')
  })
})

module.exports = router;
