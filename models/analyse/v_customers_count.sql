{{ 
  config(
    pre_hook="USE ROLE {{ env_var('DBT_ENV_SNOWFLAKE_ROLE') }}"
  )
}}



select
    last_name,
    count(1) as quantity
from {{ ref('stg_customers') }}
group by
    last_name