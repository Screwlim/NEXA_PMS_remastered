const express = require('express');
const { isLoggedIn } = require('./middleware');
const { PROJECTS, ATTENDANCES } = require('../db/models');
const { Op } = require('sequelize');
const router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res) {
  var projData;
  
  console.log("dashboard process");
    PROJECTS.findAndCountAll({
      include :[{
        model: ATTENDANCES,
        where: {USER_ID : req.user.ID}
      }],
      where : { [Op.or] : [{STATUS : 0}, {STATUS : -2}]}
    }).then(data=>{
      res.render('./dashboard',{
        user : req.user,
        proj : data
      });
    })
    
});

module.exports = router;
