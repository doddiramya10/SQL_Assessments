create table employees(emp_id int,emp_name varchar2(50),dept varchar2(50),city varchar2(50),amount number,score number,status varchar2(20),manager_id number)
-- Insert Values into employee table
INSERT INTO employees VALUES (1,'Asha','Engineering','Bengaluru',5000,82,'ACTIVE',NULL); 
INSERT INTO employees VALUES (2,'Bala','Engineering','Hyderabad',7000,91,'ACTIVE',1); 
INSERT INTO employees VALUES (3,'Chitra','HR','Bengaluru',7000,76,'PENDING',1); 
INSERT INTO employees VALUES (4,'Dev','HR','Chennai',3000,65,'ACTIVE',2); 
INSERT INTO employees VALUES (5,'Esha','Engineering','Hyderabad',9000,94,'CLOSED',2); 
INSERT INTO employees VALUES (6,'Farah','HR','Chennai',4000,88,'ACTIVE',3);

create table bank_accounts(acc_id int,holder_name varchar2(50),acc_type varchar2(50),acc_city varchar2(50),balance number,score number,status varchar2(20),manager_id number)
-- Insert Values into Bank accounts table
INSERT INTO bank_accounts VALUES (1,'Asha','Savings','Bengaluru',5100,82,'ACTIVE',NULL); 
INSERT INTO bank_accounts VALUES (2,'Bala','Savings','Hyderabad',7100,91,'ACTIVE',1); 
INSERT INTO bank_accounts VALUES (3,'Chitra','Current','Bengaluru',7100,76,'PENDING',1); 
INSERT INTO bank_accounts VALUES (4,'Dev','Current','Chennai',3100,65,'ACTIVE',2); 
INSERT INTO bank_accounts VALUES (5,'Esha','Savings','Hyderabad',9100,94,'CLOSED',2); 
INSERT INTO bank_accounts VALUES (6,'Farah','Current','Chennai',4100,88,'ACTIVE',3);

create table retail_orders(cust_id int,cust_name varchar2(50),payment_type varchar2(50),city varchar2(50),amount number,score number,status varchar2(20),manager_id number)
-- Insert Values into Retail Orders table
INSERT INTO retail_orders VALUES (1,'Asha','Online','Bengaluru',5200,82,'ACTIVE',NULL);
 INSERT INTO retail_orders VALUES (2,'Bala','Online','Hyderabad',7200,91,'ACTIVE',1); 
 INSERT INTO retail_orders VALUES (3,'Chitra','Store','Bengaluru',7200,76,'PENDING',1); 
 INSERT INTO retail_orders VALUES (4,'Dev','Store','Chennai',3200,65,'ACTIVE',2); 
 INSERT INTO retail_orders VALUES (5,'Esha','Online','Hyderabad',9200,94,'CLOSED',2); 
 INSERT INTO retail_orders VALUES (6,'Farah','Store','Chennai',4200,88,'ACTIVE',3);


create table insurance_claims(ins_id int,cust_name varchar2(50),ins_type varchar2(50),city varchar2(50),amount number,score number,status varchar2(20),manager_id number)
-- Insert Values into insurance_claims table
INSERT INTO insurance_claims VALUES (1,'Asha','Health','Bengaluru',5300,82,'ACTIVE',NULL); 
INSERT INTO insurance_claims VALUES (2,'Bala','Health','Hyderabad',7300,91,'ACTIVE',1); 
INSERT INTO insurance_claims VALUES (3,'Chitra','Motor','Bengaluru',7300,76,'PENDING',1); 
INSERT INTO insurance_claims VALUES (4,'Dev','Motor','Chennai',3300,65,'ACTIVE',2); 
INSERT INTO insurance_claims VALUES (5,'Esha','Health','Hyderabad',9300,94,'CLOSED',2); 
INSERT INTO insurance_claims VALUES (6,'Farah','Motor','Chennai',4300,88,'ACTIVE',3);


create table student_fees(st_id int,st_name varchar2(50),st_dept varchar2(50),st_city varchar2(50),amount number,marks number,status varchar2(20),manager_id number)
-- Insert Values into student_fees table
INSERT INTO student_fees VALUES (1,'Asha','Data Engineering','Bengaluru',5400,82,'ACTIVE',NULL); 
INSERT INTO student_fees VALUES (2,'Bala','Data Engineering','Hyderabad',7400,91,'ACTIVE',1); 
INSERT INTO student_fees VALUES (3,'Chitra','DevOps','Bengaluru',7400,76,'PENDING',1); 
INSERT INTO student_fees VALUES (4,'Dev','DevOps','Chennai',3400,65,'ACTIVE',2);
INSERT INTO student_fees VALUES (5,'Esha','Data Engineering','Hyderabad',9400,94,'CLOSED',2); 
INSERT INTO student_fees VALUES (6,'Farah','DevOps','Chennai',4400,88,'ACTIVE',3);

select * from employees;
-- drop table employees

-- Business case 1: Employees
-- Q1. Active values above 5000 — employees
select emp_id,emp_name,amount from EMPLOYEES where status = 'ACTIVE' and amount > 5000 order by emp_id;

-- Q2. Values within a range — employees
select emp_id,emp_name,amount from employees where amount between 4000 and 7000 order by amount,emp_name;

-- Q3. Cities using IN employees
select emp_name,city from EMPLOYEES where city in ('Hyderabad','Chennai');

-- Q4. Names starting with A employees
select emp_id,emp_name,city from employees where emp_name like 'A%' order by emp_name;

-- Q5. Records with missing managers employees
select manager_id,emp_id,emp_name from EMPLOYEES where manager_id is null;

-- Q6. Valid manager IDs employees
select emp_id,emp_name,manager_id from employees where manager_id is not null;

-- Q7. Exclude closed records employees
select emp_id,emp_name,manager_id,status from EMPLOYEES where status != upper('Closed') order by emp_name;

-- Q8. First category only employees
select emp_id,emp_name, dept from employees where dept=initcap('Engineering') order by emp_id;

-- Q9. Descending values & ties employees
select emp_id, emp_name, amount from employees order by amount desc,emp_name;

-- Q10. Scores above 85 employees
select emp_id,emp_name,score from employees where score > 85 order by score desc;

-- Q11. Count records by status employees
select status,count(*) from employees where status='ACTIVE' group by status order by status;

-- Q12. Sum amount by category employees
select dept,sum(amount) as total_amount from employees group by dept order by total_amount desc; 

-- Q13. Average amount by city employees
select city,avg(amount) as avg_amount from employees group by city order by city;

-- Q14. Max amount by category employees
select dept,max(amount) as dept_max_amount from employees group by dept order by dept_max_amount desc;

-- Q15. Min amount by city employees
select city,min(amount) as min_amount from employees group by city order by city;

-- Q16. Distinct active cities employees
select distinct city as distinct_city,status from employees where status='ACTIVE' ;

-- Q17. Categories with >= 3 records employees
select dept,count(*) as dep_count from employees group by dept having count(*) >=3;

-- Q18. Conditional active sum employees
select status,sum(amount) as active_amount from employees where status = 'ACTIVE' group by status;

-- Q19. Cities having multiple records employees
select city,count(*) as city_count from employees group by city having count(*)>1;

-- Q20. Grand total and average employees
select sum(amount) as total,round(avg(amount),2) as average from employees;

-- Q21. Above overall average employees
select emp_name,avg(amount) as avg_amount  from employees where amount > (select avg(amount) from employees) group by emp_name order by avg_amount desc ;

