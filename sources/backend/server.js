const express = require('express');
const path = require('path'); //경로 관리 미들웨어 모듈
const bodyParser = require('body-parser');// body parser

const routes = require('./api/routes/index');
const morgan = require('morgan');//logger를 위해 morgan 모듈 import
const http = require('http'); //서버 구동을 위한 http 모듈 import
const port = process.env.PORT || 3000; // env variable vs hard coding default
// process.env : nodejs의 환경변수에 접근. 호스팅하는 환경/provider에 따라 값이 제공됨 

const app = express();
app.use(morgan('dev'));

//view engine setup - html
app.set('views', path.join(__dirname, '../web_frontend/dist/'));
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

//view engine setup - pug
// app.set('views', path.join(__dirname, '../web_frontend/src/pug/pages'));
// app.set('view engine', 'pug');
// app.engine('html', require('pug').renderFile);

app.use(express.static('../web_frontend/dist/'))//static file(css, javascipt, image, etc..)을 제공하기 위해 express.static활용 (경로 제공) - express doc 참고할것
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.set('port', port);//set port number

//default route
app.use('/', routes);

http.createServer(app).listen(app.get('port'), function () {// 서버 생성 및 실행
    console.log("server start using Express on port : " + app.get('port'));
});


