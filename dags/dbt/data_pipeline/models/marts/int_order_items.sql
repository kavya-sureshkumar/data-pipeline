select
    line_items.order_item_key,
    line_items.part_key,
    line_items.line_number,
    line_items.extended_price,
    line_items.discount,
    orders.customer_key,
    orders.order_key,
    orders.order_date,
    {{ discounted_price('line_items.extended_price', 'line_items.discount') }} as item_discounted_price
from {{ ref('stg_tpch_line_items') }} as line_items
join {{ ref('stg_tpch_orders') }} as orders
    on orders.order_key = line_items.order_key
order by orders.order_date
