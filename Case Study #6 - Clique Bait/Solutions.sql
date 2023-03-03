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
