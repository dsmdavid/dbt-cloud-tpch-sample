{{
    config(
        materialized = 'table'
    )
}}
with customer as (

    select * from {{ref('stg_tpch_customers')}}

),

final as (
    select    
        customer_key,
        name,
        address, 
        nation_key,
        phone_number,
        account_balance,
        market_segment,
        comment
    from
        customer
)
select *
from final  
order by customer_key
