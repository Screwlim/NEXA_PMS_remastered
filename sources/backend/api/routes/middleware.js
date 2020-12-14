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
