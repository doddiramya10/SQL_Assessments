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
    holder_name,
    replace(holder_name,'a','*') as mask_name
from bank_accounts

-- Q110. CASE Band Classification retail_orders
select
    holder_name,
    balance,
    case
       when balance >= 8000 then 'High'
       when balance >= 5000 then 'Medium'
       else 'Low'
    end 
    as category
from bank_accounts
order by acc_id


 

