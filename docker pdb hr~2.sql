SELECT first_name, salary FROM employees WHERE salary > ANY 
    (select salary from employees where first_name = 'David');
