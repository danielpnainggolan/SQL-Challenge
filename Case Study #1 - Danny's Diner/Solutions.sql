#number 1
select sales.customer_id, sum(menu.price)
from sales
join menu
on sales.product_id =  menu.product_id
group by sales.customer_id;



#number 2
select customer_id, count(distinct order_date) days
from sales 
group by customer_id;



#number 3
select sales.customer_id,min(sales.order_date),menu.product_name
from sales
join menu
on sales.product_id = menu.product_id
group by sales.customer_id;



#number 4
select menu.product_name, count(sales.product_id)  as total from sales
join menu
on sales.product_id = menu.product_id
group by sales.product_id
order by total desc
limit 1;



#number 5
with popular_item as(
select sales.customer_id, menu.product_name, count(sales.product_id) as total, dense_rank() over (partition by sales.customer_id order by count(sales.product_id) desc) ranking
from sales
join menu
on sales.product_id = menu.product_id
group by sales.customer_id,sales.product_id)

select customer_id,product_name,total
from popular_item
where ranking = 1
group by customer_id;



#number 6
with first_purchased as(
select sales.customer_id, sales.order_date, menu.product_name, dense_rank() over(partition by sales.customer_id order by sales.order_date asc) rangking
from sales
join menu
on sales.product_id = menu.product_id
join members
on sales.customer_id = members.customer_id
where sales.order_date > members.join_date)

select customer_id, order_date, product_name
from first_purchased
where rangking = 1
group by customer_id;



#number 7
with first_purchased as(
select sales.customer_id, sales.order_date, menu.product_name, dense_rank() over(partition by sales.customer_id order by sales.order_date desc) rangking
from sales
join menu
on sales.product_id = menu.product_id
join members
on sales.customer_id = members.customer_id
where sales.order_date < members.join_date)

select customer_id, order_date, product_name
from first_purchased
where rangking = 1
group by customer_id;



#number 8
select sales.customer_id, sales.order_date, menu.product_name, count(sales.product_id) 'total item', sum(menu.price)
from sales
join menu
on sales.product_id = menu.product_id
join members
on sales.customer_id = members.customer_id
where sales.order_date < members.join_date
group by sales.customer_id;



#number 9
select sales.customer_id, sales.product_id, menu.price,count(sales.product_id) total,
case
	when sales.product_id = 1 then menu.price*20
    else menu.price* 10
end as points
from sales
join menu
on sales.product_id = menu.product_id
group by sales.customer_id, sales.product_id;



#number 10
with jumlah as (
select sales.customer_id, sales.product_id, menu.price, sales.order_date,
case
	when menu.product_id = 1 and sales.order_date between '2021-01-07' and '2021-01-14' and sales.customer_id = 'A'
			then menu.price*40
	when menu.product_id = 2 and sales.order_date between '2021-01-07' and '2021-01-14' and sales.customer_id = 'A'
			then menu.price*20
	when menu.product_id = 3 and sales.order_date between '2021-01-07' and '2021-01-14' and sales.customer_id = 'A'
			then menu.price*20
	when menu.product_id = 1 and sales.order_date between '2021-01-09' and '2021-01-16' and sales.customer_id = 'B'
			then menu.price*40
	when menu.product_id = 2 and sales.order_date between '2021-01-09' and '2021-01-16' and sales.customer_id = 'B'
			then menu.price*20
	when menu.product_id = 3 and sales.order_date between '2021-01-09' and '2021-01-16' and sales.customer_id = 'B'
			then menu.price*20
	when menu.product_id = 1
			then menu.price*20
    else menu.price*10
end as points
from sales
join menu
on sales.product_id = menu.product_id
join members
on sales.customer_id = members.customer_id
where sales.order_date <= '2021-01-31'
order by sales.customer_id,sales.order_date asc)

select customer_id, sum(points) from jumlah
group by customer_id;



#bonus 1
select sales.customer_id,sales.order_date,menu.product_name,menu.price, if(sales.order_date >= members.join_date,'Y','N') 'member'
from sales
join menu
on sales.product_id = menu.product_id
left join members
on sales.customer_id = members.customer_id;



#bonus 2
with mark as(
select sales.customer_id,sales.order_date,menu.product_name,menu.price, if(sales.order_date >= members.join_date,'Y','N') 'member'
from sales
join menu
on sales.product_id = menu.product_id
left join members
on sales.customer_id = members.customer_id)

select *, 
case
	when member ='Y' then
		rank() over(partition by customer_id,member order by order_date)
	else 'Null'
end as ranking
from mark;
