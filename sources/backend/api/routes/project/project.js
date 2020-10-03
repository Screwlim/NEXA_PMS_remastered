var express = require('express');
var router = express.Router();
const { PROJECTS } = require('../../db/models');

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("project " + req.query.pid+ " process");

  const getProj = async() => {
    var proj = await PROJECTS.findOne({
      where : {ID : req.query.pid}
    });
    console.log(proj)

    res.render('project/project', {proj: proj, user: req.user});
    return 0;
  }

  getProj();

});

module.exports = router;
