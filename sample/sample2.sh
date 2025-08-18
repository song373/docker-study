 # DB 실행시키기
 # PostgreSQL DB

# pg-storage 라고 하는 도커 볼륨 생성
 docker volume create pg-storage

 # 도커 볼룜 조회
 docker volume ls

#postgres 이미지로 컨테이너 실행
# 볼룜 옵션 설정#
# 환경변수 옵션 설정
 docker run --name pgdb \
         -v pg-storage:/var/lib/postgresql/data \
         -e POSTGRES_PASSWORD=pgpw postgres
# 포그라운드로 실행한 

# Ctrl+C 눌러서 종료
# 컨테이너 삭제
docker rm -f pgdb


 docker run --name pgdb \
         -v pg-storage:/var/lib/postgresql/data \
         -e POSTGRES_PASSWORD=pgpw \
         -e POSTGRES_USER=postgres \
         -e POSTGRES_DB=mypgdb \
         -p 5432:5432 \
         postgres

# pgdb 컨테이너 내부 실행 (터미널 접근)
docker exec -it pgdb bash

#내부 bash 접속 상태에서 환경변수 확인
env

# 만들어진 도커 컨테이너 삭제
docker rm -f pgdb

# 도커 볼룜 조회
docker volume ls

# 도커 볼룜 삭제
docker volume rm pg-storage