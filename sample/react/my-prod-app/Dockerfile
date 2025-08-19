#node.js 이미지 기반 빌드용으로 사용
FROM node:22-alpine AS build

#작업 디렉토리 /usr/app 이라는 폴더 경로를 기준으로 실행
WORKDIR /usr/app

# package.json 파일을 복사
COPY package.json .

# package.json 파일 내용을 기준으로 라이브러리 의존성 설치
# npm install 명령어 실행 (RUN)
RUN npm install

# 현재경로 파일 -> 컨테이너 WORKDIR 경로 복사
COPY . .

# npm run build 명령어 실행 (RUN) -> 리액트 프로젝트 빌드 수행
RUN npm run build

# 배포용 기반 이미지 nginx(웹서버)
FROM nginx

#빌드용 컨테이너에서 만드렁진 build 폴더 내의 파일들을 /usr/share/nginx/html 경로로 복사
COPY --from=build /user/app/build /user/share/nginx/html
# nginx 폴더 구조.../usr/share/nginx/html