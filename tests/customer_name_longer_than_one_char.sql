{% test customer_name_longer_than_one_char() %}
select
    c.name
from {{ ref('dim_customers') }} as c 
where length(c.name) < 1
{% endtest %}