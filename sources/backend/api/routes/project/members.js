var express = require('express');
var router = express.Router();
const {ATTENDANCES, USERS, INVITES, sequelize} = require('../../db/models');
const { Op, QueryTypes } = require('sequelize');

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("인원 관리 process");
  sequelize.query(
    'select * from USERS where ID not in ( select RECV_USER_ID from INVITES WHERE PROJECT_ID = '+ req.query.pid +' AND STATUS != -1 )',
    {type : QueryTypes.SELECT}
  ).then(data => {
    userlist = data;
    INVITES.findAll({
      include : [{
        model : USERS,
        on : sequelize.where(sequelize.col("INVITES.RECV_USER_ID"), "=", sequelize.col("ID")),
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
  if(Array.isArray(req.body.invited)) {
    req.body.invited.forEach(function(invitedUser){
      INVITES.create({
        PROJECT_ID: req.query.pid,
        SEND_USER_ID: req.user.ID,
        RECV_USER_ID: invitedUser
      }).then(data => {
        res.redirect('/project/members?pid='+req.query.pid);
      })
    });  
  } else {
    INVITES.create({
      PROJECT_ID: req.query.pid,
      SEND_USER_ID: req.user.ID,
      RECV_USER_ID: req.body.invited
    }).then(data => {
      res.redirect('/project/members?pid='+req.query.pid);
    })
  }
});

module.exports = router;
