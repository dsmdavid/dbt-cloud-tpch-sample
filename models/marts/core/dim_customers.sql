{{
    config(
        materialized = 'table'
    )
}}
with customer as (

    select * from {{ref('stg_tpch_customers')}}

),

nation as (
    select * from {{ ref('stg_tpch_nations') }}
),

region as (
    select * from {{ ref('stg_tpch_regions') }}
),

final as (
    select    
        c.customer_key,
        c.name,
        c.address, 
        c.nation_key,
        c.phone_number,
        c.account_balance,
        c.market_segment,
        c.comment,
        n.name as nation_name,
        r.name as region 
    from
        customer as c 
    left join nation as n 
        on c.nation_key = n.nation_key
    left join region as r 
        on n.region_key as r.region_key
)
select *
from final  
order by customer_key
