
# doctorkirk/oracle-19c 이미지 컨테이너 실행 오류시 처리

#컨테이너 접속
docker exec -it oracle19c bash

#sqlplus 접속
sqlplus / as sysdba 

#제대로 실행이 안된 상태
Connected ..... idle instance.
ORA-01034: ORACLE not available

#오라클 인스턴스 실행
startup   
# 인스턴스 실행을 시도 하였으나, 파일이 없어서 실행이 안됨.
# could not open parameter file '/opt/oracle/product/19c/dbhome_1/dbs/initorcl.ora' 

#관련 설정 파일
cd /opt/oracle/admin/ORCL/pfile

# init.ora 파일을 -> /opt/oracle/product/19c/dbhome_1/dbs/initorcl.ora 복사
# init.ora.xxxxxxx

# 해당 파일이 위치한 경로에 있는 경우
cp init.ora /opt/oracle/product/19c/dbhome_1/dbs/initorcl.ora

# 경로로 이동하지 않고, 전체경로로 입력 (full path)
cp /opt/oracle/admin/ORCL/pfile/init.ora /opt/oracle/product/19c/dbhome_1/dbs/initorcl.ora

# 복사한 설정파일 존재 확인
cd /opt/oracle/product/19c/dbhome_1/dbs
ls

# DB 인스턴스 종료 후 재시작
sqlplus / as sysdba
SHUTDOWN ABORT;   #강제종료

#실행
STARTUP NOMOUNT;
ALTER DATABASE MOUNT;
ALTER DATABASE OPEN;


#---------------
# 계정으로 접속 시도시, 계정이 잠겼다는 메시지 발생하는 경우 (LOCK)
docker exec -it oracle19c bash
sqlplus / as sysdba
# 계정 잠금해제
ALTER USER scott ACCOUNT UNLOCK;

#비밀번호가 만료되었다 발생하는 경우
ALTER USER scott IDENTIFIED BY tiger;

#계정상태확인
select * from ALL_USERS where username = 'SCOTT';


#---DB 인스턴스는 실행이 됐는데, 접속하는 과정에서 리스너가 인식되지 않는다!

# 오라클 DB 리스너 재시작
lsnrctl stop
lsnrctl start

# 리스너 상태확인
lsnrctl status

#----- 리스너 설정파일
/opt/oracle/oradata/dbconfig/ORCL/tnsnames.ora 
/opt/oracle/product/19c/dbhome_1/network/admin/tnsnames.ora 

# 접속시 해당 서비스이름의 리스너가 없다. 리스너 인식 오류 케이스

tnsnames.ora 파일 내부에 누락된 아래 내용을 추가 작성

ORCL =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = orcl)
    )
  )


# 수정방법 
# 리눅스 문서편집 vi
vi tnsnames.ora  

# i : insert 모드
# 내용 입력
# esc ->   :wq       #저장하고 종료