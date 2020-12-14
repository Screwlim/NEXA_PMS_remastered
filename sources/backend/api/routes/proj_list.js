var express = require('express');
const { isLoggedIn } = require('./middleware');
const { PROJECTS, ATTENDANCES } = require('../db/models');
const { Op } = require('sequelize');
var router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res, next) {
  console.log("project list process");

  const getProj = async() => {
    var projlist = await PROJECTS.findAndCountAll({
      include :[{
        model: ATTENDANCES,
        where: {USER_ID : req.user.ID}
      }],
      where : { [Op.or] : [{STATUS : 0}, {STATUS : -2}, {STATUS : -1}, {STATUS : 1}]}

    });

    res.render('projects/list_projects',{projs: projlist, user: req.user});
    return projlist;
  }

  getProj();
});

module.exports = router;
