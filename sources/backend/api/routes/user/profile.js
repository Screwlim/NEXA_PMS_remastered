var express = require('express');
const { USERS } = require('../../db/models');
var router = express.Router();
var multer = require('multer');
var path = require('path');

const upload = multer({
  storage: multer.diskStorage({
    //위치 지정
    destination: (req, file, done) => {
      done(null, "../web_frontend/src/assets/img/prof");
    }, 
    filename: (req, file, done) => {
      const ext = path.extname(file.originalname);
      done(null, path.basename('profile_image_user'+req.user.ID, ext)+ ext);
      // cb(null, new Date().valueOf() + path.extname(file.originalname));
    }
  })
});

/* GET users listing. */
router.get('/', function(req, res) {
  console.log("user profile");
  res.render('user/profile', {user: req.user});
});

router.post('/', upload.single('profileImage'), function(req, res) {
  console.log("user profile update");

  USERS.findOne({
    where: {
      ID: req.user.ID
    }
  }).then(data => {
    data.NAME = req.body.name;
    data.COMPANY = req.body.company;
    data.POSITION = req.body.position;
    data.PHONENUMBER = req.body.phonenumber;
    data.COMPANYNUMBER = req.body.companynumber;
    data.prof_img_url = '../../assets/img/prof/'+req.file.filename;
    data.save();
  }).then(data=>{
    res.redirect('/user/profile');
  })
})


module.exports = router;
