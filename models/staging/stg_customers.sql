{{ 
  config(
    pre_hook="USE ROLE {{ env_var('DBT_ENV_SNOWFLAKE_ROLE') }}"
  )
}}



select
    id as customer_id,
    first_name,
    last_name
from {{ source('raw_jaffle_shop', 'customers') }}