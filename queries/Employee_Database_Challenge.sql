-- Create retirement_titles table
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		titles.title,
		titles.from_date,
		titles.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles 
ON e.emp_no = titles.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;
		

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
		first_name,
		last_name,
		title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Create retiring_titles table
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY count(title) DESC;

-- CReate mentorship eligibility table
SELECT DISTINCT ON (emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date, 
		titles.title
INTO mentorship_eligibility
FROM employees as e 
	INNER JOIN dept_employees as de 
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles 
		ON (e.emp_no = titles.emp_no)
WHERE (de.to_date = '1999-01-01')
AND (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ;

		