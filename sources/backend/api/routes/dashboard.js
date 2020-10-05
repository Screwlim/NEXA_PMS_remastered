const express = require('express');
const { isLoggedIn } = require('./middleware');
const { PROJECTS, ATTENDANCES } = require('../db/models');
const { Op } = require('sequelize');
const router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res, next) {
  var projData;
  
  console.log("dashboard process");
  const getProj = async() => {
    console.log("start searching");
    projData = await PROJECTS.findAndCountAll({
      include :[{
        model: ATTENDANCES,
        where: {USER_ID : req.user.ID}
      }],
      where : { [Op.or] : [{STATUS : 0}, {STATUS : -2}]}
    });
    res.render('./dashboard',{
      user : req.user,
      proj : projData
    });
  }
  //need 비동기 절차 조정
  getProj();
});

module.exports = router;
