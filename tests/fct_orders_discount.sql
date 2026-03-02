select
    *
from {{ ref('fct_orders') }}
where total_discounted_price < 0