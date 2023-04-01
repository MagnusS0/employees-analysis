USE employees_mod;

-- Get the number of new hires from each year grouped by gender
SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(DISTINCT e.emp_no) AS number_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp d ON e.emp_no = d.emp_no
WHERE
    YEAR(d.from_date) >= 1990
GROUP BY calendar_year, e.gender
ORDER BY calendar_year;


-- Retrieves data about department managers, the year they were employed, and whether or not they were active in that position for that year. 
SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
-- The CASE statement checks whether or not the department manager was active in that position for the given year, active is set to 1; otherwise, it is set to 0.
    CASE
        WHEN e.calendar_year BETWEEN YEAR(dm.from_date) AND YEAR(dm.to_date) THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no , calendar_year;


-- Retrieves the average salary for each department by gender and year
SELECT 
    e.gender,
    d.dept_name,
    AVG(s.salary) AS salary,
    YEAR(de.from_date) AS calendar_year
FROM
    t_dept_emp de
        JOIN
    t_salaries s ON de.emp_no = s.emp_no
        JOIN
    t_employees e ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
WHERE YEAR(de.from_date) BETWEEN 1990 AND 2002
GROUP BY e.gender, d.dept_no, calendar_year
ORDER BY d.dept_no;


-- Drop procedure
DROP PROCEDURE IF EXISTS filter_salary;

-- Creates a procedure that allows you to set a range as a filter for salary, then returns the average salary in that range for all departments by gender
DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT) 
BEGIN
    SELECT
        e.gender, d.dept_name,  ROUND(AVG(s.salary), 2) AS salary
    FROM
        t_salaries s
            JOIN
        t_employees e ON e.emp_no = s.emp_no
            JOIN
        t_dept_emp de ON e.emp_no = de.emp_no
            JOIN
        t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
    GROUP BY d.dept_no, e.gender;
END$$

DELIMITER ;
-- calls on the procedure and lets you set the salary range
CALL filter_salary(50000, 90000);

-- Retrieves the number of employees in each department by gender
SELECT 
    d.dept_name, e.gender, COUNT(*) AS num_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name, e.gender
ORDER BY d.dept_name;

-- Retrives the average salary for all departments by year
SELECT 
    d.dept_no,
    d.dept_name,
    YEAR(de.from_date) AS calendar_year,
    AVG(s.salary) AS salary
FROM
    t_dept_emp de
        JOIN
    t_salaries s ON de.emp_no = s.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , calendar_year
HAVING calendar_year BETWEEN 1990 AND 2002
ORDER BY d.dept_no , calendar_year;