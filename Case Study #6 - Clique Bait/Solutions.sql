#Digital Analysis

#number 1
SELECT count(distinct user_id) FROM clique_bait.users ;


#number 2
select round(avg(a.amount),2) average from(SELECT user_id, count(cookie_id) amount FROM clique_bait.users
group by 1) a;


#number 3
select date_part('MONTH',event_time) months, count(distinct visit_id) amount
from clique_bait.events
group by 1;


#number 4
select ei.event_name,count (distinct e.sequence_number) amount
from clique_bait.events e
join clique_bait.event_identifier ei
on e.event_type = ei.event_type
group by 1;


#number 5
with dar as (select ei.event_name,count (distinct e.sequence_number) amount
from clique_bait.events e
join clique_bait.event_identifier ei
on e.event_type = ei.event_type
group by 1)

select event_name,round(100*(amount/(select sum(amount) from dar)),2) average
from dar
where event_name = 'Purchase';

                          
#number 6
with nil as (
select count(distinct visit_id) total_no_purchase,(select count(distinct visit_id) from clique_bait.events) total_visit from(SELECT * FROM clique_bait.events 
where event_type = 2 and visit_id not in (
select visit_id from clique_bait.events where event_type =3)) a)

select round(100*(total_no_purchase/total_visit),2) average
from nil;


#number 7
select  ph.page_name ,count(*)
from clique_bait.events e
join clique_bait.page_hierarchy ph on e.page_id = ph.page_id
where event_type = 1
group by 1
order by 2 desc
limit 3;


#number 8
select a.product_category,a.event_name, count(a.*) from(
select e.visit_id, e.page_id, ph.product_category,ei.event_name
from clique_bait.page_hierarchy ph
join clique_bait.events e on e.page_id = ph.page_id
join clique_bait.event_identifier ei on e.event_type = ei.event_type where ph.product_category is not null)a
group by 1,2
order by 1 asc;


#number 9
select b.product_id, count(b.*) amount from (select e.visit_id, e.page_id, a.product_id
from clique_bait.events e
join (select page_id, product_id
from clique_bait.page_hierarchy
where product_id is not null) a
on e.page_id = a.page_id) b
group by 1
order by 2 desc;
