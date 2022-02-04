-- 연습문제 : 작성자 김땡땡 -> 스크립트 화면 캡쳐해서 dm 보내주세요.

--1 . jobs 테이블 문제
--1) min_salary 컬럼이 10000이상인 Job_title 조회
--2) job_title 컬럼이 programmer 인 행의 모든 컬럼 조회
--3) max_salary 컬럼의 최대값 조회
--2. locations 테이블 문제
--1) city 컬럼이 London 인 postal_code 컬럼 조회
--2) LOCATION_ID 컬럼이 1700 , 2700, 2500이 아니고 city 컬럼이 Tokyo 인 행의 모든 컬럼 조회


--연습문제 작성자 정다산
--1.jobs 테이블 문제
	--1)min_salary 컬럼이 10000이상인 Job_title조회
		SELECT job_title FROM JOBS j WHERE MIN_SALARY  >=10000;
	--2)job_title 컬럼이 programmer 인 행의 모든 컬럼 조회
		SELECT *FROM JOBS j WHERE job_title ='programmer';
		SELECT *FROM JOBS j WHERE job_title ='Programmer';
		-- 대소문자 상관없이 조건 검색한다면 문자열 관련 오라클 함수 : upper(), lower() 이용합니다.
		SELECT *FROM JOBS j WHERE UPPER(job_title)  ='PROGRAMMER';
		SELECT *FROM JOBS j WHERE LOWER(job_title)  ='programmer';
	
	--3)max_salary 필드값의 컬럼의 최대값 조회
		SELECT MAX(max_salary) FROM JOBS j ;
	
	--미해결>> 추가 : min_salary 의 평균값보다 작은 행의 job_id,job_title 컬럼 조회 -
	--      아래 명령은 오류 -> group 진도 후에 다시 해봅니다.
		SELECT job_id ,job_title FROM JOBS j WHERE MIN_SALARY < AVG(MIN_SALARY); 

--2. locations 테이블 문제
	--1)city 컬럼이 Lodon 인 postal_code 조회
		SELECT postal_code FROM LOCATIONS l WHERE CITY  ='London';
		SELECT postal_code FROM LOCATIONS l WHERE CITY  ='Seattle';
	
	--2)LOCATIONAL_ID컬럼이 1700,2700,2500이 아니고 city 컬럼이 Tokyo인 행의 모든 컬럼 조회
	SELECT *FROM LOCATIONS l WHERE LOCATION_ID NOT IN (1700,2700,2500) AND  CITY ='Tokyo';