-- Q22. Highest amount including ties employees
select emp_name,max(amount) from employees where amount =(select max(amount) from employees) group by emp_name;
select emp_name,amount from employees where amount = (select max(amount) from employees);

-- Q23. Second distinct highest amount employees
select emp_name,max(amount) 
from employees 
where amount < (select max(amount) from employees);

with second_salary as(
    select emp_name, amount from employees where amount < (select max(amount) from employees)
)
select max(amount) as second_highest_salary from second_salary;



-- select max(amount) from employees e1 where 3-1=(select max(amount) from employees e2 where e2.amount>e1.amount);
select * from employees;

-- Q24. Above own category average employees
select distinct(amount) 
from employees 
where amount > (select avg(amount) from employees);

-- Q25. Records from repeated cities employees
-- select city,count(*) from employees  group by city having count(*) > 1;
select emp_name, city from employees where city in (select city from employees group by city having count(*)>1) order by emp_name;

-- BUSINESS CASE 1: EMPLOYEES CONTINUED (Q26 - Q60)
-- Q26. Records with existing manager employees
select emp_name,manager_id from employees where manager_id is not null;

-- Q27. Records managing nobody employees
select * from employees;
select distinct(emp_name) from employees where emp_id not in (select manager_id from employees where manager_id is not null ) order by emp_name;

select e.emp_name as employee_name,m.emp_name as manager_name from employees e join employees m 
on e.emp_id= m.manager_id;
-- select * from BANK_ACCOUNTS;

-- Q28. Category-wise minimum records employees
select 
  emp_name,
  amount,
  dept,
  row_number() over(partition by dept order by amount asc)
from employees ;
-- where row_number() over(partition by dept order by amount asc)= 1;

select 
    emp_name,
    amount,
    dept,
    rn
    from(
        select emp_name,
        amount,
        dept,
        row_number() over(partition by dept order by amount asc) as rn
        from employees
    )
where rn = 1;

-- Q29. Cat 1 > Cat 2 Max employees
with cat_emp as(
 select  dept,count(emp_id) as emp_count from employees where dept = 'HR' group by dept
),
eng_count as(
    select dept,count(emp_id) as eng_count from employees where dept = 'Engineering' group by dept
)
select 
   h.dept,
   h.emp_count,
   e.dept,
   e.eng_count
from cat_emp h cross join eng_count e
where h.emp_count >= e.eng_count;

select emp_name,amount from employees where dept='Engineering' and amount>(
    select max(amount) from employees where dept='HR'
);

-- Q30. Cat 1 < Cat 2 Max employees
select emp_name,amount from employees where dept='Engineering' and amount <(
    select max(amount) from employees where dept='HR'
);

-- Q31. Manager names (Self Join) employees
select 
    e.emp_name,
    m.emp_name as manager_name
from employees e left join employees m
on m.emp_id= e.manager_id order by e.emp_id;

-- Q32. Direct reports per manager employees
with man_count as (
    select
    e.emp_id,
      e.emp_name,
      m.emp_name as manager_name 
      from employees e  join employees m
      on m.emp_id = e.manager_id order by e.emp_id

)
select manager_name,count(emp_id) as reports from man_count group by manager_name order by manager_name;

select m.emp_name,count(e.emp_id) as reports from employees m join employees e on 
e.manager_id = m.emp_id 
group by m.emp_id,m.emp_name order by m.emp_id

-- Q33. Managers in same city employees
select * from employees

select e.emp_name,
     m.emp_name as manager_name 
     from employees e join employees m
     on e.manager_id = m.emp_id and m.city = e.city order by e.emp_name

-- Q34. Anti Join (No reports) employees
select m.emp_name
from employees m left join employees e
on e.manager_id = m.emp_id where e.emp_id is null order by m.emp_name

-- Q35. Unique peer pairs — employees
select a.emp_name,b.emp_name as peer 
from employees a join employees b 
on a.dept = b.dept and a.emp_id < b.emp_id
order by a.emp_name,b.emp_name

-- Q36. Rank by amount employees
select 
    emp_name,
    emp_id,
    amount,
    rank() over(order by amount desc) as rn
from employees

-- Q37. Dense rank by category employees
select 
    emp_id,
    emp_name,
    amount,
    dept,
    dense_rank() over(partition by dept order by amount desc) as rn
from employees 

-- Q38. Top 2 per category employees
select  
   emp_id,
   emp_name,
   amount
   from(
    select 
       emp_id,
       emp_name,
       amount,
       dept,
       dense_rank() over(partition by dept order by amount desc) as dr
       from employees
   )
where dr <=2

-- Q39. Running total employees
select 
    emp_name,
    emp_id,
    amount,
    sum(amount) over(order by emp_id rows between unbounded preceding and current row) as running_total 
from employees order by emp_id

-- Q40. Percentage of total — employees
select 
    emp_name,
    round(100.0* amount/sum(amount) over(),2) as pct
from employees order by emp_id

-- Q41. Previous amount with LAG employees
select 
    emp_name,
    amount,
    lag(amount) over(order by emp_id) as previous_amount
from employees order by emp_id

-- Q42. Next amount with LEAD employees
select 
    emp_id,
    emp_name,
    amount,
    LEAD(amount) over(order by emp_id) as next_amount
from employees order by emp_id

-- Q43. Category total on every row employees
select 
      emp_id,
      emp_name,
      amount,
      sum(amount) over(order by dept) as category_total
from employees order by emp_id

-- Q44. Row number by score employees
select 
    emp_id,
    emp_name,
    score,
    row_number() over( order by score desc) as position
from employees  order by position


-- Q45. Diff from category average employees
select  
     emp_name,
     round(amount-avg(amount) over(partition by dept),2) as delta
from employees order by emp_id

select * from employees
    
-- Q46. Uppercase names employees
select
    emp_name,
    upper(emp_name) as upper_name
from employees order by emp_id

-- Q47. First 3 name characters employees
select 
     emp_name,
     substr(emp_name,1,3) as prefix 
from employees 
order by emp_id

-- Q48. Name length employees
select
    emp_name,
    length(emp_name) as name_length
from employees order by emp_id

-- Q49. Mask lowercase 'a' employees
select 
     emp_name,
     replace(emp_name,'a','*') as mask_name
from employees order by emp_id 

-- Q50. CASE Classification employees
select 
    emp_name,
    amount,
    case
        when amount >=8000 then 'High'
        when amount >= 5000 then 'Medium'
        Else 'Low'
    end as band
from employees 
order by emp_id

-- BUSINESS CASES 1 & 2: EMPLOYEES & BANK ACCOUNTS (Q51 - Q85)
-- Q51. COALESCE missing manager employees
select * from employees
select 
    emp_name,
    COALESCE(manager_id,0) as replace_manager_id
from employees order by emp_id

-- Q52. Absolute deviation from 6000 employees
select 
     emp_name,
     abs(amount-6000) as abs_deviation
from employees order by emp_id

-- Q53. Score remainder (MOD) employees
select 
    emp_id,
    emp_name,
    MOD(score,10) as score_remainder
from employees order by emp_id

-- Q54. Concatenate category & city employees
select 
    emp_name,
    dept || '/' || city as Concatenate_category
from employees order by emp_id

-- Q55. Average score rounded employees
select
   dept,
   round(avg(score),2) as avg_score
from employees
group by dept 
order by dept

-- Q56. CTE filtering totals employees
with filter_cte as(
    select
        dept,
        count(*) as emp_count
        from employees group by dept order by dept
)
select dept,emp_count from filter_cte;

