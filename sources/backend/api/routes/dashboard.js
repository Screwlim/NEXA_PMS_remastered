const express = require('express');
const { isLoggedIn, isNotLoggedIn } = require('./middleware');
const { PROJECTS,USERS } = require('../db/models');
const router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res, next) {

  console.log("dashboard process");
  console.log(req.session);
  console.log(req.user);

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

  res.render('./dashboard.html');
});

module.exports = router;
