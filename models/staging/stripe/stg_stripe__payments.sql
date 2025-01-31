
with 
source as (
    select * from {{ ref("payments") }}
),
transformed as (
    select 
        id as payment_id,
        orderid as order_id,
        status as payment_status,
        created as payment_created_at,
        round(amount/100.0,2) as payment_amount
    from source
    where status <> 'fail'
)
select * from transformed