with totals as(
    select
         dept,
         sum(amount) as total
         from employees group by dept
)
select dept,total from totals where total > 15000 order by dept

-- Q57. CTE for high scores employees

with qualified as(
    select 
        emp_name,
        score
    from employees where score > 85
)
select emp_name,score from qualified order by score desc

-- Q58. CTE highest per city employees
with high_paid as(
    select
        emp_name,
        city,
        amount,
        row_number() over(partition by city order by amount desc,emp_id) as rn
    from employees 
)
select emp_name,city,amount from high_paid where rn =1 order by city desc

-- Q59. UNION Active & Pending employees
with active_cte as(
    select 
        city
    from employees where status = 'ACTIVE' 
   

),pending_cte as (
    select 
         city
    from employees where status = 'PENDING'
 

)
select city from active_cte 
UNION 
select city from pending_cte 

SELECT city FROM employees WHERE status='ACTIVE' UNION SELECT city FROM employees WHERE 
status='PENDING' ORDER BY city

-- Q60. INTERSECT cities employees
select 
   city 
from employees 
where status = 'ACTIVE' 
INTERSECT 
select 
   city 
from employees 
where status = 'PENDING'


-- Business case 2: Bank Accounts


-- Q61. Active values > 5000 bank_accounts
select * from bank_accounts

select 
    holder_name,
    status ,
    balance 
from bank_accounts where status = 'ACTIVE' and balance > 5000 

-- Q62. Values within a range bank_accounts
select
    holder_name,
    balance 
from bank_accounts 
where balance between 4000 and 7000

-- Q63. Cities using IN bank_accounts
select 
    holder_name,
    acc_city
from bank_accounts 
where acc_city in ('Chennai','Hyderabad')

-- Q64. Names starting with A bank_accounts
select 
    holder_name,
    acc_id
from bank_accounts 
where holder_name like 'A%'

-- Q65. Missing managers bank_accounts
select * from bank_accounts

select 
    holder_name,
    manager_id
from bank_accounts 
where manager_id is null;

-- Q66. Valid manager IDs bank_accounts
select
     holder_name,
     manager_id
from bank_accounts
where manager_id is not null;

-- Q67. Exclude closed records bank_accounts
select
    holder_name,
    status
from bank_accounts 
where status != 'CLOSED'

-- Q68. First category (Savings) bank_accounts
select * from bank_accounts

select 
     holder_name
from bank_accounts
where acc_type = 'Savings'

-- Q69. Descending values bank_accounts
select 
     holder_name,
     balance
from bank_accounts 
order by balance desc

-- Q70. Scores above 85 bank_accounts
select 
    holder_name,
    score
from bank_accounts 
where score > 85;

-- Q71. Count records by status bank_accounts
select
     status ,
     count(*) as status_count
from bank_accounts 
group by status
order by count(*) desc

-- Q72. Sum amount by category bank_accounts
select
     acc_type,
     sum(balance) as total_balance
from bank_accounts
group by acc_type
order by acc_type

-- Q73. Average amount by city bank_accounts
select  
      acc_city,
      avg(balance) as avg_balance
from bank_accounts 
group by acc_city
order by acc_city;

-- Q74. Max amount by category bank_accounts
select
     acc_type,
     max(balance) as max_amount
from bank_accounts 
group by acc_type
order by acc_type

-- Q75. Min amount by city bank_accounts
select
     acc_city,
     min(balance) as max_amount
from bank_accounts 
group by acc_city
order by acc_city;

-- Q76. Distinct active cities bank_accounts
select
    count(distinct(acc_city)) as distinct_city_count
from bank_accounts 
where status = 'ACTIVE'
group by status

-- Q77. Categories with >= 3 records bank_accounts
select * from bank_accounts

select 
     acc_type,
     count(acc_type) as acc_count
from bank_accounts 
group by acc_type
having count(acc_type) > = 3;

-- Q78. Conditional active sum bank_accounts
select
     status,
     sum(balance) as sum_balance
from bank_accounts
where status = 'ACTIVE'
group by status

-- Q79. Cities having multiple records bank_accounts
select * from bank_accounts
select 
     acc_city,
     count(*) 
from bank_accounts
group by acc_city
having count(*)> 1
order by acc_city
  
-- Q80. Grand total and average bank_accounts
select
    sum(balance) as total,
    round(avg(balance),2) as avg_balance
from bank_accounts

-- Q81. Above overall average bank_accounts
select
    holder_name,
    balance
from bank_accounts 
where balance > (
    select avg(balance) from bank_accounts
)
order by balance desc

-- Q82. Highest amount including ties bank_accounts
select 
    holder_name,
    balance
from bank_accounts 
where balance = (
    select max(balance) from bank_accounts
)

-- Q83. 2nd distinct highest amount bank_accounts
with sec_highest as(
    select 
      distinct holder_name,
      balance
    from bank_accounts
    where balance < (select max(balance) from bank_accounts)
)
select  holder_name,balance from sec_highest 
where balance =(
    select max(balance) from sec_highest
)

with sec_highest as(
    select 
    holder_name,
    balance,
    dense_rank() over(order by balance desc) as dn
from bank_accounts 
)

select 
   holder_name,
   balance
from sec_highest 
where dn=2

-- Q84. Above own category average bank_accounts
select 
   distinct(balance)
from bank_accounts
where balance >(
    select avg(balance) from bank_accounts
)

SELECT 
   x.holder_name,
   x.balance 
FROM bank_accounts x 
WHERE x.balance > (
    SELECT 
       AVG(y.balance) 
    FROM bank_accounts y 
    WHERE y.acc_type=x.acc_type 
)
ORDER BY x.holder_name

-- Q85. Records from repeated cities bank_accounts
select * from bank_accounts

select 
   holder_name,
    acc_city
from bank_accounts 
where acc_city in ( 
    select acc_city 
    from bank_accounts 
    group by acc_city
    having count(*) > 1
)
order by holder_name

-- Q86. Records with existing manager bank_accounts
select * from bank_accounts

select 
    x.holder_name
from bank_accounts x
where exists(
    select 1
    from bank_accounts m
    where m.manager_id is not null 
      and m.holder_name= x.holder_name
)

-- Q87. Records managing nobody bank_accounts
select 
   x.holder_name
from bank_accounts x
where not exists (
    select 1 
    from bank_accounts m
    where m.manager_id = x.acc_id 
)

-- Q88. Category minimum records bank_accounts
select 
     x.holder_name,
     x.acc_type,
     x.balance
from bank_accounts x
where balance = (
    select 
      min(y.balance)
    from bank_accounts y
    where y.acc_type = x.acc_type
)

-- Q89. Savings > Current Max bank_accounts
select * from bank_accounts
select 
    holder_name,
    balance 
from bank_accounts
where acc_type = 'Savings'
and balance > (
    select
       max(balance)
    from bank_accounts
    where acc_type = 'Current'
)

-- Q90. Savings < Current Max bank_accounts
select
   holder_name,
   balance
from bank_accounts
where acc_type ='Savings'
and balance < (
    select 
       max(balance)
    from bank_accounts
    where acc_type = 'Current'

)

-- Q91. Manager names (Self Join) bank_accounts

select
   e.holder_name,
   m.holder_name as manager_name
from bank_accounts e left join bank_accounts m
on m.acc_id = e.manager_id order by e.acc_id

-- Q92. Direct reports per manager bank_accounts

select
    m.holder_name,
    count(e.acc_id) as reports
