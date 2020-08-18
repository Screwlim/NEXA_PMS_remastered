const express = require('express');
const path = require('path'); //경로 관리 미들웨어 모듈

const routes = require('./api/routes/index');

const app = express();
//view engine setup
app.set('views', path.join(__dirname, '../web_frontend/dist'));
app.set('view engine', 'ejs');

//default route
app.use('/', routes);

const http = require('http'); //서버 구동을 위한 http 모듈 import
const port = process.env.PORT || 3000; // env variable vs hard coding default
// process.env : nodejs의 환경변수에 접근. 호스팅하는 환경/provider에 따라 값이 제공됨 

http.createServer(app).listen(app.get('port'), function () {// 서버 생성 및 실행
    console.log("server start using Express on port : " + app.get('port'));
});


