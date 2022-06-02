{{ config(materialized='table') }}

select EXTRACT(MONTH FROM nav_date)  as nav_month,code,avg(nav) as nav_average,
avg(repurchase_price) as prepurchase_average,avg(sale_price) as sale_average
from "ANALYTICS"."DBT"."NAVHIST3" group by code,nav_month
