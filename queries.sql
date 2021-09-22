-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring 
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Export to table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
-- INTO current_emp
FROM retirement_info as ri 
LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

SELECT * FROM dept_employees;

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date

--INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('1999-01-01');

SELECT rf.emp_no,
    rf.first_name,
rf.last_name,
    demp.to_date
INTO current_emp
FROM retirement_info as rf
LEFT JOIN dept_employees as demp
ON rf.emp_no = demp.emp_no
WHERE demp.to_date = ('1999-01-01');

SELECT * from current_emp;

SELECT COUNT (ce.emp_no), demp.dept_no
INTO dept_count
FROM current_emp as ce 
LEFT JOIN dept_employees as demp
ON ce.emp_no = demp.emp_no 
GROUP BY demp.dept_no
ORDER BY demp.dept_no;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	e.gender,
	s.salary,
	demp.to_date
INTO emp_info
FROM employees as e 
INNER JOIN salaries as s 
ON (e.emp_no = s.emp_no) 
INNER JOIN dept_employees as demp
ON (e.emp_no = demp.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
     AND (demp.to_date = '1999-01-01');

SELECT dm.dept_no,
		d.dept_name,
		dm.emp_no,
		ce.last_name,
		ce.first_name,
		dm.from_date,
		dm.to_date
-- INTO manager_info
FROM dept_manager as dm 
	INNER JOIN departments as d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp as ce 
		ON (dm.emp_no = ce.emp_no);

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_employees AS demp
ON (ce.emp_no = demp.emp_no)
INNER JOIN departments AS d
ON (demp.dept_no = d.dept_no);
		