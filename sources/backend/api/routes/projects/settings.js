var express = require('express');
var router = express.Router();
const {PROJECTS} = require('../../db/models');
/* GET users listing. */

router.get('/status/:status', function(req, res){
  if(req.isPM){
    if(req.params.status == 'complete'){
      PROJECTS.findOne({
        where : {
          ID: req.pid
        }
      }).then(data=>{
        data.STATUS = 1; // Completed status value = 1
        data.save()
      }).then(()=>{
        res.redirect('/proj_list');
      })
    }else if(req.params.status == 'cancel'){
      PROJECTS.findOne({
        where : {
          ID: req.pid
        }
      }).then(data=>{
        data.STATUS = -2; // Canceled status value = -2
        data.save()
      }).then(()=>{
        res.redirect('/proj_list');
      })
    }
  }
});

router.get('/', function(req, res) {
  res.render('project/settings',{
    user: req.user,
    proj: req.proj,
    isPM: req.isPM,
    invites: req.invites
  });
});

router.post('/', function(req,res) {
  console.log("project setting changed");

  if(req.isPM){
    PROJECTS.findOne({
      where : {
        ID: req.pid
      }
    }).then(data =>{
      data.NAME = req.body.name,
      data.DESCRIPTION = req.body.projectDesc,
      data.START_DATE = req.body.start_date,
      data.END_DATE = req.body.end_date
      data.save();
    }).then(data =>{
      res.redirect('/projects/'+req.pid);
    })
  }else{
    res.status(403).render('./err/error-403.pug');
  }





})

module.exports = router;
