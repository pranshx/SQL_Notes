CREATE DATABASE win_func;
USE win_func;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 -- OVER() -- WHEN BLANK OVER() GIVE THE AGGREATE VALUE IN EACH ROW OF THE TABLE UNLIKE GROUPBY WHICH GROUP THE COMMON FIELD
SELECT emp_no, department, salary, AVG(salary) OVER()
FROM employees;
 
SELECT emp_no, department, salary, MIN(salary) OVER(), MAX(salary) OVER()
FROM employees;

SELECT emp_no, department, salary, MIN(salary), MAX(salary) -- THIS WILL GIVE ERROR -- SALARY IS THE NON AGG FIELD
FROM employees;
SELECT department, MIN(salary), MAX(salary)  -- RUN THE ABOVE CODES TO SEE THE DIFFERENCE IN OUTPUT
FROM employees
GROUP BY department;
-- OVER() END

-- PARTITION BY WITH OVER() -- FORM ROWS INTO GROUP OF ROWS
SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department)AS dept_avg, AVG(salary) OVER() AS company_avg
FROM employees;

SELECT emp_no, department, salary, COUNT(*) OVER(PARTITION BY department) as dept_count
FROM employees;
 
SELECT emp_no, department, salary, SUM(salary) OVER(PARTITION BY department) AS dept_payroll, SUM(salary) OVER() AS total_payroll
FROM employees;
-- PARTITION BY WITH OVER() End

-- ORDER BY -- GIVE THE ROLLING VALUE -- CALCULATE FOR 1 ROW THEN ANOTHER AND KEEP GOING
SELECT emp_no, department, salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS rolling_dept_salary, -- ASC BY DEFAULT -- SEE THE DIFFERENCE IN OUTPUT
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;
-- ORDER BY END

-- RANK -- ROW NUMBER -- DENSE RANK -- VIEW DOCS
SELECT emp_no, department, salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;
-- RANK -- ROW NUMBER -- DENSE RANK END

-- NTILE() -- DIVIDE THE FIELD INTO N TILES
SELECT emp_no, department, salary, 
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;
-- NTILE() END

-- FIRST_VALUE -- LAST_VALUE -- NTH_VALUE
SELECT emp_no, department, salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall,
    LAST_VALUE(emp_no) OVER(ORDER BY salary DESC) as lowest_paid_overall,
    NTH_VALUE(emp_no,2) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept
FROM employees;

-- LAG() AND LEAD()
SELECT emp_no, department, salary,
salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;
 
SELECT emp_no, department, salary,
salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;