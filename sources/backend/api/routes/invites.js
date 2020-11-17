var express = require('express');
var router = express.Router();
const {INVITES, USERS, PROJECTS, ATTENDANCES} = require('../db/models');
const { Op } = require('sequelize');

router.get('/', function(req, res) {
  console.log("invites list page");

  INVITES.findAll({
    include : [{
      model : USERS
    }, {
      model: PROJECTS
    }],

    where: {RECV_USER_ID: req.user.ID, STATUS: 0}
  }).then(data => {
    console.log(data);
    res.render('invites', {user: req.user, invites: data});
  })
});

router.post('/', function(req, res){
  console.log("invite handle");

  INVITES.findOne({
    where : {
      [Op.and] : [
        {PROJECT_ID : req.body.invited_project}, 
        {SEND_USER_ID : req.body.inviter_id}, 
        {RECV_USER_ID: req.user.ID}
      ]
    }
  }).then(data=> {
    data.STATUS = req.body.answer;
    data.save();
    console.log(data);
    if(req.body.answer == 1){
      ATTENDANCES.create({
        PROJECT_ID:req.body.invited_project,
        USER_ID: req.user.ID,
        ISPM: 0
      })
    }
  }).then(data=>{
    res.redirect('invites');
  })
  
  
});

module.exports = router;
