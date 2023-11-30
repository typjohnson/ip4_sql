use `premier_products`;
show tables;
-- 1. print all rows and columns from dataset -- 
select * from customer;
select * from order_line;
select * from orders;
select * from part;
select * from sales_rep;

-- 2. select last name, first name, sales rep number, city from table -- 
select last_name, first_name, sales_rep_num, city from sales_rep;

-- 3. select order and customer number from orders --
select order_num, customer_num from orders;

-- 4. select only two lines from order line --
select * from order_line limit 2;

-- 5. select all from customr where sales rep number is 20 --
select * from customer 
where sales_rep_num = 20;

-- 6. select only customer name, balance, credit limit for sales rep 20 -- 
select customer_name, balance, credit_limit from customer
where sales_rep_num = 20;

-- 7a. select part num, num orderd, quoted price, total price for 21617
select * from order_line;
select part_num, num_ordered, quoted_price, quoted_price * num_ordered as "total price" from order_line 
where order_num = 21617;
-- 7b. doing the same but for num ordered = 1 --
select * from order_line;
select part_num, num_ordered, quoted_price, quoted_price * num_ordered as "total price" from order_line 
where order_num = 21617 and num_ordered = 1;

-- 8. show all orderd between 2010-10-20 and 2010-10-22 --
select * from orders 
where order_date between '2010-10-20' AND '2010-10-22';

-- 9. show all from part that starts with D and ends with er --
select * from part 
where part_description like "D%er";

-- 10. show total balance from customer --
select * from customer;
select sum(balance) from customer;

-- 11. show minimum balance from customer -- 
select min(balance) from customer;

select customer_name, balance from customer
where balance = (select min(balance) from customer);

-- 12. select count of customers from customer column --
select count(*) as num_of_customers from customer;

-- 13. select order number where quoted price is over 500 and less than 1000 -- 
select order_num from order_line 
where quoted_price > 500 and quoted_price < 1000;

-- 14. create new table with customer name, sales rep information --
create table new_table as
select c.customer_name, s.first_name, s.last_name
from customer c 
join sales_rep s on s.sales_rep_num = c.sales_rep_num; 
-- couldn't create new table so testing --
select c.customer_name, s.first_name, s.last_name
from customer c 
join sales_rep s on s.sales_rep_num = c.sales_rep_num; 