select 
{{
    dbt_utils.generate_surrogate_key(['L_ORDERKEY','L_LINENUMBER']) 

}} as order_item_key,
L_ORDERKEY as order_key,
	L_PARTKEY as part_key,
	L_SUPPKEY as supp_key,
	L_LINENUMBER as line_number,
	L_QUANTITY as quantity,
	L_EXTENDEDPRICE as extended_price,
	L_DISCOUNT as discount,
	L_TAX as tax,
	L_RETURNFLAG as return_flag,
	L_LINESTATUS as line_status
from 

{{ source('tpch', 'lineitem') }}