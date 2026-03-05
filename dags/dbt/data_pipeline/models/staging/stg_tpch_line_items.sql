select
    {{ dbt_utils.generate_surrogate_key(['l_orderkey', 'l_linenumber']) }} as order_item_key,
    l_orderkey as order_key,
    l_partkey as part_key,
    l_suppkey as supp_key,
    l_linenumber as line_number,
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_discount as discount,
    l_tax as tax,
    l_returnflag as return_flag,
    l_linestatus as line_status
from {{ source('tpch', 'lineitem') }}
