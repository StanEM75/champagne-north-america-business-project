-- Create a macro that should take a table's columns as an argument
{% macro input_unknown_value_for_null(columns) %}

-- Iterate over all the columns of the table and replace null values by the expression 'Unknown value'
    {% for col in columns %}
        COALESCE({{ col }}, 'Unknown value') AS {{ col }}
        {%- if not loop.last %}, {% endif %}
    {% endfor %}
{% endmacro %}
