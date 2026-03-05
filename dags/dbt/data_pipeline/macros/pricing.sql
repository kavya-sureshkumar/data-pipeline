{% macro discounted_price(extended_price, discount_percentage, scale=2) %}
    ({{ extended_price }} * (1 - {{ discount_percentage }}))::decimal(16, {{ scale }})
{% endmacro %}