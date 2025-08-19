 # 리액트 프로젝트 생성
npx create-react-app my-react-app

리액트 프로젝트 최상단 경로(root) 경로에서  Dockerfile 생성
...도커파일 생성

불필요한 파일 복사를 막기위해 .dockerignore 파일 생성 -> 작성

#도커 이미지 빌드
docker build -t docker-my-react-app .

#생성이미지 확인
docker images

#컨테이너 실행
docker run -d --name docker-my-react-app -p 3030:3000 docker-my-react-app

docker ps -a

#docker exec -it docker-my-react-app bash
docker exec -it docker-my-react-app sh

/app 경로에 리액트프로젝트 파일들 확인

docker rm -f docker-my-react-app
