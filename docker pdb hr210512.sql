----21/05/12/��-----------------------------------------------------------------

---------GROUP�Լ�----------------------------------------------------------------
--group by = grouping
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY), SUM(SALARY)
FROM EMPLOYEES
WHERE JOB_ID LIKE 'SA%';

SELECT DEPARTMENT_ID, AVG(SALARY)--GROUPING�� GROUP���� AVG�� ������. SUM, MAX, MIN� ��������
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE AVG(SALARY) > 2000 --WHERE ������ �׷��Լ�(AVG,SUM,MIN,MAX���) ��� �Ұ���
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > 2000;--GROUP BY ���� ������ �η��� WHERE ��� HAVING���� ���� ��.
ORDR BY AVG(SALARY);

---Q.�Ϲ������� �ʿ��Ҷ�...?
SELECT JOB_ID, AVG(SALARY) AS PAYROLL
FROM EMPLOYEES
WHERE JOB_ID NOT LIKE 'SA%'
GROUP BY JOB_ID
HAVING AVG(SALARY) > 8000
ORDER BY AVG(SALARY) DESC;--SORTING�ϰ� ������ ORDER BY ���

---------JOIN�Լ�---------------------------------------------------------------

------ORACLE JOIN-------
SELECT E.first_name, E.department_id, D.department_name
FROM employees E, departments D --employees�� E�� department�� D�� �����ϰ� ������ ���ڴ�!!
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--EQ JOIN�� WHERE���� ��. 

-----CARTESIAN PRODUCT-----
SELECT E.FIRST_NAME AS EMPLOYEE_NAME, M.FIRST_NAME AS MANAGER_NAME
FROM EMPLOYEES E, EMPLOYEES M --�� �Ȱ����� �̷��� ��...?
WHERE E.MANAGER_ID = M.EMPLOYEE_ID AND E.EMPLOYEE_ID = 103; 

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.HIRE_DATE, J.START_DATE, J.END_DATE, J.JOB_ID, J.DEPARTMENT_ID
FROM EMPLOYEES E, JOB_HISTORY J
WHERE E.EMPLOYEE_ID = J.EMPLOYEE_ID(+)
ORDER BY J.EMPLOYEE_ID;
--�� 107���̾�� �ϴµ� �� 110��?? --> ���� �ٲ������� �ֱ� ������

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.HIRE_DATE, J.START_DATE, J.END_DATE, J.JOB_ID, J.DEPARTMENT_ID
FROM EMPLOYEES E, JOB_HISTORY J
WHERE E.EMPLOYEE_ID = J.EMPLOYEE_ID(+)--+�� �پ��ִ��� �������� �����ִ� RIGHT OUTER JOIN��. Q.NULL�� �����ְ� ���� �ʿ� �÷����� �־���...?
ORDER BY J.EMPLOYEE_ID;

--------ANSI JOIN--------
--�μ��� �ּҸ� ��������
SELECT E.FIRST_NAME AS NAME, D.DEPARTMENT_NAME AS DEPARTMENT,
    L.STREET_ADDRESS || ',' || L.CITY || ',' || L.STATE_PROVINCE AS ADDRESS
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L
ON D.LOCATION_ID= L.LOCATION_ID;
WHERE E.EMPLOYEE_ID = 103;

--���� �Ʒ��� ���� �� ��Ҹ� �ٸ��� ����� ����!!

SELECT E.FIRST_NAME AS NAME, D.DEPARTMENT_NAME AS DEPARTMENT,
    L.STREET_ADDRESS || ',' || L.CITY || ',' || L.STATE_PROVINCE AS ADDRESS
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.EMPLOYEE_ID = 103
JOIN LOCATIONS L
ON D.LOCATION_ID= L.LOCATION_ID;

SELECT FIRST_NAME, DEPARTMENT_NAME --�� COLOUMN���� ������ EMPLOYEES���̺��� �ֱ� ������ E.FIRST_NAME �̷������� ǥ������. �ٵ� �׷����� ���ִ°� ����.
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D --�⺻�� LEFT JOIN�̰�, ����Ŭ���� LEFT,RIGHT ������ (+)�� ��.
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IS NULL;

SELECT E. EMPLOYEE_ID, E.FIRST_NAME, E.HIRE_DATE,J.START_DATE, J.END_DATE, J.JOB_ID, J.DEPARTMENT_ID
FROM JOB_HISTORY J
FULL JOIN EMPLOYEES E
ON E.EMPLOYEE_ID = J.EMPLOYEE_ID
ORDER BY J.EMPLOYEE_ID;

-------��������------------------------------------------------------------------
--�ϳ��� SELECT������ �ذ��� �ȵɶ� ���

------������ ��������
--NANCY���� �޿��� ���� �޴� �����?
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE FIRST_NAME= 'Nancy';
--���� ������ �����ؼ� 12008�� �˾Ƴ�
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > 12008;
--�̷��� �ϸ� ������ �ι� �����ؾ� ��.

SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Nancy');
--���������� ()�ȿ� �־��ָ� ��. ��ȣ �ȿ��� ���� ���� ������ �����ݷ� ����� �ʿ� ����!!

--��ü��պ��� ���� �޴� �����?
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);
--Q.�ٵ� NULL�� ���ԵǾ� �������� �����ϱ� �� ��Ȯ�� �Ϸ��� �������� ��� �Ѵٰ�...???

------������ ��������
--Q.������ ������: IN, ANY, ALL ���� ���������� ������ �͵� ��
--�������� �� �����ڵ常 ���ۿ� ġ�� �ذ��� �� ����.

--david���� ���� ���� �޴»��
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'David';
--���� �����غ��� �˰����� ���̺�� ��������. �׷��� �Ʒ���  ANY����. Q.�ٵ� �װ� ������...?
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > ANY(SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'David');

--������ ���̺�� ���� ���� �μ� �����
SELECT FIRST_NAME, DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME= 'David');
--��ȣ���� ���������� ���� ���� ������ ���, �ӵ� ���ϵ�. ��ȸ�� ���� ������� �������� ����Ҷ� ���� �ȵ�.

--��Į�� ���������� ������ ���� ���������� ���� ������.
SELECT FIRST_NAME, (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID) AS DEPARTMENT_NAME
FROM EMPLOYEES E
ORDER BY FIRST_NAME;
--�̷��� ���������� ¥�� DEPARTMENT_ID �ϳ��ϳ� ���پ� ���� �� �׷��� ���� �ɸ�. �����Ͱ� ������ �׳� JOIN���� �ϱ�
--Q.WHERE���� �Լ� ���� ������..?

SELECT FIRST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY FIRST_NAME;

-------�ζ��� ��------
--FROM ���� �������� �°�. 
SELECT ROW_NUMBER, FIRST_NAME, SALARY
FROM (SELECT FIRST_NAME, SALARY, ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS ROW_NUMBER
     FROM EMPLOYEES
     ORDER BY SALARY DESC) --������ ���̺��� ����� ��.
WHERE ROW_NUMBER BETWEEN 1 AND 10;