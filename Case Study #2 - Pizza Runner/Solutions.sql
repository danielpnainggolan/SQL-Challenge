#number 1
select count(co.order_id) total_order
from customer_orders co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time != 'null';



#number 2
select count(distinct customer_id)
from customer_orders;



#number 3
select runner_id,count(runner_id) succesfull_order
from runner_orders
where pickup_time != 'null'
group by runner_id;



#number 4
select pn.pizza_name, count(co.order_id) total
from customer_orders co
left join runner_orders ro
on co.order_id = ro.order_id
join pizza_names pn
on co.pizza_id = pn.pizza_id
where ro.pickup_time != 'null'
group by pn.pizza_name; 



#number 5
select co.customer_id, 
	sum(case when co.pizza_id = 1 then 1
		else 0 end) Meatlovers,
	sum(case when co.pizza_id = 2 then 1
		else 0 end) Vegetarian
from customer_orders co
join pizza_names pn
on co.pizza_id = pn.pizza_id
group by co.customer_id;



#number 6
select co.order_id, count(pn.pizza_id) total
from customer_orders co
left join runner_orders ro
on co.order_id = ro.order_id
join pizza_names pn
on co.pizza_id = pn.pizza_id
where ro.pickup_time != 'null'
group by co.order_id
order by total desc
limit 1;


#create new table
insert into customer_orderss (select order_id,customer_id,pizza_id, 
	case
		when exclusions is null or exclusions = 'null'
			then ''
		else 
			exclusions 
		end exclusions,
        
	case
		when extras is null or extras = 'null'
			then ''
		else 
			extras 
		end extras,
order_time
from customer_orders);


select * from customer_orderss;



#number 7
select co.customer_id,
	Sum(case
			when co.exclusions != '' or co.extras != ''
				then 1
			else 0 end) at_least_1_change,
	sum(case 
			when co.exclusions = '' and co.extras = ''
				then 1
			else 0 end) no_change
from customer_orderss co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time != 'null'
group by co.customer_id
order by co.customer_id;



#number 8
select sum(case 
			when co.exclusions != '' and co.extras != ''
				then 1
			else 0 end) total
from customer_orderss co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time != 'null';



#number 9
select day(order_time) days, hour(order_time) hours ,count(pizza_id) total
from customer_orderss
group by day(order_time), hour(order_time);



#number 10
select case
			when day(order_time) between 01 and 07
				then 'Week 1'
			else 'Week 2'
            end weeks,
		day(order_time) days, count(order_id) total
from customer_orderss
group by weeks,day(order_time);






# B.Runner and Customer Experience
#number 1
select * from runners;
select case
				when registration_date between '2021-01-01' and '2021-01-07'
					then "week 1"
				when registration_date between '2021-01-08' and '2021-01-014'
					then "week 2"
				else "week 3"
			end weeks,
		count(runner_id) total
from runners
group by weeks;



#number 2
select * from customer_orderss;
use data_daniel;
select * from runner_orders;

select ro.runner_id,avg(minute(timediff(co.order_time ,ro.pickup_time))) averages
from customer_orderss co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time !='null'
group by ro.runner_id;



#number 3
select count(co.pizza_id),avg(minute(timediff(co.order_time ,ro.pickup_time))) averages
from customer_orderss co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time !='null'
group by co.order_id;



#number 4
select co.customer_id, avg(ro.distance) average
from customer_orderss co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time !='null'
group by co.customer_id;



#number 5
select max(duration) max,min(duration) min, max(duration) - min(duration) as different
from runner_orders
where duration !='null';



#number 6
select co.order_id, ro.runner_id , avg(ro.distance/ro.duration) as speed
from customer_orderss co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time !='null'
group by co.order_id, ro.runner_id;



#number 7
select runner_id, round(count(order_id)/(select count(order_id) from runner_orders)*100,0) percentage
from runner_orders
where duration !='null'
group by runner_id;




#C.Ingredient Optimisation
#number 1



#number 2
select * from customer_order_new;
select cs.extras, pt.topping_name, count(cs.order_id) total
from customer_order_new cs
join pizza_toppings pt
on cs.extras = pt.topping_id
group by cs.extras;



#number 3
select cs.exclusions, pt.topping_name, count(cs.order_id) total
from customer_order_new cs
join pizza_toppings pt
on cs.exclusions = pt.topping_id
group by cs.exclusions;



#number 4
use data_daniel;
select * from customer_order_new;

select customer_id, pizza_id, exclusions, extras,
case
	when pizza_id = 1 and exclusions != 3
		then 'meat_lovers_exclude_beef'
        
	when pizza_id = 1 and exclusions = 1
		then 'meat_lovers_extra_bacon'
	when pizza_id = 1 and exclusions not in (1,4) or extras in  (6,9)
		then 'meat_lovers_special_case'
	when pizza_id = 1
		then 'meat_lovers'
	else 'others'
    end as remarks
from customer_order_new ;



#number 5



#number 6
select pz.topping_id, pz.topping_name, count(nw.order_id) total
from pizza_toppings pz
left join (
select co.order_id, co.exclusions, co.extras
from customer_order_new co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time !='null') nw
on pz.topping_id = nw.exclusions or pz.topping_id = nw.extras
group by pz.topping_id
order by total desc;




#D.Pricing and Ratings
#number 1
select ro.runner_id,
sum(case
	when co.pizza_id = 1
		then 12
	else
		10
	end)price
from customer_order_new co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time is not null
group by ro.runner_id;



#number 2
select ro.runner_id,
sum(case
	when co.pizza_id = 1 or co.extras = 4
		then 14
	else
		11
	end)price
from customer_order_new co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time !='null'
group by ro.runner_id;



#number 3
DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (
  rating_id INTEGER,
  descriptions TEXT,
  rating TEXT
  
);
INSERT INTO ratings
  (rating_id, descriptions,rating)
VALUES
  (1, '> 40 minutes','*'),
  (2, 'Between 30 and 40 minutes','**'),
  (3, 'Between 20 and 30 minutes','***'),
  (4, 'Between 10 and 20 minutes','****'),
  (5, '> 10 minutes','*****');

  
select * from runner_orders;



#number 4
with namee as (
select co.customer_id,co.order_id, ro.runner_id, 
case 
	when abs(timestampdiff(minute,co.order_time, ro.pickup_time)) <=10 
		then  1
	when abs(timestampdiff(minute,co.order_time, ro.pickup_time)) between 10 and 20  
		then  2
	when abs(timestampdiff(minute,co.order_time, ro.pickup_time)) between 20 and 30  
		then  3
	when abs(timestampdiff(minute,co.order_time, ro.pickup_time)) between 30 and 40  
		then  4
	else  5
	end rating_id,
    
co.order_time,ro.pickup_time,abs(timestampdiff(minute,co.order_time, ro.pickup_time)) between_order_pickup,  ro.duration , avg(ro.distance/ro.duration) over() speed ,sum(co.pizza_id) over() number_of_pizzas
from customer_order_new co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time is not null)

select customer_id,order_id,runner_id,r.rating, order_time,pickup_time,between_order_pickup,duration,speed,number_of_pizzas
from namee n
join ratings r
on n.rating_id = r.rating_id;

	
  
#number 5
select ro.runner_id,
sum(case
	when co.pizza_id = 1
		then 12+ro.distance*0.3
	else
		10+ro.distance*0.3
	end)price
from customer_order_new co
left join runner_orders ro
on co.order_id = ro.order_id
where ro.pickup_time is not null
group by ro.runner_id; 
