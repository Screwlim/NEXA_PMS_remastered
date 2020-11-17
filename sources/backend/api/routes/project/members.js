var express = require('express');
var router = express.Router();
const {ATTENDANCES, USERS, INVITES} = require('../../db/models');
const { Op } = require('sequelize');

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("인원 관리 process");
  USERS.findAll({
    where: { 
      ID : {
        [Op.not] : req.user.ID 
      }
    }
  }).then(data => {
    userlist = data;
    INVITES.findAll({
      include : [{
        model : USERS
      }],
      where: {
        PROJECT_ID : req.query.pid
      }
    }).then(data =>{
      invited_list = data
      ATTENDANCES.findAll({
        include : [{
          model : USERS
        }],
        where :{
          PROJECT_ID: req.query.pid
        }
      }).then(data => {
        console.log(data);
        res.render('project/members', {
          pid: req.query.pid,
          user: req.user,
          members: data, 
          invites: invited_list,
          userstoinvite: userlist
        });
      });
    });
  });  
});

router.post('/', function(req, res) {
  console.log(`invite 값: ${req.body.invited}`);

  if(Array.isArray(req.body.invited)) {
    req.body.invited.forEach(function(invitedUser){
      INVITES.create({
        PROJECT_ID: req.query.pid,
        SEND_USER_ID: req.user.ID,
        RECV_USER_ID: invitedUser
      });
    });  
  } else {
    INVITES.create({
      PROJECT_ID: req.query.pid,
      SEND_USER_ID: req.user.ID,
      RECV_USER_ID: req.body.invited
    });
  }
  res.redirect('/project/members?pid='+req.query.pid);
});

module.exports = router;