from bank_accounts m join bank_accounts e
on e.manager_id = m.acc_id
group by m.acc_id,m.holder_name
order by m.acc_id

-- Q93. Managers in same city bank_accounts

with reports as(
    select
   e.holder_name,
   m.holder_name as manager_name
from bank_accounts e join bank_accounts m
on m.acc_id = e.manager_id
and m.acc_city = e.acc_city
order by e.holder_name
)
select * from reports

-- Q94. Anti Join (No reports) bank_accounts
select 
    m.holder_name
from bank_accounts m  left join bank_accounts e
on m.acc_id = e.manager_id
where e.acc_id is null
order by m.holder_name

-- Q95. Unique peer pairs — bank accounts
select
    a.holder_name,
    b.holder_name as peer
from bank_accounts a 
join bank_accounts b
on a.acc_type = b.acc_type 
and a.acc_id < b.acc_id 
order by a.holder_name,b.holder_name

-- Q96. Rank by amount bank_accounts
select 
   holder_name,
   rank() over(order by balance desc) as rn
from bank_accounts

-- Q97. Dense rank by category bank_accounts
select 
    acc_type,
    holder_name,
    dense_rank() over(partition by acc_type order by balance desc)  as dr
from bank_accounts 
order by acc_type,dr,holder_name

-- Q98. Top 2 per category bank_accounts
with top_2 as(
    select
       holder_name,
       acc_type,
       balance,
       dense_rank() over(partition by acc_type order by balance desc) as dr
    from bank_accounts 
)
select * from top_2 where dr < = 2


-- Q99. Running total bank_accounts
select
    holder_name,
    balance,
    sum(balance) over(order by acc_id  rows between unbounded preceding and current row) as running_total
from bank_accounts
order by acc_id

-- Q100. Percentage of total bank_accounts
select 
    holder_name,
    round(100.0*balance/sum(balance) over(),2) as pct 
from bank_accounts
order by acc_id

-- Q101. Previous amount (LAG) bank_accounts
select 
    holder_name,
    lag(balance) over(order by acc_id) as previous_amount
from bank_accounts
order by acc_id

-- Q102. Next amount (LEAD) bank_accounts
select 
    holder_name,
    balance,
    lead(balance) over(order by acc_id) as next_amount
from bank_accounts
order by acc_id

-- Q103. Category total on every row bank_accounts
SELECT  
   acc_type,
   sum(balance) as category_total
from bank_accounts
group by acc_type
order by acc_type desc

-- Q104. Row number by score bank_accounts
select 
   holder_name,
   score,
   row_number() over(order by score desc) as dr
from bank_accounts
order by dr

-- Q105. Diff from category avg bank_accounts
select 
   holder_name,
   round(balance - avg(balance) over(partition by acc_type),2) as delta
from bank_accounts
order by acc_id

-- Q106. Uppercase names retail_orders
select *  from retail_orders
select upper(cust_name) from retail_orders

-- Q107. First 3 name chars retail_orders
select substr(cust_name,1,3) from retail_orders

-- Q108. Name length retail_orders
select cust_name,length(cust_name) from retail_orders

-- Q109. Mask lowercase 'a' retail_orders
select
    cust_name,
    replace(cust_name,'a','*') as mask_name
from retail_orders

-- Q110. CASE Band Classification retail_orders
select
    cust_name,
    amount,
    case
       when amount >= 8000 then 'High'
       when amount >= 5000 then 'Medium'
       else 'Low'
    end 
    as category
from retail_orders
order by cust_id

-- Q111. COALESCE missing manager retail_orders
select 
    cust_name,
    COALESCE(manager_id,0) as coalsece_manager
from retail_orders
order by cust_id

-- Q112. Deviation from 6000 retail_orders
select * from retail_orders

select 
   cust_name,
   abs(amount-6000) as deviation_balance
from retail_orders
order by cust_id
 
-- Q113. Score remainder (MOD) retail_orders
select 
   cust_name,
   MOD(score,10) as score_remainder
from retail_orders
order by cust_id

-- Q114. Concatenate category/city retail_orders
select 
    cust_name,
    payment_type || '/' || city as concate_payment_city
from retail_orders
order by cust_id

-- Q115. Average score rounded retail_orders
select 
    payment_type,
    round(avg(score),2) as average_score
from retail_orders
group by payment_type
order by payment_type

-- Q116. CTE filtering totals retail_orders
with filter_total as(
    select
       payment_type,
       sum(amount) as total
    from retail_orders
    group by payment_type
    order by payment_type
)

select payment_type,total from filter_total where payment_type = 'Online'

-- Q117. CTE high scores retail_orders
with high_cte as(
    select 
       cust_name,
       score
    from retail_orders
    order by score desc

)

select * from high_cte where score > 85

-- Q118. CTE highest per city retail_orders
select * from retail_orders
with high_city as (
    select
      city,
      max(amount)
    from retail_orders 
    group by city
)
select * from high_city

with high_city as (
  select
   cust_name,
   city,
   amount,
   row_number() over(partition by city order by amount desc) as rn
  from  retail_orders
  order by amount
)

select cust_name, city,amount from high_city where rn = 1 order by city 

-- Q119. UNION Active & Pending retail_orders
select * from retail_orders
select 
   distinct(city)
from retail_orders
where status = 'ACTIVE'
UNION
select
    distinct(city)
from retail_orders
where status = 'PENDING'

-- Q120. INTERSECT cities retail_orders
select 
    city
from retail_orders
where status = 'ACTIVE'
INTERSECT
select 
    city 
from retail_orders
where status = 'PENDING'

-- Q121. Active values > 5000 retail_orders
select * from retail_orders

select 
     cust_name,
     amount
from retail_orders
where status = 'ACTIVE' and 
amount > 5000
order by cust_id

-- Q122. Values within a range retail_orders
select 
   cust_name,
   amount
from retail_orders
where amount > 4000 and amount < 6000

-- Q123. Cities using IN retail_orders
select
    cust_name,
    city
from retail_orders
where city in ('Hyderabad','Chennai')

-- Q124. Names starting with A retail_orders
select 
    cust_name
from retail_orders
where cust_name like 'A%'
order by cust_id

-- Q125. Missing managers retail_orders
select 
    cust_name
from retail_orders
where manager_id is null
order by cust_id

-- Q126. Valid manager IDs retail_orders
SELECT
   cust_name,
   manager_id
from retail_orders
where manager_id is not null
order by cust_id

-- Q127. Exclude closed records retail_orders
select 
   cust_name,
   status
from retail_orders
where status != 'CLOSED'

-- Q128. First category (Online) retail_orders
select 
   cust_name,
   payment_type
from retail_orders
where payment_type = 'Online'

-- Q129. Descending values retail_orders
select 
   cust_name,
   amount
from retail_orders
order by amount desc 

-- Q130. Scores above 85 retail_orders
select
   cust_name,
   score
from retail_orders
where score>85

-- Q131. Count records by status retail_orders
select
   status,
   count(*)
from retail_orders
group by status
order by status

-- Q132. Sum amount by category retail_orders
select 
   payment_type,
   sum(amount) as category_total
from retail_orders
group by payment_type
order by payment_type

-- Q133. Average amount by city retail_orders
select
   city,
   avg(amount) as avg_amount
from retail_orders 
group by city
order by city

-- Q134. Max amount by category retail_orders
select
   payment_type,
   max(amount) as max_amount
from retail_orders
group by payment_type

-- Q135. Min amount by city retail_orders
select 
   city,
   min(amount) as min_amount
