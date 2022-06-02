{{ config(materialized='table') }}


select nav_date ,d.code as code ,d.maximum from "ANALYTICS"."DBT"."NAVHIST3" c join (select a.code as code ,max(b.nav) as maximum from "ANALYTICS"."DBT"."MUTUALFUND"
                                                                                    a join "ANALYTICS"."DBT"."NAVHIST3" b on a.code=b.code group by a.code ) d
                                                                                    where c.code =c.code and c.nav =d.maximum
