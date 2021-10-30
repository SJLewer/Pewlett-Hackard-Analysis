--Retirements Title Table
SELECT 
	e.emp_no
	,e.first_name
	,e.last_name
	,t.title
	,t.from_date
	,t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- Use Distinct with Orderby to remove duplicate rows
SELECT 
	DISTINCT ON (rt.emp_no)rt.emp_no
	,rt.first_name
	,rt.last_name
	,rt.title
	
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no,rt.to_date DESC;

--Number of "about to retire" employees by most recent job title 
SELECT
	COUNT(emp_no)
	,title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC

--Deliverable 2
SELECT
	 DISTINCT on (e.emp_no) e.emp_no
	,e.first_name
	,e.last_name
	,e.birth_date
	,de.from_date
	,de.to_date
	,t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
	on e.emp_no = de.emp_no
INNER JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY e.emp_no

--Number of "mentor eligible" employees by most recent job title 
SELECT
	COUNT(emp_no)
	,title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT DESC
