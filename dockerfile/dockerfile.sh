# Dockerfile <-- 파일
# 이미지 생성하는 필요한 도커 명령어 코드들이 모여있는 설계도 역할의 파일


이미지 생성의 기반이되는 기본 이미지 설정
FROM 이미지  

도커파일을 기반으로 새로운 이미지를 "빌드"


도커파일 기반 빌드

# 현재 경로에 있는 Dockerfile에 작성된 내용을 기준으로 새로운 이미지를 빌드하겠다(만들겠다)
docker build -t 이미지이름 .

# 어떤 특정 경로에 있는 Dockerfile or 특정 Dockerfile 로 빌드하는 경우  -f 옵션
docker build -t 이미지이름 -f MyDockerfile .

docker build -t 이미지이름 -f ./dfol/MyDockerfile .



#dockerfile01 폴더 경로로 터미널 실행
#해당 경로에 있는 Dockerfile로 빌드
docker build -t mynewimage .

#생성된 이미지 조회
docker images 

#새로만든 이미지로 컨테이너 실행
docker run -d --name mynewcon mynewimage

#내부에 명령어 접근
docker exec -it mynewcon bash
#배시쉘 접근해서 명령어 실행
java -version

#컨테이너 삭제
docker rm -f mynewcon



COPY : 파일 또는 디렉토리 복사
COPY <Source> <Destination> 
# COPY <Host> <Container>
COPY . .
COPY *.jpg .



#dockerfile02 폴더
#폴더 내부에 test.txt 파일 생성

#이미지 빌드
docker build -t df2 .

#이미지 조회
docker images

#도커 컨테이너 실행
docker run -d --name df2 df2

docker ps -a
docker exec -it df2 bash 

#내부 접속 후 명령어
ls
cat text.txt

#폴더 내부에 abc.txt 파일 생성

docker rm -f df2

#추가된 파일까지 포함하려면 이미지를 다시 빌드해야한다
docker build -t df2 .
docker run -d --name df2 df2

#빌드, 컨테이너실행, 내부명령어 bash 접근
cd : 폴더이동
ls : 파일목록 확인 


# .dockerignore : 도커 처리시 무시하는 대상
# .gitignore 와 비슷함

# .dockerignore 파일 생성
abc.txt 


ENTRYPOINT : 컨테이너 시작했을때 실행할 명령어 설정
ENTRYPOINT ["/bin/bash", "-c", "sleep 500"]

/bin/bash -c sleep 500

#dockerfile03

docker build -t df3 .

docker run df3

docker rm -f df3

docker run -d --name df3 df3
docker ps -a
docker logs df3



RUN : 빌드(이미시 생성)시 컨테이너 내부에서 실행할 명령어 설정
# RUN 이미지 생성하는 과정에서 실행
# ENTRYPOINT 이미지 생성 후, 컨테이너 실행할때! 실행


#dockerfile04 폴더경로
docker build -t df4 .

docker images

docker run -d --name df4 df4
docker ps

docker exec -it df4 bash

#컨테이너 내부 bash 접근 명령어
git -v
#git 버전 체크


WORKDIR 작업 디렉토리 설정 (폴더)
작업을 진행하는 특정 폴더 기준

#dockerfile05 폴더 기준

docker build -t df5 .
docker run -d --name df5 df5
docker exec -it df5 bash


ls #파일목록
pwd   #현재 경로 위치



EXPOSE 컨테이너가 사용하는(열어두는) 포트번호를 외부적으로 공지 
* 공지역할

EXPOSE 9000

#ex)
docker run -d -p 5900:5900 image 
docker run -d -p 9000:9000 image 
docker run -d -p 8000:8000 image 
docker run -d -P image
    #호스트임시포트:컨테이너9000


ENV 환경변수 세팅


#명령어 기준
docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 \
        -v d:/study/docker-study/volume/mysql:/var/lib/mysql \
        -p 3306:3306 --name mysql mysql

#dockerfile06 폴더 기준
docker build -t df6 .
docker run -d -p 3306:3306 --name df6 df6
#Dockerfile에 ENV 설정이 되어있어서, 별도로 -e PW 세팅을 안하고 실행해도 된다
docker ps -a
#비밀번호같은 중요한 정보는 ENV로 설정을 고정해두는 것보다, 실행 시점에 -e 옵션으로 지정하는것을 권장


#내부 명령어 접근
docker exec -it df6 bash
# 컨테이너 내부에서 mysql DB서버 접속
mysql -u root -p    
# mysql 내부에서 실행
show databases;
#testdb 존재여부 확인