from retail_orders
group by city
order by city

-- Q136. Distinct active cities retail_orders
select 
     count(distinct city) as ditinct_count
from retail_orders
where status = 'ACTIVE'

-- Q137. Categories with >= 3 records retail_orders
select
   payment_type,
   count(*) 
from retail_orders
group by payment_type
having count(*) > = 3

-- Q138. Conditional active sum retail_orders
select 
     status ,
     sum(amount) as total_amount
from retail_orders
where status = 'ACTIVE'
group by status 

-- Q139. Cities having multiple records retail_orders
select 
    city,
    count(*) as count_city
from retail_orders
group by city

-- Q140. Grand total and average retail_orders
select
    sum(amount) as total_amount,
    round(avg(amount),2) as avg_amount
from retail_orders

-- Q141. Above overall average retail_orders
select
    cust_name,
    amount
from retail_orders
where amount > (
    select avg(amount) from retail_orders
)
order by amount desc

-- Q142. Highest amount including ties retail_orders
select
    cust_name,
    amount 
from retail_orders
where amount = (
    select max(amount) from retail_orders
)

-- Q143. 2nd distinct highest amount retail_orders
with sec_amount as  (
    select 
       distinct cust_name,
       amount
    from retail_orders
    where amount <(
    select max(amount) from retail_orders
    )
)  

select cust_name,amount as sec_amount 
from sec_amount
where amount = (
    select 
      max(amount) from  sec_amount
)

with sec_high as(
 select 
    cust_name,
    amount,
    dense_rank() over(order by amount desc) as dn 
 from retail_orders
)
select 
   cust_name,
   amount 
from sec_high 
where dn =2  

-- Q144. Above own category average retail_orders
select 
   x.cust_name,
   x.amount 
from retail_orders x
where  x.amount > (
    select 
       avg(y.amount)
    from retail_orders y
    where y.payment_type = x.payment_type
)
order by cust_name

-- Q145. Records from repeated cities retail_orders
select 
   cust_name,
   city 
from retail_orders 
where city in(
    select 
     city
   from retail_orders
   group by city
   having count(*) > 1
)
order by cust_name

-- Q146. Records with existing manager retail_orders
select
   x.cust_name
from retail_orders x
where exists (
    select 1
    from retail_orders m
    where x.manager_id = m.manager_id
)
order by x.cust_name

-- Q147. Records managing nobody retail_orders
select
   x.cust_name
from retail_orders x
where not exists(
    select 1
    from retail_orders m
    where x.cust_id= m.manager_id
)
order by x.cust_name

-- Q148. Category minimum records retail_orders
select 
    payment_type,
    min(amount) as min_amount
from retail_orders
group by payment_type
order by payment_type

-- Q149. Online > Store Max retail_orders
select * from retail_orders
select
   cust_name,
   amount
from retail_orders
where payment_type = 'Online' and
amount >(
    select 
       max(amount)
    from retail_orders
    where payment_type = 'Store'
)

-- Q150. Online < Store Max retail_orders
select
  cust_name,
  amount
from retail_orders
where payment_type = 'Online' 
and amount < (
    select 
     max(amount) 
    from retail_orders
    where payment_type = 'Store'
)

-- Q151. Manager names using self join — retail orders
select
   x.cust_name,
   m.cust_name as manager_name
from retail_orders x
left join retail_orders m
on x.manager_id = m.cust_id
order by x.cust_id

-- Q152. Direct reports per manager — retail orders
select
   m.cust_name,
   count(e.cust_name) as reports
from retail_orders m
join retail_orders e
on e.manager_id = m.cust_id 
group by m.cust_id,m.cust_name
order by m.cust_id


-- Q153. Managers in same city — retail orders
select 
    e.cust_name,
    m.cust_name as manager_name
from retail_orders e
join retail_orders m
on m.cust_id = e.manager_id
and m.city = e.city
order by e.cust_name

-- Q154. No direct reports using anti join — retail orders
select
   m.cust_name
from retail_orders m
left join retail_orders e
on e.manager_id = m.cust_id
where e.cust_id is null
order by m.cust_name

-- Q155. Unique peer pairs — retail orders
select 
   x.cust_name,
   y.cust_name as peer 
from retail_orders x
join retail_orders y 
on x.payment_type = y .payment_type
and x.cust_id < y.cust_id 
order by x.cust_name , y.cust_name

-- Q156. Rank by amount — retail orders
select 
   cust_name,
   amount,
   rank() over(order by amount desc) as rn
from retail_orders 
order by rn

-- Q157. Dense rank by category — retail orders
select
   cust_name,
   amount,
   dense_rank() over(partition by payment_type order by amount desc) as drn
from retail_orders 
order by payment_type,drn,cust_name

-- Q158. Top two per category — retail orders
with dnk_cat as(
    select 
      cust_name,
      amount,
     dense_rank() over(partition by payment_type order by amount desc) as dnr
    from retail_orders
)
select * from dnk_cat where dnr <= 2

-- Q159. Running total — retail orders
select
   cust_name,
   sum(amount) over(order by cust_id rows between unbounded preceding and current row) as running_total
from retail_orders
order by cust_id

-- Q160. Percentage of total — retail orders
select 
   cust_name,
   round(100.0 * amount/sum(amount) over(),2) as pct
from retail_orders
order by cust_id

-- Q161. Previous amount (LAG) retail_orders
select 
    cust_name,
    amount,
    lag(amount) over(order by cust_id) as previous
from retail_orders
order by cust_id

-- Q162. Next amount (LEAD) retail_orders
select 
   cust_name,
   amount,
   lead(amount) over(order by cust_id)  as next_amount
from retail_orders 
order by cust_id

-- Q163. Category total on every row retail_orders
select
   payment_type,
   sum(amount) as category_total
from retail_orders
group by payment_type
order by payment_type

-- Q164. Row number by score retail_orders
SELECT
   cust_name,
   score,
   amount,
   row_number() over(order by score desc) as rn
from retail_orders
order by rn 

-- Q165. Diff from category avg retail_orders
select 
   cust_name,
   round(amount - avg(amount) over(partition by payment_type ),2) as cat_difference
from retail_orders
order by cust_name

-- Q166. Uppercase names — retail orders
select 
   cust_name,
   upper(cust_name) as upper_name
from retail_orders
order by cust_name

-- Q167. First three name characters — retail orders
select 
   cust_name,
   substr(cust_name,1,3)
from retail_orders
order by cust_name

-- Q168. Name length — retail orders
select 
   cust_name,
   length(cust_name) as cust_length
from retail_orders
order by cust_name

-- Q169. Mask lowercase a — retail orders
select 
   cust_name,
   replace(cust_name,'a','*') as mask_cust
from retail_orders
order by cust_name

-- Q170. Amount classification using CASE — retail orders
select 
  cust_name,
  amount,
  case 
     when amount >= 8000 then 'High'
     when amount >= 5000 then 'Middle'
     else 'Low'
  end as case_amount
from retail_orders
order by cust_name

-- Q171. Replace missing manager with zero — retail orders
select
   cust_name,
   COALESCE(manager_id, 0) as replace_missing
from retail_orders
order by cust_name

-- Q172. Absolute deviation from 6000 — retail orders
select 
   cust_name,
   abs(amount-6000) as abs_deviation
from retail_orders 
order by cust_id

-- Q173. Score remainder — retail orders
select
   cust_name,
   mod(score,10) as score_remainder
from retail_orders 
order by cust_name

