-- ---------------------------------------------------------------------------------------------------
-- The code below delivers the solutions to the homework questions...
------------------------------------------------------------------------------------------------------
--List the following details of each employee: employee number, 
--last name, first name, sex, and salary.
select a.emp_no, a.last_name, a.first_name, a.sex, b.salary
	from employees a, salaries b
	where a.emp_no = b.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
select a.emp_no, a.last_name, a.hire_date
	from employees a
	where a.hire_date BETWEEN '1986-01-01' and '1986-12-31';
	  
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.
select d.title, a.first_name, a.last_name, b.emp_no, b.dept_no, c.dept_name
	from employees a, dept_manager b, departments c, titles d 
	where a.emp_no = b.emp_no
	  and a.emp_title_id = d.title_id
	  and b.dept_no = c.dept_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select c.dept_no, a.emp_no, b.last_name, b.first_name, c.dept_name
	from dept_emp a, employees b, departments c  
	where a.emp_no = b.emp_no
	  and a.dept_no = c.dept_no;

-- List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
	from employees  
         where ((first_name = 'Hercules') and (last_name like 'B%')); 

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select c.dept_no, a.emp_no, b.last_name, b.first_name, c.dept_name
	from dept_emp a, employees b, departments c  
	where a.emp_no = b.emp_no
	  and a.dept_no = c.dept_no
	  and c.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select c.dept_no, a.emp_no, b.last_name, b.first_name, c.dept_name
	from dept_emp a, employees b, departments c  
	where a.emp_no = b.emp_no
	  and a.dept_no = c.dept_no
	  and c.dept_name in ('Sales', 'Development');
	  
-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
select count(last_name), last_name
	from employees  
group by last_name
order by last_name desc;
