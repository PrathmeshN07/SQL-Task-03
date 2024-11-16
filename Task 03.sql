1)select * from employee where department = 'IT' and salary > 50000;

2) SELECT orderid,customer_name,contact_number from orders o join customers c
on o.customerid = c.customerid

3)select productid,count(quantitysold) as total_quantity_sold from sales group by productid
order by productid

4)select extract(month from s.saledate ) as month,
avg(s.quantitysold) as avg_total_quantity_sold from sales s
group by extract(month from s.saledate ) order by month

5)select upper(productname) from products

6)select * from events where eventdate between 
current_date and current_date + interval '30 days'

7)select * from employee where salary >(select avg(salary) from employee )

8)create table upd_prod(productid serial primary key,productname varchar,old_category varchar,new_category varchar);

create or replace function upd_products()
returns trigger as $$
begin 
insert into upd_prod (productid,productname,old_category,new_category)
values (old.productid,old.productname,old.category,new.category);
return new;
end
$$ language plpgsql;

create trigger upd_category
after update on products
for each row
execute function upd_products();

update products  set category = 'Furniture' where productid = 1;


9)create view  Active_customers as (select c.customerid,customername,orderid,orderdate from
customer c inner join orders o on c.customerid = o.customerid
where extract (year from orderdate)=2024);

10)select count(totalamount) from orders where totalamount = null

11)select *,rank()over(order by score desc) from participants

12)select employeeid,salary,department,sum(salary) 
over (partition by department order by department) 
from employee group by department,employeeid

13)select saleid,productid,saledate,sum(quantitysold) 
over(partition by productid order by productid) as running_quantity
from sales

14)update products set price = price*10/100 where category = 'Electronics'


15)select * from customers where city='Delhi'

