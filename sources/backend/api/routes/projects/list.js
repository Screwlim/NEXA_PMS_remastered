var express = require('express');
const { isLoggedIn } = require('../middleware');
const { PROJECTS, ATTENDANCES } = require('../../db/models');
var router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res, next) {
  console.log("project list process");

  const getProj = async() => {
    var results = await PROJECTS.findAll({
      include :[{
        model: ATTENDANCES,
        where: {USER_ID : req.user.ID}
      }]
    });
    projData = JSON.stringify(results);
    console.log(projData);
    return projData;
  }

  getProj();

  res.render('projects/list', {user: req.user});
});

module.exports = router;
