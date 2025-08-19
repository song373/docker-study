문제 1

요구사항:
nginx 웹서버를 백그라운드에서 실행하고,
컨테이너 이름을 web1으로 설정한다.
호스트의 8080 포트를 컨테이너의 80 포트와 연결해라.

docker run -d --name web1 -p 8080:80 nginx


문제 2

요구사항:
MySQL 컨테이너를 실행하되,
컨테이너 이름은 mymysql,
루트 비밀번호는 rootpw123,
호스트의 3307 포트를 컨테이너의 3306 포트와 연결해라.
백그라운드 실행 옵션도 사용해야 한다.

docker run -e MYSQL_ROOT_PASSWORD=rootpw123 --name mymysql -p 3307:3306 -d mysql

문제 3

요구사항:
Redis 컨테이너를 실행하되,
컨테이너 이름은 myredis,
환경변수로 비밀번호(REDIS_PASSWORD=secret123)를 설정한다.
호스트의 6379 포트를 컨테이너의 6379 포트로 연결하고 백그라운드에서 실행해라.