--select count(*) from departments
--select count(*) from dept_emp
--select count(*) from dept_manager
--select count(*) from employees
--select count(*) from salaries
--select count(*) from titles


--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, last_name, first_name, gender, salary
from employees e
join salaries s on e.emp_no = s.emp_no --and to_date = '9999-01-01'
limit 1000 

--List employees who were hired in 1986.
select * 
from employees 
where hire_date between '1986-01-10' and '1986-12-31'
limit 1000

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no, dept_name, e.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
from departments d
join dept_manager dm on dm.dept_no = d.dept_no
join employees e on e.emp_no = dm.emp_no
limit 1000


--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
limit 1000

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees where first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
where dept_name = 'Sales'
limit 1000

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
where dept_name in ('Sales', 'Development')
limit 1000

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) as frequency
from employees
group by last_name
order by 2 desc

