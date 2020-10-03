var express = require('express');
var router = express.Router();
const { USERS, INVITES, PROJECTS } = require('../../db/models');


/* GET users listing. */
router.get('/', function(req, res) {
  console.log("project create page");
  res.render('projects/new', {user: req.user});
});

router.post('/', function(req, res) {
  console.log("project create process");

  

  console.log(req.body);
  res.render('projects/new', {user: req.user});
});

module.exports = router;
