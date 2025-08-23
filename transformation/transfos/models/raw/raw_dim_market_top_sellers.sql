-- Import the market_top_sellers table from Snowflake and replace null values as well as modify the types

-- Start by filling existing null values and replace them by the expression 'Unknown value'
WITH market_top_sellers_with_null_values_filled AS 
(
    SELECT  
            -- A date column can't be modified with the macro input_unknown_value_for_null
            period, 
            -- Call the macro input_unknown_value_for_null that replaces null values by 'Unknown value' on all the string columns
            {{ input_unknown_value_for_null([
                'region',
                'category',
                'top_brand'
            ]) }}, 
            -- A float column can't be modified with the macro input_unknown_value_for_null so a manual processing can be done
            COALESCE(est_units, 0) AS est_units
    FROM 
            {{ source('raw', 'market_top_sellers') }}
),

-- Remove duplicates from the table
market_top_sellers_with_null_values_filled_and_no_duplicates AS 
(
    SELECT 
            DISTINCT *
    FROM 
            market_top_sellers_with_null_values_filled
)

SELECT 
        ----- Date --------
        period,
        ----- Geographical details --------
        CAST(region AS VARCHAR) AS region,
        ----- Dimensions --------
        CAST(category AS VARCHAR) AS category,
        CAST(top_brand AS VARCHAR) AS top_brand,
        ----- KPI --------
        CAST(est_units AS float) AS estimated_units_sold
FROM 
        market_top_sellers_with_null_values_filled_and_no_duplicates