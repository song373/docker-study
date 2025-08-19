 #리액트 프로젝트 nginx 에 배포하는 형태

 # 리액트 프로젝트 생성
 npx create-react-app my-prod-app

 # my-prod-app 루트경로에서 Dockerfile 생성

 # my-prod-app 루트경로에서 .dockerignore 생성

 # 이미지 빌드

 docker build -t my-prod-app .

 docker images

 #컨테이너 실행
docker run -d -p 9090:80 --name my-prod-app my-prod-app

docker ps -a

docker exec -it my-prod-app bash

#내부 명령어
cd /usr/share/nginx/html
ls

#컨테이너 삭제
docker rm -f my-prod-app