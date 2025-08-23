-- Import the external_events table from Snowflake and replace null values as well as modify the types

-- Start by filling existing null values and replace them by the expression 'Unknown value'
WITH external_events_with_null_values_filled AS 
(
    SELECT  
            -- A date column can't be modified with the macro input_unknown_value_for_null
            date, 
            -- A float column can't be modified with the macro input_unknown_value_for_null so a manual processing can be done
            COALESCE(impact_score, 0) AS impact_score,
            -- Call the macro input_unknown_value_for_null that replaces null values by 'Unknown value' on all the string columns
            {{ input_unknown_value_for_null([
                'country',
                'region',
                'event_name',
                'event_type',
                'source'
            ]) }}
    FROM 
            {{ source('raw', 'external_events') }}
),

-- Remove duplicates from the table
external_events_with_null_values_filled_and_no_duplicates AS 
(
    SELECT 
            DISTINCT *
    FROM 
            external_events_with_null_values_filled
)

SELECT 
        ----- Date --------
        CAST(date AS Date) AS date,
        ----- Geographical details --------
        CAST(country AS VARCHAR) AS country,
        CAST(region AS VARCHAR) AS region,
        ----- Events details --------
        CAST(event_type AS VARCHAR) AS event_type,
        CAST(event_name AS VARCHAR) AS event_name,
        ----- KPI --------
        CAST(impact_score AS float) AS impact_score,
        CAST(source AS VARCHAR) AS source
FROM 
        external_events_with_null_values_filled_and_no_duplicates