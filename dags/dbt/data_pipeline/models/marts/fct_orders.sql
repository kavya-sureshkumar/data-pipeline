select
    orders.order_key,
    orders.customer_key,
    orders.order_status,
    orders.total_price,
    orders.order_date,
    order_items_summary.total_extended_price,
    order_items_summary.total_discounted_price
from {{ ref('stg_tpch_orders') }} as orders
join {{ ref('int_order_items_summary') }} as order_items_summary
    on orders.order_key = order_items_summary.order_key
order by orders.order_date
