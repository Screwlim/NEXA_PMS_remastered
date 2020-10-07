var express = require('express');
var router = express.Router();
const { NOTICES } = require('../../db/models');


/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("project notice list process");
  res.render('project/notice-list',{
    user: req.user,
    pid: req.query.pid
  });
});

router.get('/detail', function(req, res, next) {
    console.log("project notice list process");

    const getNotice = async() => {
      var results = await NOTICES.findAll({
        where: {
          CREATOR: req.user.ID
        }
    })};

    const results = getNotice();
    
    console.log(results);
    console.log(req.user);
    res.render('project/notice-detail',{
      user: req.user,
      pid: req.query.pid
    });
  });

module.exports = router;
