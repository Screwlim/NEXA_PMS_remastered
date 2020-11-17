var express = require('express');
const { USERS } = require('../../db/models');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("user profile");
  res.render('user/profile', {user: req.user});
});

router.post('/', function(req, res) {
  console.log("user profile update");

  USERS.findOne({
    where: {
      ID: req.user.ID
    }
  }).then(data => {
    data.NAME = req.body.name,
    data.COMPANY = req.body.company,
    data.POSITION = req.body.position,
    data.PHONENUMBER = req.body.phonenumber,
    data.COMPANYNUMBER = req.body.companynumber
    data.save();
  }).then(data=>{
    res.redirect('/user/profile');
  })
})


module.exports = router;
