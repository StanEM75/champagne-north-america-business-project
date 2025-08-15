-- Import the external_events table from Snowflake and replace null values as well as modify the types

-- Start by filling existing null values and replace them by the expression 'Unknown value'
WITH external_events_with_null_values_filled AS 
(
SELECT  
    -- A date column can't be modified with the macro input_unknown_value_for_null
    date, 
    -- A float column can't be modified with the macro input_unknown_value_for_null so a manual processing can be done
    COALESCE(impact_score, 0) AS impact_score,
    -- Call the macro input_unknown_value_for_null that replaces null values by 'Unknown value' on all the columns
    {{ input_unknown_value_for_null([
        'country',
        'region',
        'event_name',
        'event_type',
        'source'
    ]) }}
FROM 
    {{ source('raw', 'external_events') }}
)

SELECT 
    CAST(date AS Date) AS date,
    CAST(country AS String) AS country,
    CAST(region AS String) AS region 
FROM 
    external_events_with_null_values_filled