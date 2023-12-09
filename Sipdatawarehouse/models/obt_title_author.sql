with
    f_title_author as (select * from {{ ref("fact_title_author") }}),
    d_authors as (select * from {{ ref("dim_authors") }}),
    d_date as (select * from {{ ref("dim_date") }}),
    d_publishers as (select * from {{ ref("dim_publishers") }})

select f.*, d_authors.*, d_date.*, d_publishers.*
from f_title_author as f
left join d_authors on f.authorkey = d_authors.authorkey
left join d_publishers on f.publisherskey = d_publishers.publisherskey
left join d_date on f.pubdatekey = d_date.datekey
