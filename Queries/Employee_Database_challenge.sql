--Instructions 1 - 7 
-- Retirees born between 01/01/1952 and  12/31/1955
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   tl.title,
	   tl.from_date,
	   tl.to_date
--INTO retirement_titles	   
FROM employees as e
INNER JOIN  titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no; 

SELECT * FROM retirement_titles;

SELECT COUNT(last_name) from retirement_titles;

--Instructions 8- 14

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
--INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT COUNT(last_name) from unique_titles;

--Instructions 15 - 20

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;
 
SELECT * FROM retiring_titles;

SELECT SUM(count) from retiring_titles;

--Deliverable 2

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tl.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty;