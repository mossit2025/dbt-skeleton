{{ 
  config(
    pre_hook="USE ROLE {{ env_var('DBT_ENV_SNOWFLAKE_ROLE') }}"
  )
}}



select
    {{ dbt_utils.generate_surrogate_key(['id']) }} as primary_key,
    id as customer_id,
    first_name,
    last_name
from {{ source('raw_jaffle_shop', 'customers') }}