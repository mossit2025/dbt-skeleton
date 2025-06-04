{{ 
  config(
    pre_hook="USE ROLE {{ env_var('DBT_ENV_SNOWFLAKE_ROLE') }}"
  )
}}



select
    first_name,
    last_name
from {{ ref('stg_customers') }}