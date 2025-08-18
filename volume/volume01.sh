
#volume 저장 공간 (스토리지)

# DB 사용 컨테이너도 컨테이너 사용 종료 및 삭제하면? DB 데이터가 보존되지 않음.

# 컨테이너 외부에 데이터 저장을 위해 사용하는 개념 -> 도커 볼룜

# 도커 볼룜
# 1) 명시적인 볼룜 사용 (Volume)
# 2) 호스트의 특정 폴더 경로를 이용 (Bind Mount)




# 1) 호스트의 특징 폴더 경로를 이용 (Bind Mount)
# -v 호스트 디렉토리 경로 : 컨테이너 디렉토리 경로

# MySQL DB 사용 기반 확인




#

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 -p 3306:3306 mysql

# -p 포트매핑 호스트포트:컨테이너포트

# 컨테이너ID 확인
docker ps

# 내부 명령어 실행
docker exex -it [id] bash

# mysql 컨테이너 내부에서 실행

# 환경변수 확인
env
export
echo $환경변수명
echo $MYSQL_ROOT_PASSWORD

# 컨테이너 내부에서 mysql DB서버 접속
mysql -u root -P

# mysql 내부에서 실행
show databases;
create database testdb;

# testdb 만들어진거 확인


# 기존 만들어진 컨테이너 삭제
docker rm -f d20a

# 다시 컨테이너 실행
docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 -p 3306:3306 --name mysql mysql

docker exec -it mysql bash
mysql -u root -p
show databases;

### ---------------------------------------------------

#기존 컨테이너 삭제
docker rm -f mysql

### Volume 사용하기
# -v 호스트경로:컨테이너경로

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 \
         -v d:/study/docker-study/volume/mysql:/var/lib/mysql \
         -p 3306:3306 --name mysql mysql

#내부
docker exec -it mysql bash

#경로 이동
cd /var/lib/mysql
#파일 목록 조회
ls

#호스트 저장 경로 : 컨테이너 내부에 있는 폴더


#컨테이너 내부에서 mysql DB서버 접속
mysql -u root -p

# mysql 내부에서 실행
show databases;
create database testdb;


# 도커 컨테이너 삭제후 재실행하여, testdb 가 유지되는지 확인
docker rm -f mysql

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 \
         -v d:/study/docker-study/volume/mysql:/var/lib/mysql \
         -p 3306:3306 --name mysql mysql

         #내부 명령어 접근
         docker exec -it mysql bash
         #컨테이너 내부에서 mysql DB서버 접속
         mysql -u root -p
         #mysql 내부에서 실행
         show databases;
         #testdb 존재여부 확인
