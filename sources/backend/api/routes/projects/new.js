var express = require('express');
var router = express.Router();
const { USERS, INVITES, PROJECTS, ATTENDANCES } = require('../../db/models');


/* GET users listing. */
router.get('/', function(req, res) {
  console.log("project create page");
  res.render('projects/new', {user: req.user});
});

router.post('/', function(req, res) {
  console.log("project create process");
  PROJECTS.create({
    NAME: req.body.project_name,
    START: req.body.start_date,
    END: req.body.end_date,
    CREATOR: req.user.NAME,
    CREATOR_ID: req.user.ID,
    DESCRIPTION: req.body.desc,
    NUM_TASKS: 0,
    NUM_DONE_TASKS: 0,
    STATUS: 0
  }).then(data => {

    ATTENDANCES.create({
      PROJECT_ID: data.ID,
      USER_ID: req.user.ID,
      ISPM: 1
    })

  })


  console.log(req.body);
  res.render('dashboard', {user: req.user});
});

module.exports = router;
