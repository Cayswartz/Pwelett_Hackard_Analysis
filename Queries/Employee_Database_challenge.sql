--Deliverable 1

-- Step 1-7 

SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
From employees as e
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no 
	
-- Use Dictinct with Orderby to remove duplicate rows (step 8-15)

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, from_date DESC;

-- Retiring Titles (step 16-21)
SELECT COUNT(ut.title), ut.title
INTO retiring_title
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count(ut.title) DESC;


-- Deliverable 2

SELECT DISTINCT ON (e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibilty
From employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;