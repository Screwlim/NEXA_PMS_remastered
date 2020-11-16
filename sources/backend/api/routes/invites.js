var express = require('express');
var router = express.Router();
const {INVITES, USERS} = require('../db/models');

router.get('/', function(req, res) {
  console.log("invites list page");

  INVITES.findAll({
    include : [{
      model :USERS,
      attributes: ['NAME', 'COMPANY']
    }],
    where: {RECV_USER_ID: req.user.ID}
  }).then(data => {
    res.render('invites', {user: req.user, invites: data});
  })
});

router.post('/', function(req, res){
  console.log("invite handle");

});

module.exports = router;
