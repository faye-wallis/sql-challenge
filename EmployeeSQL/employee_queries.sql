--List the employee number, last name, first name, sex, and salary of each employee.
SELECT a.emp_no, a.last_name, a.first_name, a.sex, b.salary
FROM employees a
INNER JOIN salaries b ON a.emp_no = b.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT a.dept_no, b.dept_name, a.emp_no, c.last_name, c.first_name
FROM dept_manager a
INNER JOIN departments b ON a.dept_no = b.dept_no
INNER JOIN employees c ON a.emp_no = c.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT a.dept_no, a.emp_no, b.last_name, b.first_name, c.dept_name
FROM dept_emp a
INNER JOIN employees b ON a.emp_no = b.emp_no
INNER JOIN departments c ON a.dept_no = c.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT a.emp_no, b.last_name, b.first_name
FROM dept_emp a
INNER JOIN employees b ON a.emp_no = b.emp_no
INNER JOIN departments c ON a.dept_no = c.dept_no
WHERE dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT a.emp_no, b.last_name, b.first_name, c.dept_name
FROM dept_emp a
INNER JOIN employees b ON a.emp_no = b.emp_no
INNER JOIN departments c ON a.dept_no = c.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC;