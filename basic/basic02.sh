
# 로그 확인

# 포그라운드 실행
docker run -p 9922:80 --name ngx1 nginx

# Ctrl + C 눌러서 종료 가능

# 기존 실행 후, 중지한 컨테이너 삭제
docker rm -f ngx1

# 다시 백그라운드 실행
docker run -d -p 9922:80 --name ngx1 nginx



#로그 추력
docker logs 컨테이너이름 or 컨테이너ID

# 끝부분 몇줄만 출력
docker logs --tail 출력할줄수 컨테이너이름 or 컨테이너ID

docker logs --tail 10 ngx1
docker logs --tail 5 ngx1

# 로그를 계속 추적 출력 follow
docker logs -f ngx1 

# --since Xs ~부터
# --util Xs  ~까지
# 명령어를 실행하는 현재 시점 기준

docker logs --since 20s ngx1
docker logs --until 20s ngx1

#최근 60초
docker logs --singce 60s ngx1

# 1분전부터 2분전까지
# s : second 초단위
# m : minute 분단위
docker logs --since 120s --until 60s ngx1
docker logs --since 5m --until 1m ngx1


# 최근 로그 확인 + 실시간 팔로우 로그 추적
docker logs --tail 6 -f ngx1

# 로그 추적 출력 중 Ctrl + C 눌러서 로그 출력 중지 가능