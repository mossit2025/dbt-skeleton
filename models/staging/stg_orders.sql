{{ 
  config(
    pre_hook="USE ROLE {{ env_var('DBT_ENV_SNOWFLAKE_ROLE') }}"
  )
}}


select
    {{ dbt_utils.generate_surrogate_key(['id']) }} as primary_key,
    id as order_id,
    user_id as customer_id,
    order_date,
    status,
    _etl_loaded_at as update_timestamp
from {{ source('raw_jaffle_shop', 'orders') }}