-- Q174. Concatenate category and city — retail orders
select 
    cust_name,
    payment_type || '/' || city as cust_concate
from retail_orders

-- Q175. Average score rounded — retail orders
SELECT
   payment_type,
   round(avg(score),1) as avg_round
from retail_orders 
group by payment_type

-- Q176. CTE filtering category totals — retail orders
with cat_total as(
    select 
       payment_type,
       sum(amount) as total
    from retail_orders
    group by payment_type
)

select payment_type,total 
from cat_total
where total > 15000
order by payment_type

-- Q177. CTE for high scores — retail orders
with high_score as(
    select 
      cust_name,
      score
    from retail_orders
    where score >= 85
)
select cust_name,score from high_score

-- Q178. CTE for highest per city — retail orders
with high_city as(
    select 
      cust_name,
      city,
      amount,
      row_number() over(partition by city order by amount desc) as rn
    from retail_orders

)
select * from high_city where rn = 1

-- Q179. UNION active and pending cities — retail orders
select 
   city
from retail_orders
where status = 'ACTIVE'
UNION
select 
  city 
from retail_orders
where status = 'PENDING'

-- Q180. INTERSECT cities across categories — retail orders
select 
  city 
from retail_orders
where payment_type = 'Online'

INTERSECT
select 
  city
from retail_orders
where payment_type = 'Store'

-- Q181. Active values > 5000 insurance_claims
select * from insurance_claims
select 
  cust_name,
  amount 
from insurance_claims
where amount > 5000 and status = 'ACTIVE'

-- Q182. Values within a range insurance_claims
SELECT 
   CUST_NAME,
   amount
from insurance_claims
where amount > 4000 and amount < 6000

-- Q183. Cities using IN insurance_claims
select
   cust_name,
   city
from insurance_claims
where city in ('Hyderabad' , 'Chennai')

-- Q184. Names starting with A insurance_claims
select
  cust_name
from insurance_claims
where cust_name like 'A%'

-- Q185. Missing managers insurance_claims
SELECT 
   cust_name,
   manager_id
from insurance_claims
where manager_id is null

-- Q186. Valid manager IDs insurance_claims
select
   cust_name,
   manager_id
from insurance_claims
where manager_id is not null

-- Q187. Exclude closed records insurance_claims
select
  cust_name,
  status
from insurance_claims
where status != 'CLOSED'

-- Q188. First category (Health) insurance_claims
select
   cust_name
from insurance_claims
where ins_type = 'Health'

-- Q189. Descending values insurance_claims
select 
   cust_name,
   amount
from insurance_claims
order by amount desc

-- Q190. Scores above 85 insurance_claims
select 
   cust_name,
   score
from insurance_claims
where score > 85

-- Q191. Count records by status insurance_claims
select
   status ,
   count(status) 
from insurance_claims
group by status
order by status

-- Q192. Sum amount by category insurance_claims
select
    ins_type,
    sum(amount) 
from insurance_claims
group by ins_type

-- Q193. Average amount by city insurance_claims
select 
   city,
   avg(amount) 
from insurance_claims
group by city

-- Q194. Max amount by category insurance_claims
select
   ins_type,
   max(amount) 
from insurance_claims
group by ins_type

-- Q195. Min amount by city insurance_claims
select 
   city,
   min(amount)
from insurance_claims
group by city

-- Q196. Distinct active cities insurance_claims
select 
   count(distinct city) 
from insurance_claims

-- Q197. Categories with >= 3 records insurance_claims
select 
   ins_type,
   count(*) 
from insurance_claims
group by ins_type
having count(*) >= 3

-- Q198. Conditional active sum insurance_claims
select 
    sum(amount)
from insurance_claims
where status = 'ACTIVE'

-- Q199. Cities having multiple records insurance_claims
select 
   city,
   count(*)
from insurance_claims
group by city
having count(*)>1

-- Q200. Grand total and average insurance_claims
select 
   sum(amount),
   round(avg(amount),2)
from insurance_claims

-- Q201. Above overall average insurance_claims
select 
  cust_name,
  amount
from insurance_claims
where amount > (
    select avg(amount) from insurance_claims
)
order by amount desc

-- Q202. Highest amount including ties insurance_claims
select 
  cust_name,
  amount
from insurance_claims
where amount =(
    select
       max(amount)
    from insurance_claims
)

-- Q203. 2nd distinct highest amount insurance_claims
with sec_high as(
    select
      cust_name,
      amount
    from insurance_claims
    where amount < (
        select 
          max(amount) 
        from insurance_claims
    )
)
select * from sec_high
where amount = (
    select 
       max(amount) from sec_high
)

-- Q204. Above own category average insurance_claims
select
   x.cust_name, 
   x.amount
from insurance_claims x
where x.amount > (
    select 
      avg(y.amount)
    from insurance_claims y
    where x.ins_type = y.ins_type
)

with above_cte as(
    select 
       ins_type,
       avg(amount)
    from insurance_claims
    group by ins_type
)



WITH above_cte AS (
    SELECT
        ins_type,
        AVG(amount) AS avg_amount
    FROM insurance_claims
    GROUP BY ins_type
)
SELECT
    a.ins_type,
    a.amount,
    b.avg_amount
FROM insurance_claims a
JOIN above_cte b
    ON a.ins_type = b.ins_type
WHERE a.amount > b.avg_amount;


-- Q205. Records from repeated cities insurance_claims
select 
   cust_name,
   city
from insurance_claims
where city in (
    select 
      city
    from insurance_claims
    group by city
    having count(city) > 1
)

-- Q206. Records with existing manager insurance_claims
select * from insurance_claims
select 
   x.cust_name
from insurance_claims x
where exists(
    select 
       1
    from insurance_claims y
    where y.ins_id = x.manager_id
)
order by x.cust_name

-- Q207. Records managing nobody insurance_claims
select 
   x.cust_name
from insurance_claims x
where not exists(
    select 
      1
    from insurance_claims y
    where x.ins_id = y.manager_id
)

-- Q208. Category minimum records insurance_claims
with min_records as (
    select 
        cust_name,
        amount,
        row_number() over(partition by ins_type order by amount desc) as rn
    from insurance_claims

)
select * 
from min_records 
where rn >2

-- Q209. Health > Motor Max insurance_claims
select 
   cust_name,
   amount
from insurance_claims
where ins_type = 'Health' 
and amount >(
    select 
       max(amount)
    from insurance_claims
    where ins_type = 'Motor'
    
)

-- Q210. Health < Motor Max insurance_claims
select 
   cust_name,
   amount
from insurance_claims
where ins_type = 'Health'
and amount < (
    select 
      max(amount)
    from insurance_claims
    where ins_type = 'Motor'
)

-- Q211. Manager Self Join insurance_claims
select 
  x.cust_name,
  m.cust_name as manager_name
from insurance_claims x
left join insurance_claims m
on m.ins_id = x.manager_id
order by x.cust_name

-- Q212. Direct reports per manager — insurance claims
select * from insurance_claims
select 
  x.cust_name,
  count(y.ins_id) as reports 
from insurance_claims x
join insurance_claims y
on y.manager_id = x.ins_id
group by x.ins_id, x.cust_name
order by x.ins_id

-- Q213. Managers in same city — insurance claims
select 
  x.cust_name,
  y.cust_name as manager_name
from insurance_claims x
join insurance_claims y 
on y.manager_id = x.ins_id
and x.city = y.city
order by x.cust_name

-- Q214. No direct reports using anti join — insurance claims
select 
  x.cust_name
