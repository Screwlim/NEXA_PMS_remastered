const express = require('express');
const { isLoggedIn } = require('./middleware');
const { PROJECTS, ATTENDANCES } = require('../db/models');
const router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res, next) {

  console.log("dashboard process");
  const getProj = async() => {
    var results = PROJECTS.findAll({
      include :[{
        model: ATTENDANCES,
        where: {USER_ID : req.user.ID}
      }]
    });
    projData = JSON.stringify(results);
    console.log(projData);
    console.log(results);
    return results;
  }
  //need
  var proj = getProj();
  userData = JSON.stringify(req.user);
  projData = JSON.stringify(proj);
  var test = [1,2,3,4,5]
  console.log('User\'s proj :' + projData);
  res.render('./dashboard',{
    user : req.user,
    test : test
  });
});

module.exports = router;
