SELECT * FROM EMPLOYEES

-- 1. ��� ����� �����ȣ, �̸�, �Ի���,�޿��� ����ϼ���.
SELECT EMPLOYEE_ID, FIRST_NAME||' ' || LAST_NAME AS NAME, HIRE_DATE, SALARY 
FROM EMPLOYEES;

-- 2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� NAME���� �ϼ���.
SELECT FIRST_NAME ||' ' || LAST_NAME AS NAME
FROM EMPLOYEES;

-- 3. 50�� �μ� ����� ��� ������ ����ϼ���.
SELECT *   
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

--4.50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT FIRST_NAME,  LAST_NAME,DEPARTMENT_ID,EMPLOYEE_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

--5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT FIRST_NAME , LAST_NAME , SALARY + 300
FROM EMPLOYEES;

--6.�޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
SELECT FIRST_NAME ||' '|| LAST_NAME AS NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 10000;

--7.���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���
SELECT FIRST_NAME,LAST_NAME ,JOB_ID, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

--8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���. (BETWEEN)
SELECT FIRST_NAME,LAST_NAME , HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '03/01/01' AND '03/12/31';

--9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����Ͻÿ�. (LIKE)
SELECT FIRST_NAME,LAST_NAME ,HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '03/%/%';

--10.��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��������� 
SELECT FIRST_NAME, LAST_NAME , SALARY 
FROM EMPLOYEES
ORDER BY SALARY DESC;

--11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ��䤤
SELECT FIRST_NAME, LAST_NAME , SALARY 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY SALARY DESC;

--12. �����ƾƵ� IT_PROG�̰ų�  SA_MAN �� ����� �̸��� �������̵� ���
SELECT FIRST_NAME, LAST_NAME , JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'SA_MAN';
--WHERE JOB_ID IN ('IT_PROG', 'SA_MAN');

--13. Steven King ����� ������ 'Steven King ����� �޿��� 24000�޷��Դϴ�' �������� ���.
SELECT FIRST_NAME||' '|| LAST_NAME ||' '||'����� �޿���'||' '|| SALARY || '�޷��Դϴ�' AS SENTENCE
FROM EMPLOYEES
WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King';

--14. �Ŵ���(MAN)������ �ش��ϴ� ����� �̸��� �������̵� ���
SELECT  FIRST_NAME,LAST_NAME, JOB_ID 
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN%';

--15. �Ŵ��� ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ���.
SELECT  FIRST_NAME,LAST_NAME , JOB_ID 
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN%'  
ORDER BY JOB_ID ASC;
