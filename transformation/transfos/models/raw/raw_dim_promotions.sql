-- Import the promotions table from Snowflake and replace null values

-- Start by filling existing null values and replace them by the expression 'Unknown value'
WITH promotions_with_null_values_filled AS 
(
SELECT  
    -- Call the macro input_unknown_value_for_null that replaces null values by 'Unknown value' on all the columns
    {{ input_unknown_value_for_null([
        'promo_id',
        'distributor_id',
        'discount_type',
        'products',
        'description'
    ]) }}, 
    -- A float column can't be modified with the macro input_unknown_value_for_null so a manual processing can be done
    COALESCE(discount_value, 0) AS discount_value,
    -- A date column can't be modified with the macro input_unknown_value_for_null
    start_date,
    end_date
FROM 
    {{ source('raw', 'promotions') }}
)

SELECT 
    CAST(promo_id AS VARCHAR) AS promo_id,
    CAST(distributor_id AS VARCHAR) AS distributor_id,
    {{ correct_date_format('start_date') }} AS start_date,
    {{ correct_date_format('end_date') }} AS end_date,
    /*CASE 
        WHEN end_date_timestamped IS NULL THEN 'Promotion still ongoing'
        ELSE TO_CHAR(end_date_timestamped, 'YYYY-MM-DD')
    END AS end_date_corrected, -- end_date*/
    CAST(products AS VARCHAR) AS products,
    CAST(discount_type AS VARCHAR) AS discount_type,  
    CAST(discount_value AS FLOAT) AS discount_value,
    CAST(description AS VARCHAR) AS description 
FROM 
    promotions_with_null_values_filled