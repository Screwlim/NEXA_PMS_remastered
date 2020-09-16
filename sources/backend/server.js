const express = require('express');
const path = require('path'); //경로 관리 미들웨어 모듈
const bodyParser = require('body-parser');// body parser
const cookieParser = require('cookie-parser');
const session = require('express-session');
const passport = require('passport');
const flash = require('connect-flash');
require('dotenv').config();

const routes = require('./api/routes/index');//routing directory
const morgan = require('morgan');//logger를 위해 morgan 모듈 import
const http = require('http'); //서버 구동을 위한 http 모듈 import
const port = process.env.PORT || 3000; // env variable vs hard coding default
// process.env : nodejs의 환경변수에 접근. 호스팅하는 환경/provider에 따라 값이 제공됨 

/* PASSPORT INIT */
const passportConfig = require('./api/passport');
passportConfig(passport)

/* SEQUELIZE INIT */
const { sequelize } = require('./api/db/models');
sequelize.sync();

const app = express();
app.use(morgan('dev'));//logger init

/* VIEW SETTING */
//view engine setup - html
// app.set('views', path.join(__dirname, '../web_frontend/dist/'));
// app.set('view engine', 'ejs');
// app.engine('html', require('ejs').renderFile);
// app.use(express.static('../web_frontend/dist/'))//static file(css, javascipt, image, etc..)을 제공하기 위해 express.static활용 (경로 제공) - express doc 참고할것

//view engine setup - pug
app.set('views', path.join(__dirname, '../web_frontend/src/pug/pages'));
app.set('view engine', 'pug');
app.engine('html', require('pug').renderFile);
app.use(express.static('../web_frontend/src/js'))//static file(css, javascipt, image, etc..)을 제공하기 위해 express.static활용 (경로 제공)
app.use(express.static('../web_frontend/src/scss'))
app.use(express.static('../web_frontend/src/assets'))
app.use(express.static('../web_frontend/src/'))

/* SESSION SETTING */
app.use(cookieParser(process.env.COOKIE_SECRET));
app.use(session({
    resave: false,
    saveUninitialized: false,
    secret: process.env.COOKIE_SECRET,
    cookie: {
        httpOnly: true,
        secure: false, //https적용시 true가능
    },
}));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

app.set('port', port);//set port number

//default route
app.use('/', routes);

app.use((req, res, next) => {
    const err = new Error('Not Found');
    err.status = 404;
    next(err);
});
  
app.use((err, req, res, next) => {
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};
    res.status(err.status || 500);
    if(err.status === undefined){
        var status = 500;
    }else{
        var status = err.status;
    }
    res.render('./err/error-'+status);
});

http.createServer(app).listen(app.get('port'), function () {// 서버 생성 및 실행
    console.log("server start using Express on port : " + app.get('port'));
});