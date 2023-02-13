select date(tanggal) tanggal_fix,ft.* from( 
select *,concat(concat("20",right(format_waktu,2)),"-",substring(format_waktu,4,2),"-",left(format_waktu,2)) tanggal
from(
select *,date_format(week_date,"%y-%m-%d") format_waktu
from weekly_sales) ws) ft
