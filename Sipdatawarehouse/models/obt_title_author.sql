with
    f_title as (select * from {{ ref("fact_title_author") }}),
    d_authors as (select * from {{ ref("dim_authors") }}),
    d_date as (select * from {{ ref("dim_date") }})

select
    d_authors.*, d_date.*, f.totalsalesrevenue, f.effectiveroyaltyearned, f.netearnings
from f_title as f
left join d_authors on f.authorkey = d_authors.authorkey
left join d_date on f.pubdatekey = d_date.datekey
