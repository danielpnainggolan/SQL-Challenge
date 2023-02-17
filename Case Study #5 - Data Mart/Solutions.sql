#data cleaning

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
