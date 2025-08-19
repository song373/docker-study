 # 사용할 기반 이미지 node.js 설치되어 있는 이미지
 FROM node:22-alpine

#작업디렉토리 경로
WORKDIR /app

#파일복사 package.json 파일을 복사
COPY package.json .

# 의존성 기반 설치
RUN npm install

# 나머지 프로젝트 관련 파일들 복사
COPY . .

#포트 선언 (React 앱 기본 포트 3000)
EXPOSE 3000

ENTRYPOINT [ "npm", "start" ]