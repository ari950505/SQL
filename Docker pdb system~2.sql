select * from notice;

INSERT into notice
(ID, TITLE , WRITER_ID, CONTENT, REGDATE, HIT, FILEs)


values
(1,'����-����-�׸� �� ��������~~`','okay','soso','2021-05-07',0,'BC.jpg');


INSERT  INTO NOTICE
(ID, TITLE , WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(3444,'��ȭ��ȣ�� 123-456-344 �̸��Ϸ� ���� �ֽñ� �ٶ��ϴ�. mrsono0@abc.com','2222' ,'666','2021/05/07',00,'BC.jpg');

INSERT  INTO NOTICE
(ID, TITLE , WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES
(322,'��ȭ��ȣ�� 016-456-3445 �̸��Ϸ� ���� �ֽñ� �ٶ��ϴ�. mrsono0@abc.com','44422' ,'000','2021/05/07',00,'BC.jpg');

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
-- \D\D\D-\D\D\D\D-\D\D\D\D  ���� / \w ���� \w+ more than one letter
-- 01[6-9] - \D{3,4}-\D{4}
-- ^01[6-9]-\D{3,4}-\D{4}$


-- �̸��Ϸ� ���� �ֽñ� �ٶ��ϴ�. mrsono0@abc.com
-- \w@\w+.(org|net|com)


SELECT * 
FROM NOTICE 
WHERE REGEXP_LIKE(title, '\w@\w+.(org|net|com)');

SELECT * 
FROM NOTICE 
WHERE REGEXP_LIKE(title, '01[016-9]-\d{3,4}-\d{4}');

--���� �Լ�
SELECT ROUND(45.923,2), ROUND(45.923,0),ROUND(45.923,-1) FROM DUAL; -- �ݿø�
SELECT TRUNC(45.923,2),TRUNC(45.923),TRUNC(45.923,-1) FROM DUAL; --����

SELECT SYSDATE FROM DUAL;

SELECT first_name,(SYSDATE - hire_date) / 7 AS "Weeks"
FROM HR.employees
WHERE department_id = 60 ;

SELECT first_name,round((SYSDATE - hire_date) / 7,0 )AS "Weeks"
FROM HR.employees
WHERE department_id = 60 ;

SELECT SYSTIMESTAMP FROM DUAL;


-- ��ȯ �Լ�: �Ǽ��� ������ ��ȯ, ��¥ ���� ��ȯ ��
--����������
SELECT first_name, TO_CHAR(HIRE_DATE, 'MM/YY') AS HiredMonth
FROM HR.employees
WHERE first_name = ' Steven';



SELECT first_name, TO_CHAR (hire_date, 'YYYY"��" MM"��" DD"��"') HIREDATE 
FROM HR.employees;     --��¥�� ���ڸ� ���ڷ� ��ȯ�� �� ����ϴ� �Լ� TO_CHAR -- ���������� 'YYYY"��" MM"��" DD"��"'

SELECT first_name, TO_CHAR(department_id) dept
FROM HR.employees;

SELECT first_name, last_name, TO_CHAR(salary,'$999,999') as salary
FROM HR.employees
WHERE first_name = 'David';   -- ���� ���������� '$999,999


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
(4,'��ȭ��ȣ�� 123-456-344 �̸��Ϸ� ���� �ֽñ� �ٶ��ϴ�. mrsono0@abc.com','2222' ,'666','2021/05/07',TO_NUMBER('$5,500.00','$999,999.99'),'BC.jpg');

--NULL ó�� �Լ� NLV(1,2) ��1�� NULL�� �ƴϸ� ��, �� 1�� NULL�̸� 2�� ����ض�; NLV2(1,2,3) ��1�� NULL�� �ƴϸ� ��2�� ���, �� 1�� NULL�̸� ��3���� ����ض�
SELECT FIRST_NAME, SALARY, COMMISSION_PCT
FROM HR.employees;

SELECT FIRST_NAME, SALARY + SALARY *NVL(COMMISSION_PCT,0) AS ANN_SAL
FROM HR.employees;

SELECT FIRST_NAME, 
    NVL2(COMMISSION_PCT, SALARY + (SALARY*COMMISSION_PCT),SALARY) AS ANN_SAL  -- null�� �ƴҰ�쿡 2��°�� ��ȯ, null�̸� 3���� �� ��ȯ 
FROM HR.employees;

SELECT FIRST_NAME, 
    COALESCE(COMMISSION_PCT, SALARY + (SALARY*COMMISSION_PCT),SALARY) AS ANN_SAL 
FROM HR.employees;

-- IT_PROG 1.10%, FI_MGR 1.15%, FI_ACCOUNT 1.20%

-- ���ǹ� DECODE(�÷�,��1,���1,��2,���2,���3)
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

-- ���տ�����:
---UNION -> �̾��ִ� ���� , �ߺ��Ǵ� �� ����
-- UNION ALL -> �ߺ��Ǵ� ���� ���� ���
SELECT EMPLOYEE_ID,FIRST_NAME
FROM HR.EMPLOYEES
WHERE HIRE_DATE LIKE '04%'
UNION 
SELECT EMPLOYEE_ID, FIRST_NAME
FROM HR.employees
WHERE department_id = 20 ;

-- �׷��Լ�
SELECT AVG(SALARY) , MAX(SALARY), MIN(SALARY),SUM(SALARY)
FROM HR.employees
WHERE job_id LIKE 'SA%'; 

SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
FROM HR.employees;

SELECT COUNT(*) 
FROM HR.employees;

SELECT COUNT(COMMISSION_PCT) FROM HR.employees;


-- ������� �޿��� ����, ���, ǥ������(STDDEV), �׸��� �л�(VARIANCE)�� ���Ͻÿ�.
-- �Ҽ��� ���� �ι�° �ڸ������� ǥ��.

SELECT 
    ROUND(SUM(SALARY),2) AS ����,
    ROUND(AVG(SALARY),2)AS ���,
    ROUND(STDDEV(SALARY),2)AS ǥ������ ,
    ROUND(VARIANCE(SALARY),2) AS  �л�
FROM HR.employees ;

