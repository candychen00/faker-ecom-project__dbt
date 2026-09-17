
WITH src_products AS (

    select * from {{ ref('src_products') }}

)

SELECT
    product_id,
    product_name,
    product_price,
    product_category,
    SPLIT( product_name, ' ')[OFFSET(0)] AS fruit_name,

FROM src_products
ORDER BY product_id