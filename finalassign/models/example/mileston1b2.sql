{{ config(materialized='table') }}

select nav_date ,d.code as code ,d.minimum from "ANALYTICS"."DBT"."NAVHIST3" c join (select a.code as code ,min(b.nav) as minimum from "ANALYTICS"."DBT"."MUTUALFUND"
                                                                                    a join "ANALYTICS"."DBT"."NAVHIST3" b on a.code=b.code group by a.code ) d
                                                                                    where c.code =d.code and c.nav =d.minimum
