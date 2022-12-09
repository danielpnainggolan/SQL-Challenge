#B. Data Analysis Questions
#number 1
select count(distinct customer_id) total from subscriptions;


#number 2
select month(start_date) month, year(start_date) year , count(plan_id) total 
from subscriptions
where plan_id = '0'
group by month(start_date), year(start_date)
order by year(start_date),month(start_date);


#number 3
select p.plan_name, count(*) total
from subscriptions s
inner join plans p
on s.plan_id = p.plan_id
where year(s.start_date) > 2020
group by 1;


#number 4
select p.plan_name, count(distinct s.customer_id) total, round(100* count(distinct s.customer_id) / (select count(distinct customer_id) from subscriptions),1) percentage 
from subscriptions s
left join plans p
on s.plan_id = p.plan_id
where p.plan_name = 'churn';


#number 5
with multiple as (
select *, count(*) over(partition by customer_id) gg from subscriptions
where plan_id in (0,4)
order by 1 asc)

select count(distinct customer_id) total_customers, 
round(100* count(distinct customer_id) / (select count(distinct customer_id) from subscriptions),1) percentage
from multiple
where gg = 2;


#number 6
select count(distinct s.customer_id) total_customers,
round(100* count(distinct s.customer_id) / (select count(distinct customer_id) from subscriptions),1) percentage
from subscriptions s
inner join (select customer_id from subscriptions
where plan_id !=0) ss
on s.customer_id = ss.customer_id
where s.plan_id = 0;


#number 7
select p.plan_name, count(s.customer_id),
round(100 * count(s.customer_id)/(select count(distinct customer_id) from subscriptions),1) percentage
from subscriptions s
join plans p
on s.plan_id = s.plan_id
where s.start_date = '2020-12-31'
group by 1;


#number 8
select count( distinct s2.customer_id) total
from subscriptions s1
right join (select distinct customer_id from subscriptions
	  where plan_id = 3 and year(start_date) = 2020) s2
on s1.customer_id = s2.customer_id
where plan_id in (0,1,2) and year(start_date) = 2020;


#number 9
with rang as (
select *,row_number() over (partition by customer_id order by start_date) ranking, 
lag(start_date,1) over(partition by customer_id) dated
from subscriptions s1
where customer_id in (select distinct customer_id from subscriptions
						 where plan_id = 3) 
order by 1 asc),

rung as(
select *, datediff(start_date,dated) diff
from rang)

select customer_id, round(avg(diff),1) average
from rung
group by 1;


#number 10
with rang as (
select *,row_number() over (partition by customer_id order by start_date) ranking, 
lag(start_date,1) over(partition by customer_id) dated
from subscriptions s1
where customer_id in (select distinct customer_id from subscriptions
						 where plan_id = 3) 
order by 1 asc),

rung as(
select *, datediff(start_date,dated) diff
from rang),

ring as(
select customer_id, round(avg(diff),1) average
from rung
group by 1)

select 
case when average between 0 and 30
	then customer_id

    end'average 0-30',
case when average between 31 and 60
	then customer_id
    
    end 'average 31-60',
case when average between 61 and 90
	then customer_id
    
    end 'average 61-90',
case when average between 91 and 120
	then customer_id
    
    end 'average 91-120',
case when average between 121 and 150
	then customer_id
    
    end 'average 121-150',   
case when average between 151 and 180
	then customer_id
    
    end 'average 151-180',
case when average between 181 and 210
	then customer_id
    
    end 'average 181-210'
from ring;


#number 11
with amount as (
select s.customer_id 'c_plan_id_2', s.start_date 'd_plan_id_2', s2.customer_id 'c_plan_id_1' ,
s2.start_date 'd_plan_id_1', s.start_date-s2.start_date difff
from subscriptions s
 join (select * from subscriptions
where plan_id = 1
and year(start_date) = 2020) s2
on s.customer_id = s2.customer_id
and s.plan_id = 2
and year(s.start_date) = 2020
having difff >= 1)

select count(*) total
from amount;
