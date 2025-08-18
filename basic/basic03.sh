# 컨테이너 내부 명령어 실행.

#busybox 이미지 실행
docker run -d --name busybox busybox

#전체 도커 컨테이너 조회
docker ps -a

#도커 컨테이너 busybox 삭제
docker rm -f busybox

#도커 컨테이너는 어떠한 실행되는 프로세스가 존재해야 컨테이너가 계속 실행상태로 유지됨
#프로세스가 없으면 컨테이너는 바로 종료됨

#busybox 이미지로 무한 sleep 상태로 실행
docker run -d --name busybox busybox sleep infinite
 #테스트용 작은 리눅스
#sleep 무한으로 돌아라~ 라는 프로세스가 수행 중이기 때문에, 컨테이너가 종료되지 않고 유지

#도커 컨테이너 확인
docker ps

# execute 실행한다
docker exec -it busybox sh
# busybox 라는 이름의 컨테이너에게 sh(커멘드창) 명령어를 수행하도록 시키겟다
# -it 실시간 대화형 (현재 터미널 창에서 연결된 상태로 사용)

# 접속된 상태에서는 리눅스 명령어로 수행 확인
ls #현재 경로에 존재하는 파일목록
lfconfig #아이피 주소 확인 (도커 컨테이너 내부의 주소)


# 실행중인 컨테이너 삭제
docker rm -f busybox

#nginx 컨테이너 실행
docker run -d nginx

# 컨테이너 내부 명령어 실행 (bash 커맨드 창 실행) -> 내부에 연결
docker exec -it a98a bash

#내부 확인
ls #파일목록 조회
cd # 경로 변경
cd /etx/nginx
cat nginx.cinf #cat 화면에 표시(출력)

#nginx 컨테이너 os 관련 정보 출력
cat /etc/os-release