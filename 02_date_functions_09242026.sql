-- ## 1. SYSDATE

-- Returns the current database server date and time. Business use: compare today's date with employee hire dates.
-- select first_name,hire_date,sysdate as today_date from hr.EMPLOYEES

-- ## 2. ADD_MONTHS

-- Adds or subtracts months. Business use: calculate probation or anniversary dates.
-- select first_name,hire_date,add_months(hire_date,6) as pobation_date,add_months(hire_date,12) as year_completion_date from hr.employees

-- ## 3. MONTHS_BETWEEN

-- Returns the number of months between two dates. The result can contain a fractional month.
-- select first_name,hire_date,months_between(sysdate,hire_date) as experience from hr.EMPLOYEES

-- ## 4. LAST_DAY

-- Returns the last day of the month containing a date.
-- select first_name,hire_date,last_day(hire_date) as joining_month from hr.employees

-- ## 5. NEXT_DAY

-- Returns the next occurrence of a named weekday after a date.
-- select first_name,hire_date,NEXT_DAY(hire_date,'Monday') as next_monday from hr.EMPLOYEES

-- ## 6. TRUNC Date

-- Removes smaller date/time components. With `MONTH`, it returns the first day of the month.
-- select first_name,hire_date,trunc(hire_date) as date_only,trunc(hire_date,'Month') as month_start ,TRUNC(hire_date,'year') as year_start,TRUNC(hire_date,'day') as date_start from hr.employees

-- ## 7. TO_CHAR with Dates

-- Formats an Oracle DATE as text.
-- select first_name,hire_date,to_char(hire_date,'DD-MM-YYYY') as formatted_date,to_char(hire_date,'Month') as joining_month,to_char(hire_date,'Day') as joining_day from hr.employees

-- ## 8. TO_DATE

-- Converts character data into an Oracle DATE.
-- select first_name, hire_date from hr.employees where hire_date > to_date('01-01-2005' , 'DD-MM-YYYY');

-- ## 9. Date Addition

-- Adding a number to a DATE adds days.
-- select first_name,hire_date,hire_date+30 as after_30_days,hire_date+90 after_90_days from hr.employees

-- ## 10. Date Subtraction

-- Subtracting a number removes days; subtracting two dates returns the difference in days.
-- select first_name,hire_date,hire_date - 30,Trunc(SYSDATE)-TRUNC(hire_date) as  days_worked from hr.EMPLOYEES

-- ## 11. Filtering by Date Range

-- A half-open range is useful when timestamps may be present.
-- select employee_id,first_name,hire_date from hr.employees where hire_date >= to_date('01-01-2005','DD-MM-YYYY') AND hire_date >= to_date('01-01-2006','DD-MM-YYYY')
-- select employee_id,first_name,hire_date from hr.employees where hire_date >= date '2005-01-01' and hire_date > date '2006-01-01'

-- ## 12. Grouping by Joining Month

-- Combines date formatting with aggregation for a business report.
-- select to_char(hire_date,'YYYY-MM') as joining_month,count(*) as employee_count from hr.employees group By to_char(hire_date,'YYYY-MM') order by joining_month

