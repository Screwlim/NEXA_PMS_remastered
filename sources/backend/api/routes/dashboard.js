const express = require('express');
const { isLoggedIn, isNotLoggedIn } = require('./middleware');
const { PROJECTS } = require('../db/models');
const router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res, next) {

  console.log("dashboard process");

  const getProj = async() => {
    var results = await PROJECTS.findAll({
      where: {
        CREATOR: req.user.ID
      }
    });

    return results;
  }

  var projList = getProj();
  console.log('projList : ');
  console.log(projList);

  res.render('./dashboard',{
    user: req.user
  });
});

module.exports = router;
