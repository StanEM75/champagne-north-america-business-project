-- Create a macro that should take a date column as an argument
{% macro correct_date_format(col) -%}

-- Test all the date formats possible for this column
  COALESCE(
    TRY_TO_DATE(TO_VARCHAR({{ col }}), 'YYYY-MM-DD'),
    TRY_TO_DATE(TO_VARCHAR({{ col }}), 'DD-MM-YYYY'),
    TRY_TO_DATE(TO_VARCHAR({{ col }}), 'DD/MM/YYYY'),
    TRY_TO_DATE(TO_VARCHAR({{ col }}), 'YYYY/MM/DD')
  )

{%- endmacro %}
