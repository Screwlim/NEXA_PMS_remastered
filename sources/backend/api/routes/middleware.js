const { INVITES,USERS, PROJECTS } = require('../db/models');
const { Op } = require('sequelize');

exports.isLoggedIn = (req, res, next) => {
  if (req.isAuthenticated()) {
    console.log(`user ${req.user.NAME} authorized`)
    next();
  } else {
    res.status(403).render('./err/error-403.pug');
  }
};
  
exports.isNotLoggedIn = (req, res, next) => {
  if (!req.isAuthenticated()) {
    next();
  } else {
    console.log(`user ${req.user.NAME} loggedin`)
    res.redirect('/dashboard');
  }
};

exports.checkInvitation = (req, res, next) => {
  INVITES.findAll({
    include : [{
      model : USERS
    }, {
      model: PROJECTS
    }],
    where: {
      [Op.and] : [
        {RECV_USER_ID: req.user.ID},
        {STATUS: 0}
      ]
    }
  }).then(data => {
    req.invites = data
    next();
  })
}
