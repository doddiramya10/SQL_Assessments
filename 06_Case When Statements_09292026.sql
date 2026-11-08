-- select employee_id,first_name,salary,case when salary >= 15000 then 'High Salary'
--                                           when salary >= 8000 then 'Medium Salary'
--                                           else 'Low Salary'
--                                      END as salary_category
-- from hr.EMPLOYEES                                     

-- select employee_id,first_name,salary,case when salary > 10000 then 'Above 10000'
--                                           else '10000 or Below'
--                                      end as salary_status
-- from hr.employees   

-- SELECT employee_id,
--        first_name,
--        department_id,
--        CASE 
--            WHEN department_id = 10 THEN 'Administration'
--            WHEN department_id = 20 THEN 'Marketing'
--            WHEN department_id = 50 THEN 'Shipping'
--            WHEN department_id = 60 THEN 'IT'
--            WHEN department_id = 80 THEN 'Sales'
--            ELSE 'Other Department'
--        END AS department_name
-- FROM hr.employees


-- SELECT employee_id,
--        first_name,
--        commission_pct,
--        CASE
--            WHEN commission_pct IS NULL THEN 'No Commission'
--            ELSE 'Commission Available'
--        END AS commission_status
-- FROM hr.employees;

-- SELECT employee_id,
--        first_name,
--        commission_pct,
--        CASE
--            WHEN commission_pct >= 0.30 THEN 'High Commission'
--            WHEN commission_pct >= 0.20 THEN 'Medium Commission'
--            WHEN commission_pct > 0 THEN 'Low Commission'
--            ELSE 'No Commission'
--        END AS commission_category
-- FROM hr.employees;

-- SELECT employee_id,
--        first_name,
--        hire_date,
--        CASE
--            WHEN EXTRACT(YEAR FROM hire_date) < 2005 THEN 'Old Employee'
--            WHEN EXTRACT(YEAR FROM hire_date) <= 2007 THEN 'Experienced Employee'
--            ELSE 'New Employee'
--        END AS employee_category
-- FROM hr.employees;

-- SELECT employee_id,
--        first_name,
--        manager_id,
--        CASE
--            WHEN manager_id IS NULL THEN 'No Manager'
--            ELSE 'Has Manager'
--        END AS manager_status
-- FROM hr.employees;

-- select employee_id,first_name,job_id,CASE
--                                          when job_id ='IT_PROG' then 'IT Employee'
--                                          when job_id='SA_REP' then 'Sales Employee'
--                                          when job_id= 'ST_CLERK' then 'Store Employee'
--                                          when job_id= 'FT_ACCOUNT' then 'Finance Employee'
--                                          else 'Other Employee'
--                                      end as job_category
-- from hr.EMPLOYEES

-- select employee_id,
--        first_name,
--        salary,
--        CASE 
--          When salary >= 15000 then salary * 0.10
--          when salary >= 8000 then salary * 0.15
--          else salary * 0.20
--        end as bonus
-- from hr.EMPLOYEES         

-- SELECT employee_id,
--        first_name,
--        salary,
--        CASE
--            WHEN salary >= 15000 THEN salary + (salary * 0.10)
--            WHEN salary >= 8000  THEN salary + (salary * 0.15)
--            ELSE salary + (salary * 0.20)
--        END AS salary_after_bonus
-- FROM hr.employees;

-- select employee_id,
--        first_name,
--        CASE
--           when first_name like 'A%' then 'name starts with A'
--           when first_name like 'S%' then 'name starts with B'
--           when first_name like 'j%' then 'name starts with J'
--           else 'Other Name'
--        end as Name_Category
-- from hr.EMPLOYEES          


-- select employee_id,
--        first_name,
--        salary,
--        case
--            when salary >= 20000 then 'Level 1'
--            when salary >= 15000 then 'Level 2'
--            when salary >= 10000 then 'Level 3'
--            else 'Level 4'
--        end as salary_level
-- from hr.employees           

-- select employee_id,
--        first_name,
--        salary,
--        case 
--           when salary < 10000 then 'Eligible for Bonus'
--           else 'Not Elegible for Bonus'
--        end as bonus_eligibility
-- from hr.employees       

-- select employee_id,
--        first_name,
--        department_id,
--        case
--            when department_id in (10,20,30) then 'Business Operations'
--            when department_id in (50,60) then 'Technical Operations'
--            when department_id in (80,90) then 'Sales and Management'
--            else 'Other'
--        end as business_area 
-- from hr.employees          

-- select employee_id,
--        first_name,
--        salary,
--        CASE 
--            when salary >= 5000 and salary < 10000 then 'Salary between 5000 and 9999'
--            when salary >= 10000 and salary < 15000 then 'Salary Between 10000 and 14999'
--            when salary >= 15000 then 'Salary 15000 and Above'
--            else 'Salary below 5000'
--        end as salary_range
-- from hr.employees           

-- select employee_id,
--        first_name,
--        department_id
-- from hr.EMPLOYEES
-- order by 
--        case
--           When department_id =60 then 1
--           when department_id = 80 then 2
--           when department_id = 50 then 3
--           else 4
--        end       

-- select 
--       sum( CASE
--                when salary >= 15000 then 1
--                else 0
--            end) as high_salary_count,
--       sum(case
--                when salary >= 8000 and salary < 15000 then 1 
--                else 0
--           end) as Medium_salary_count,
--        sum(case 
--                when salary < 8000 then 1
--                else 0
--            end ) as low_salary_count
-- from HR.employees      


-- SELECT department_id,
--        COUNT(*) AS total_employees,

--        SUM(
--            CASE
--                WHEN salary >= 10000 THEN 1
--                ELSE 0
--            END
--        ) AS high_salary_employees

-- FROM hr.employees
-- GROUP BY department_id
-- ORDER BY department_id;

-- SELECT employee_id,
--        first_name,
--        department_id,
--        salary,

--        CASE
--            WHEN department_id = 60
--                 THEN salary * 1.20

--            WHEN department_id = 80
--                 THEN salary * 1.15

--            ELSE salary * 1.10
--        END AS new_salary

-- FROM hr.employees;


-- select employee_id,
--        first_name,
--        department_id,
--        salary,
--        case 
--            when department_id = 60 and salary >10000 then 'Senior IT Employee'
--            when department_id = 60 and salary < 10000 then 'Junior IT Employee'
--            when department_id = 80 and salary >= 10000 then 'Senior sales Employee'
--            when department_id = 80 and salary < 10000  then 'Junior Salse Employee'
--            else 'Other Employee'
--        end as employee_status
-- from hr.employees             