from insurance_claims x
left join insurance_claims y 
on y.manager_id = x. ins_id
where y.ins_id is null
order by x.cust_name

-- Q215. Unique peer pairs — insurance claims
select 
   x.cust_name,
   y.cust_name as peer
from insurance_claims x
join insurance_claims y 
on y.ins_type = x.ins_type 
and x.ins_id < y.ins_id
order by x.cust_name

-- Q216. Rank by amount — insurance claims
select 
  cust_name,
  amount,
  rank() over(order by amount desc) as rn
from insurance_claims
order by rn

-- Q217. Dense rank by category — insurance claims
select 
  cust_name,
  amount,
  dense_rank() over(partition by ins_type order by amount desc) as dnr
from insurance_claims 
order by ins_type,dnr

-- Q218. Top two per category — insurance claims
with top_2 as (
  select 
    cust_name,
    dense_rank() over(partition by ins_type order by amount desc) as dnr
  from insurance_claims
)
select * from top_2 where dnr <=2

-- Q219. Running total — insurance claims
select 
  cust_name,
  sum(amount) over(order by ins_id rows between unbounded preceding and current row) as running_total
from insurance_claims

-- Q220. Percentage of total — insurance claims
select 
  cust_name,
  round(100.0 * amount/sum(amount) over(),2) as pct
from insurance_claims
order by ins_id




-- Q221. Previous amount (LAG) insurance_claims
select
  cust_name,
  lag(amount) over(order by ins_id) as previous
from insurance_claims
order by ins_id

-- Q222. Next amount (LEAD) insurance_claims
select 
   cust_name,
   lead(amount) over(order by ins_id) as Next
from insurance_claims
order by ins_id

-- Q223. Category total on every row insurance_claims
select 
   ins_type,
   sum(amount) as cat_total
from insurance_claims
group by ins_type

-- Q224. Row number by score insurance_claims
select  
  cust_name,
  score,
  row_number() over(order by score desc) as rn
from insurance_claims
order by rn 

-- Q225. Diff from category avg insurance_claims
select 
  cust_name,
  round(amount - avg(amount) over(partition by ins_type),2) as diff_cat
from insurance_claims
order by cust_name 

-- Q226. Uppercase names — insurance claims
select * from student_fees
select 
  cust_name,
  upper(cust_name) as upper_name
from insurance_claims
order by cust_name

-- Q227. First three name characters — insurance claims
select 
  cust_name,
  substr(cust_name,1,3) as first_char
from insurance_claims
order by cust_name

-- Q228. Name length — insurance claims
select 
  cust_name,
  length(cust_name) as name_length
from insurance_claims

-- Q229. Mask lowercase a — insurance claims
select 
  cust_name,
  replace(cust_name,'a','*') as mask_name
from insurance_claims
order by ins_id

-- Q230. Amount classification using CASE — insurance claims

select 
   cust_name,
   case 
     when amount >= 8000 then 'High'
     when amount >= 5000 then 'Medium'
     else 'Low'
   end as case_band
from insurance_claims

-- Q231. Replace missing manager with zero — insurance claims

select 
   cust_name,
   COALESCE(manager_id,0) as coalsece_manager
from insurance_claims
order by ins_id

-- Q232. Absolute deviation from 6000 — insurance claims
select 
   cust_name,
   abs(amount-6000) as dev_fee
from insurance_claims
order by cust_id

-- Q233. Score remainder — insurance claims
select * from student_fees
select 
   cust_name,
   mod(score,10) as mod_score
from insurance_claims
order by ins_id



-- Q234. Concatenate category and city — insurance claims
select * from insurance_claims
select 
  cust_name,
  ins_type|| '/' || city as concate_city
from insurance_claims

-- Q235. Average score rounded — insurance claims
select 
   ins_type,
   round(avg(score),2) as avg_round
from insurance_claims
group by ins_type

-- Q236. CTE filtering category totals — insurance claims
with cte_filter as(
    select 
      ins_type,
      sum(amount) as total_amount
    from insurance_claims
    group by ins_type
)

select ins_type,total_amount from cte_filter
where total_amount > 16000

-- Q237. CTE for high scores — insurance claims
with high_cte as(
    select
      cust_name,
      score
    from insurance_claims
)
select 
  * 
from high_cte
where score >= 88

-- Q238. CTE for highest per city — insurance claims
with high_cte as (
    select 
       cust_name,
       city,
       amount
    from insurance_claims
)
select 
  city,
  max(amount) 
from high_cte
group by city

with rank_cte as(
    select 
      st_name,
      st_city,
      amount,
      row_number() over(partition by st_city order by amount desc) as rn
    from student_fees
)

select 
   st_name,
   st_city,
   amount
from rank_cte
where rn =1


-- Q239. UNION active and pending cities — insurance claims
select
  city
from insurance_claims
where status = 'ACTIVE'
UNION
select 
   city
from insurance_claims
where status = 'PENDING'

-- Q240. INTERSECT cities across categories — insurance claims
select
  city
from insurance_claims
where status = 'ACTIVE'
INTERSECT
select 
  city
from insurance_claims
where status = 'PENDING'

-- Q241. Active values > 5000 student_fees
select 
   st_name,
   amount
from student_fees
where status = 'ACTIVE'
and amount > 5000

-- Q242. Values within a range student_fees
select  
   st_name,
   amount
from student_fees
where amount >= 3500 and amount <= 6000

-- Q243. Cities using IN student_fees
select 
  st_name,
  st_city
from student_fees
where st_city in('Hyderabad','Chennai')

-- Q244. Names starting with A student_fees
select 
   st_name
from student_fees
where st_name like 'A%'

-- Q245. Missing managers student_fees
select 
   st_name
from student_fees
where manager_id is null

-- Q246. Records with valid manager IDs — student fees
select 
   st_name
from student_fees
where manager_id is not null

-- Q247. Exclude closed records — student fees
select 
   st_name,
   status 
from student_fees
where status != 'CLOSED'

-- Q248. First category only — student fees
select * from student_fees
select 
  st_name
from student_fees
where st_dept = 'Data Engineering'

-- Q249. Descending values and stable ties — student fees
select 
   st_name,
   amount
from student_fees
order by amount desc

-- Q250. Scores above 85 — student fees
select 
  st_name,
  marks
from student_fees
where marks > 85

-- Q251. Count records by status — student fees
select 
   status,
   count(*) as status_count
from student_fees
group by status 

-- Q252. Sum amount by category — student fees
select  * from student_fees
select 
  st_dept,
  sum(amount) as cat_total
from student_fees
group by st_dept

-- Q253. Average amount by city — student fees
select 
   st_city,
   avg(amount) as avg_amount
from student_fees
group by st_city

-- Q254. Maximum amount by category — student fees
select 
  st_dept,
  max(amount) as max_amount
from student_fees
group by st_dept

-- Q255. Minimum amount by city — student fees
select 
   st_city,
   min(amount) as min_amount
from student_fees
group by st_city

-- Q256. Distinct active cities — student fees
select 
   count(distinct(st_city)) as count_distict
from student_fees

-- Q257. Categories with three records — student fees
select 
  st_dept,
  count(*) as dept_count
from student_fees
group by st_dept
having count(*) >= 3

-- Q258. Conditional active sum — student fees
select 
   sum(amount) as total
from student_fees
where status = 'ACTIVE'

-- Q259. Cities having multiple records — student fees
select 
  st_city,
  count(*) as city_count
from student_fees
group by  st_city
having count(*) > 1

