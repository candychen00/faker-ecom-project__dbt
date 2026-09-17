with raw_customers as (
    select * from {{ source( 'faker', 'customers' ) }}
)

select 
    customer_id,
    name as full_name,
    email as customer_email,
    state as customer_state,
    signup_date as customer_signup_date

from raw_customers