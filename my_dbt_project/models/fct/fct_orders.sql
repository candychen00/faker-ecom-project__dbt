{#
    config(
        materialized='incremental',
        incremental_strategy= 'merge',
        unique_key= 'order_id',
    )
#}

with src_orders as (
    select * from {{ ref('src_orders') }}
)

select
    ord.*,
    prod.product_price * ord.order_quantity as order_amount,

    prod.product_name,
    prod.product_category,
    prod.product_price,
    prod.fruit_name,

    cust.first_name,
    cust.last_name,
    cust.customer_state,
    cust.customer_signup_date


from src_orders ord
inner join {{ ref('dim_products') }} prod on ord.product_id = prod.product_id
inner join {{ ref('dim_customers') }} cust on ord.customer_id = cust.customer_id


{% if is_incremental() %}

    WHERE order_created_at >= ( select max(order_created_at) from {{this}} )

{% endif %}