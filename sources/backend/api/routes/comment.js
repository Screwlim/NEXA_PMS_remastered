var express = require('express');
var router = express.Router();
const path = require("path");
const fs = require('fs');
const {COMMENTS_ACTIVITY, COMMENTS_JOB, COMMENTS_NOTICES, COMMENTS_TASK} = require('../db/models');


router.post('/:pid/:src_type/:src_id', function(req, res) {
  console.log('comment in')
  switch(req.params.src_type){
    case '0':
      console.log('notice commnet 작성');
      COMMENTS_NOTICES.create({
        NOTICE_ID: req.params.src_id,
        AUTHOR_ID: req.user.ID,
        AUTHOR: req.user.NAME,
        CONTENT: req.body.comment
      }).then(()=> {
        res.redirect('/projects/'+req.params.pid+'/notices/'+req.params.src_id);
      })


      break;
    
    case '1':
      COMMENTS_JOB.create({

      })
      break;
    case '2':
      COMMENTS_TASK.create({
        
      })
      break;
    case '3':
      COMMENTS_ACTIVITY.create({
        
      })
      break;
    default:
      console.log("wrong src_type val : "+req.params.src_type);
      res.sendStatus(501);
  }

});

module.exports = router;