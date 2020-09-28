var express = require('express');
const { isLoggedIn } = require('./middleware');
const { PROJECTS, ATTENDANCES } = require('../db/models');
const { Op } = require('sequelize');
var router = express.Router();

router.get('/', isLoggedIn,function(req, res) {
  console.log("in progress page");

  const getProj = async() => {
    var results = await PROJECTS.findAndCountAll({
      include :[{
        model: ATTENDANCES,
        where: {USER_ID : req.user.ID}
      }],
      where : { [Op.or] : [{STATUS : 0}, {STATUS : -2}]}
    });
    console.log(results);
    var val = [];
    res.render('inprogress',{projs: results});
    return results;
  }

  getProj();

  //res.render('inprogress');
});

module.exports = router;
