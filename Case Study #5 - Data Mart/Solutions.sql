#1. Data Cleansing Steps

insert into clean_weekly_sales(
select date(ft.tanggal) week_date,case
when day(ft.tanggal) between 1 and 7 then '1'
when day(ft.tanggal) between 8 and 14 then '2'
when day(ft.tanggal) between 15 and 21 then '3'
when day(ft.tanggal) between 22 and 28 then '4'
else '5' end week_number, month(ft.tanggal) month_number, year(ft.tanggal) calender_year,
ft.region,ft.platform,ft.segment,
case 
when ft.segment like "%1%" then 'Young Adults'
when ft.segment like "%2%" then 'Middle Aged'
when ft.segment like "%3%" then 'Retirees'
when ft.segment like "%4%" then 'Retirees'
else 'unknow'
end age_band,
case 
when ft.segment like "%C%" then 'Couples'
when ft.segment like "%F%" then 'Families'
else 'unknow'
end demographic,
ft.customer_type,ft.transactions,
ft.sales, round((ft.transactions/ft.sales),2) avg_transaction from( 
select *,concat(concat("20",right(format_waktu,2)),"-",substring(format_waktu,4,2),"-",left(format_waktu,2)) tanggal
from(
select *,date_format(week_date,"%y-%m-%d") format_waktu
from weekly_sales) ws) ft)


#2. Data Exploration

#number 3
select calender_year year,count(transactions) amount from clean_weekly_sales
group by 1
order by 1 asc;


#number 4
select month_number, region, sum(sales) amount
from clean_weekly_sales
group by 1,2
order by 1 asc;


#number 5
select platform, sum(transactions) amount
from clean_weekly_sales
group by 1;


#number 6
select platform, round(100*(sum(sales)/(select sum(sales) from clean_weekly_sales)),2) percentage
from clean_weekly_sales
group by 1;


#number 7
select calender_year,demographic, round(100*(sum(sales)/(select sum(sales) from clean_weekly_sales)),2) percentage
from clean_weekly_sales
group by 1,2
order by 1 asc;


#number 8
select age_band,demographic ,sum(sales) amount
from clean_weekly_sales
where platform ='Retail'
group by 1,2
order by 3 desc
limit 1;


#number 9
select calender_year, platform, round(avg(transactions),2) amount
from clean_weekly_sales
group by 1,2;
