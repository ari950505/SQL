SELECT * FROM employees;

SELECT * FROM DEPARTMENTS; 

SELECT FIRST_NAME,HIRE_DATE,SALARY + '100'
FROM EMPLOYEES;

-- 숫자 문자 구분 -> 왼쪽정렬 문자열 ; 오른쪽 정렬 숫자
0.5%

SELECT FIRST_NAME, SALARY * 1.005 AS SS   --- AS 별명 지정
FROM EMPLOYEES

SELECT FIRST_NAME|| ' ' ||SALARY * 1.005 AS SS   --- AS 별명 지정
FROM EMPLOYEES

SELECT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT ROWNUM, EMPLOYEE_ID, FIRST_NAME 
FROM EMPLOYEES
WHERE EMPLOYEE_ID >= 100
ORDER BY  EMPLOYEE_ID DESC;

-- 직무가 개발자인 사람만 조회 하시오.
SELECT FIRST_NAME,JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

WHERE JOB_ID = 'IT_PROG';

SELECT * FROM JOBS;

SELECT FIRST_NAME,LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

SELECT FIRST_NAME, JOB_ID,DEPARTMENT_ID
FROM EMPLOYEES
WHERE

SELECT FIRST_NAME, HIRE_DATE,SALARY
FROM EMPLOYEES
--WHERE 
ORDER BY HIRE_DATE DESC,SALARY ASC;  ---DESC 오름차순,ASC 내림차순
--ORDER BY HIRE_DATE ASC;

