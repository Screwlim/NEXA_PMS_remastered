var express = require('express');
const { isLoggedIn } = require('./middleware');
const { PROJECTS, ATTENDANCES } = require('../db/models');
const { Op } = require('sequelize');
var router = express.Router();

router.get('/', isLoggedIn,function(req, res) {
  console.log("in progress page");

  PROJECTS.findAndCountAll({
    include :[{
      model: ATTENDANCES,
      where: {USER_ID : req.user.ID}
    }],
    where : { [Op.or] : [{STATUS : 0}, {STATUS : -1}]}
  }).then(projlist => {
    res.render('inprogress',{projs: projlist, user: req.user});
  })
});

module.exports = router;
