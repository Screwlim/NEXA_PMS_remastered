//renewed server.js by Screwlim
var http = require('http');
var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');
var cors = require('cors'); // 다른 서버로 접근하기위해서 사용

//server start----------------------------------------------------------------------------------------------------
var app = express();
app.set('port', process.env.PORT || 3000); //포트 지정
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); //post방식으로 데이터 받기위해 2줄 적어야한다
app.use(cors());

app.use('node_modules', express.static(path.join(__dirname, '/node_modules')));
app.set('views', __dirname + '../web_frontend/dist');
app.set('views engine', 'ejs');
app.engine('html', require('ejs').renderFile);

http.createServer(app).listen(app.get('port'), function () {
    console.log("익스프레스로 웹 서버를 실행함 : " + app.get('port'));
    console.log("ver new 0715.1705");
}) //express를 이용해 웹서버 만든다

//routers----------------------------------------------------------------------------------------------------
var indexrouter = require('./index');
var loginrouter = require('./routes/log_in');
var dashrouter = require('./routes/dashboard');
var tablerouter = require('./routes/ingprojectlist');
var projdetailrouter = require('./routes/project_detail');
var signuprouter = require('./routes/signup');
var servicerouter = require('./routes/service');
var createProject = require('./routes/create');

//session
var session = require('express-session');
var MySQLStore = require('express-mysql-session');
var options = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    database: 'pmDB'
};
var sessionStore = new MySQLStore(options);

app.use(session({
    secret: '@#@$MYSIGN#@$#$',//임시 세션키값
    resave: false,//세션 상시 저장할지 정하는 flag
    saveUninitialized: true,
    store: sessionStore
}));

//routers
app.use('/', indexrouter);
app.use('/login', loginrouter);
app.use('/dashboard', dashrouter);
app.use('/ingprojectlist', tablerouter);
app.use('/project_detail', projdetailrouter);
app.use('/signup', signuprouter);
app.use('/service', servicerouter);
app.use('/create', createProject);



app.use(function (req, res) {
    res.status(404).send('Sorry, Cannot find the page...');
});

app.use(function(err, req, res, next) {
    console.error(err.stack);
    res.status(500).send('Error occured!');
});
