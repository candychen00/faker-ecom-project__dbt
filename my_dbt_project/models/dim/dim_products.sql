
WITH src_products AS (

    select * from {{ ref('src_products') }}

)

SELECT
    product_id,
    product_name,
    product_price,
    product_category,
    product_fruit

FROM src_products
ORDER BY product_id