const express = require('express');
const { isLoggedIn } = require('./middleware');
const { PROJECTS, ATTENDANCES, LOG } = require('../db/models');
const { Op } = require('sequelize');
const router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res) {
  var projData;
  
  console.log("dashboard process");
    PROJECTS.findAll({
      include :[{
        model: ATTENDANCES,
        where: {USER_ID : req.user.ID}
      }],
      where : { [Op.or] : [{STATUS : 0}, {STATUS : -1}]} //정상 진행중 or 지연 진행중
    }).then(data=>{
      proj = data
      LOG.findAll({
        where: {USER_ID : req.user.ID}
      }).then(data => {
        console.log(proj);
        console.log(data);
        res.render('./dashboard',{
          user : req.user,
          projs : proj,
          logs: data
        });
      })
    })
    
});

module.exports = router;