-- Q260. Grand total and average — student fees
select * from student_fees
select 
  sum(amount) as grand_total,
  round(avg(amount),2) as avg_amount
from student_fees

-- Q261. Above overall average — student fees
select 
   st_name,
   amount
from student_fees
where amount > (
    select 
      avg(amount)
    from student_fees
)

-- Q262. Highest amount including ties — student fees
select
  st_name,
  amount
from student_fees 
where amount = (
    select
     max(amount)
    from student_fees
)

-- Q263. Second distinct highest amount — student fees
with sec_amount as(
    select 
       st_name,
       amount,
       dense_rank() over(order by amount desc) as drn 
    from student_fees
)
select * from sec_amount
where drn  =2

-- Q264. Above own category average — student fees
select 
      x.st_name,
      x.amount
from student_fees x
where x.amount >(
    select 
        avg(y.amount)
    from student_fees y
    where y.st_dept = x.st_dept
    )
order by x.st_name

-- Q265. Records from repeated cities — student fees
select 
  st_name,
  st_city
from student_fees
where st_city in (
    select 
      st_city
    from student_fees
    group by st_city
    having count(*) > 1
)

-- 266. Records with existing manager — student fees
select 
  x.st_name
from student_fees x
where exists(
    select 
      1 
    from student_fees y
    where x.manager_id = y.st_id
)
order by x.manager_id

-- Q267. Records managing nobody — student fees
select 
  x.st_name
from student_fees x
where not exists(
    select 
      1
    from student_fees y
    where x .manager_id = y.st_id
)
order by x.manager_id

-- Q268. Category-wise minimum records — student fees
select 
   x.st_name,
   x.Amount
from student_fees x
where x.amount = (
    select 
      min(y.amount)
    from student_fees y
    where y.st_dept = x.st_dept
)
order by x.st_dept

-- Q269. First category above second category maximum — student fees
select * from student_fees
select 
  st_name,
  amount
from student_fees
where st_dept = 'Data Engineering' and 
amount >(
    select 
      max(amount)
    from student_fees
    where st_dept = 'DevOps'
)

-- Q270. First category below second category maximum — student fees
select 
  st_name,
  amount
from student_fees
where st_dept = 'Data Engineering' and 
amount <(
    select 
      max(amount)
    from student_fees
    where st_dept = 'DevOps'
)
   
-- Q271. Manager names using self join — student fees
select 
   x.st_name,
   y.st_name as manager_name
from student_fees x
left join student_fees y
on x.manager_id = y.st_id
order by x.st_name

-- Q272. Direct reports per manager — student fees
select 
   x.st_name ,
   count(x.st_id)
from student_fees x
join student_fees y
on y.manager_id = x.st_id 
group by x.st_id , x.st_name
order by x.st_id

-- Q273. Managers in same city — student fees
select 
  x.st_name,
  y.st_name as manager_name
from student_fees x
join student_fees y
on y.manager_id = x.st_id
and x.st_city = y.st_city
order by x.st_name

-- Q274. No direct reports using anti join — student fees
select 
  x.st_name
from student_fees x
left join student_fees m
on m.manager_id = x.st_id 
where m.st_id is null 
order by m.st_name

-- Q275. Unique peer pairs — student fees
select 
  x.st_name,
  y.st_name
from student_fees x
join student_fees y
on x.st_dept = y.st_dept
and x.st_id < y.st_id
order by x.st_name,y.st_name

-- Q276. Rank by amount — student fees
select 
   st_name,
   amount,
   rank() over(order by amount desc) as rn
from student_fees
order by rn

-- Q277. Dense rank by category — student fees
select 
  st_name,
  st_dept,
  amount,
  dense_rank() over(partition by st_dept order by amount desc) as dnr
from student_fees
order by st_dept

-- Q278. Top two per category — student fees
with top_2 as(
    select 
      st_name,
      amount,
      dense_rank() over(partition by st_dept order by amount desc) as dnr
    from student_fees
    order by st_dept
)
select * from top_2
where dnr <= 2

-- Q279. Running total — student fees
select 
  st_name,
  sum(amount) over(order by st_id rows between unbounded preceding and current row) as running_total
from student_fees
order by st_id

-- Q280. Percentage of total — student fees
select 
  st_name,
  round(100.0*amount/sum(amount) over(),2) as pct
from student_fees

-- Q281. Previous amount with LAG — student fees
select 
  st_name,
  lag(amount) over(order by st_id) as previous_amount
from student_fees
order by st_name

-- Q282. Next amount with LEAD — student fees
select 
   st_name,
   lead(amount) over(order by st_id) as next_amount
from student_fees
order by st_name

-- Q283. Category total on every row — student fees
select 
  st_name,
  st_dept,
  sum(amount) over(partition by st_dept) as cat_total
from student_fees

-- Q284. Row number by score — student fees
select 
  st_name,
  amount,
  row_number() over(order by marks desc) as rn
from student_fees

-- Q285. Difference from category average — student fees
select 
  st_name,
  round(amount - avg(amount) over(partition by st_dept),2 ) as difference_amount
from student_fees
order by st_name

-- Q286. Uppercase names — student fees
select 
  st_name,
  upper(st_name) as upper_name
from student_fees
order by st_name

-- Q287. First three name characters — student fees
select 
  st_name,
  substr(st_name,1,3) as first_char
from student_fees
order by st_id

-- Q288. Name length — student fees
select 
  st_name,
  length(st_name) as name_length
from student_fees
order by st_name

-- Q289. Mask lowercase a — student fees
select 
  st_name,
  replace(st_name,'a','$') as mask_cust
from student_fees

-- Q290. Amount classification using CASE — student fees
select 
  st_name,
  amount,
  case 
    when amount >= 8000 then 'High'
    when amount >= 5000 then 'Medium'
    else 'Low'
  end as case_amount
from student_fees

-- Q291. Replace missing manager with zero — student fees
select
  st_name, 
  COALESCE(manager_id,0)
from student_fees

-- Q292. Absolute deviation from 6000 — student fees
select 
  st_name,
  abs(amount - 6000) as abs_deviation
from student_fees

-- Q293. Score remainder — student fees
select 
  st_name,
  mod(marks,10) as score_remainder
from student_fees

-- Q294. Concatenate category and city — student fees
select 
  st_name,
  st_dept|| '/' || st_city as Concatenate_category
from student_fees

-- Q295. Average score rounded — student fees
select 
  st_dept,
  round(avg(marks),1) as rounded
from student_fees
group by st_dept

-- Q296. CTE filtering category totals — student fee
with cte_filter as(
    select
      st_dept,
      sum(amount) as total
    from student_fees
    group by st_dept
)
select st_dept,total from cte_filter

-- Q297. CTE for high scores — student fees
with high_score as (
    select
      st_name ,
      marks 
    from student_fees
    where marks > 85
)
select * from high_score

-- Q298. CTE for highest per city — student fees
with  ranked as (
    select 
      st_name,
      st_city,
      amount,
      row_number() over(partition by st_city order by amount desc) as rn
    from student_fees
)
select * from ranked where rn = 1

-- Q299. UNION active and pending cities — student fees
select 
  st_city
from student_fees 
where status = 'ACTIVE'
UNION
select 
  st_city
from student_fees
where status = 'PENDING'

-- Q300. INTERSECT cities across categories — student fees
select 
  st_city
from student_fees 
where status = 'ACTIVE'
INTERSECT
select 
  st_city
from student_fees
where status = 'PENDING'
