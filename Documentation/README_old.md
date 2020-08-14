# NEXA server 구성

현재 서버는 AWS를 활용중이며, 8월 중으로 사내 서버를 구축할 예정이다.
서버는 NodeJS를 기반으로 구성되어 있으며, 어플리케이션과 웹으로 각각 따로 생성되어 있다. 

공용파일, 웹, 앱으로 파일들을 분류할 수 있다.

### 공용파일
mysql-db.js : MySql 데이터베이스 연동을 위해 connection에 대한 정보를 가지고 있다.

### 앱
**앱 안드로이드 빌드 방법**
1) myApp 폴더로 간다.
2) ionic capacitor run android
3) 안드로이드 스튜디오에서 이 프로젝트를 연다.
4) build메뉴에서 apk로 만들기를 클릭한다.

### 웹
웹의 경우 다음과 같은 구조를 가지고 있다.

old_server.js : 이전 프로젝트 진행의 결과, refactoring 이전의 코드로 백업 및 참고용.
server.js : 서버를 실행 및 초기 동작을 구성한다.
/views : html 및 ejs파일로 웹 상의 view를 관리한다.
/routes : javascript파일로 각 웹페이지들의 동작을 관리한다.
/node_modules, package.json, package-lock.json : npm(패키지 관리 프로그램)에서 자동생성된 파일이다. 사용하는 모듈의 정보를 담고 있다.

