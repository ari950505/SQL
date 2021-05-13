select * from notice;

INSERT into notice
(ID, TITLE , WRITER_ID, CONTENT, REGDATE, HIT, FILEs)


values
(1,'선반-접시-그릇 이 세가지요~~`','okay','soso','2021-05-07',0,'BC.jpg');


INSERT  INTO NOTICE
(ID, TITLE , WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(3444,'전화번호는 123-456-344 이메일로 연락 주시기 바랍니다. mrsono0@abc.com','2222' ,'666','2021/05/07',00,'BC.jpg');

INSERT  INTO NOTICE
(ID, TITLE , WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(322,'전화번호는 016-456-3445 이메일로 연락 주시기 바랍니다. mrsono0@abc.com','44422' ,'000','2021/05/07',00,'BC.jpg');

delete 
from notice
where id=123;

SELECT * FROM NOTICE WHERE TITLE LIKE '%-%-%';--
SELECT * FROM NOTICE


-- 010-1111-1111
-- 016-1111-1111
-- 018-1111-1111
-- 017-1111-1111
-- 019-1111-1111
-- \D\D\D-\D\D\D\D-\D\D\D\D  숫자 / \w 문자 \w+ more than one letter
-- 01[6-9] - \D{3,4}-\D{4}
-- ^01[6-9]-\D{3,4}-\D{4}$


-- 이메일로 연락 주시기 바랍니다. mrsono0@abc.com
-- \w@\w+.(org|net|com)


SELECT * 
FROM NOTICE 
WHERE REGEXP_LIKE(title, '\w@\w+.(org|net|com)');

SELECT * 
FROM NOTICE 
WHERE REGEXP_LIKE(title, '01[016-9]-\d{3,4}-\d{4}');

--숫자 함수
SELECT ROUND(45.923,2), ROUND(45.923,0),ROUND(45.923,-1) FROM DUAL; -- 반올림
SELECT TRUNC(45.923,2),TRUNC(45.923),TRUNC(45.923,-1) FROM DUAL; --버림

SELECT SYSDATE FROM DUAL;

SELECT first_name,(SYSDATE - hire_date) / 7 AS "Weeks"
FROM HR.employees
WHERE department_id = 60 ;

SELECT first_name,round((SYSDATE - hire_date) / 7,0 )AS "Weeks"
FROM HR.employees
WHERE department_id = 60 ;

SELECT SYSTIMESTAMP FROM DUAL;


-- 변환 함수: 실수를 정수로 변환, 날짜 형식 변환 등
--형식지정자
SELECT first_name, TO_CHAR(HIRE_DATE, 'MM/YY') AS HiredMonth
FROM HR.employees
WHERE first_name = ' Steven';



SELECT first_name, TO_CHAR (hire_date, 'YYYY"년" MM"월" DD"일"') HIREDATE 
FROM HR.employees;     --날짜나 숫자를 문자로 변환할 때 사용하는 함수 TO_CHAR -- 형식지정자 'YYYY"년" MM"월" DD"일"'

SELECT first_name, TO_CHAR(department_id) dept
FROM HR.employees;

SELECT first_name, last_name, TO_CHAR(salary,'$999,999') as salary
FROM HR.employees
WHERE first_name = 'David';   -- 숫자 형식지정자 '$999,999


select first_name, last_name, salary * 0.123456 as salary
from HR.employees
WHERE first_name = 'David'; 

SELECT first_name, hire_date
FROM HR.employees
WHERE hire_date = TO_DATE('2003/06/17','YYYY/MM/DD');

SELECT '$5,500.00' - 4000 FROM DUAL;

SELECT TO_NUMBER('$5,500.00','$999,999.99') FROM DUAL;
SELECT TO_NUMBER('$5,500.00','$999,999.99')-4000 FROM DUAL;

INSERT INTO NOTICE
(ID, TITLE , WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(4,'전화번호는 123-456-344 이메일로 연락 주시기 바랍니다. mrsono0@abc.com','2222' ,'666','2021/05/07',TO_NUMBER('$5,500.00','$999,999.99'),'BC.jpg');

--NULL 처리 함수 NLV(1,2) 값1이 NULL이 아니면 값, 값 1이 NULL이면 2로 출력해라; NLV2(1,2,3) 값1이 NULL이 아니면 값2로 출력, 값 1이 NULL이면 값3으로 출력해라
SELECT FIRST_NAME, SALARY, COMMISSION_PCT
FROM HR.employees;

SELECT FIRST_NAME, SALARY + SALARY *NVL(COMMISSION_PCT,0) AS ANN_SAL
FROM HR.employees;

SELECT FIRST_NAME, 
    NVL2(COMMISSION_PCT, SALARY + (SALARY*COMMISSION_PCT),SALARY) AS ANN_SAL  -- null이 아닐경우에 2번째값 반환, null이면 3번재 값 반환 
FROM HR.employees;

SELECT FIRST_NAME, 
    COALESCE(COMMISSION_PCT, SALARY + (SALARY*COMMISSION_PCT),SALARY) AS ANN_SAL 
FROM HR.employees;

-- IT_PROG 1.10%, FI_MGR 1.15%, FI_ACCOUNT 1.20%

-- 조건문 DECODE(컬럼,값1,결과1,값2,결과2,결과3)
SELECT JOB_ID,SALARY,
    DECODE(job_id, 'IT_PROG',     salary*1.10,
                    'FI_MGR',     salary*1.15,
                    'FI_ACCOUNT', salary*1.20,
                                  salary)
    AS REVISED_SALARY
FROM HR.employees ;

SELECT JOB_ID, SALARY,
    CASE WHEN JOB_ID = 'IT_PROG' THEN SALARY * 1.10
         WHEN JOB_ID = 'FI_MGR'  THEN SALARY * 1.15
         WHEN JOB_ID = 'FI_ACCOUNT' THEN SALARY*1.20
         ELSE SALARY
    END AS REVISEDSALARY
FROM HR.employees;

-- 집합연산자:
---UNION -> 이어주는 역할 , 중복되는 값 제거
-- UNION ALL -> 중복되는 값도 같이 출력
SELECT EMPLOYEE_ID,FIRST_NAME
FROM HR.EMPLOYEES
WHERE HIRE_DATE LIKE '04%'
UNION 
SELECT EMPLOYEE_ID, FIRST_NAME
FROM HR.employees
WHERE department_id = 20 ;

-- 그룹함수
SELECT AVG(SALARY) , MAX(SALARY), MIN(SALARY),SUM(SALARY)
FROM HR.employees
WHERE job_id LIKE 'SA%'; 

SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
FROM HR.employees;

SELECT COUNT(*) 
FROM HR.employees;

SELECT COUNT(COMMISSION_PCT) FROM HR.employees;


-- 사원들의 급여의 총합, 평균, 표준편차(STDDEV), 그리고 분산(VARIANCE)을 구하시오.
-- 소수점 이하 두번째 자리까지만 표시.

SELECT 
    ROUND(SUM(SALARY),2) AS 총합,
    ROUND(AVG(SALARY),2)AS 평균,
    ROUND(STDDEV(SALARY),2)AS 표준편차 ,
    ROUND(VARIANCE(SALARY),2) AS  분산
FROM HR.employees ;

