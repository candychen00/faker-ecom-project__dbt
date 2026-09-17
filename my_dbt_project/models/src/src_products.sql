
with raw_products as (
    select * from {{ source('faker', 'products') }}
)

select 
    product_id,
    product_name,
    price as product_price,
    category as product_category

from raw_products