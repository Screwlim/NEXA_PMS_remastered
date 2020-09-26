const express = require('express');
const { isLoggedIn } = require('./middleware');
const { PROJECTS, ATTENDANCES } = require('../db/models');
const router = express.Router();

/* GET users listing. */
router.get('/', isLoggedIn,function(req, res, next) {
  var results;

  console.log("dashboard process");
  const getProj = async() => {
    console.log("start searching");
    results = await PROJECTS.findAll({
      include :[{
        model: ATTENDANCES,
        where: {USER_ID : req.user.ID}
      }]
    });
    res.render('./dashboard',{
      user : req.user,
      proj : results
    });
  }
  //need 비동기 절차 조정
  getProj();
});

module.exports = router;
