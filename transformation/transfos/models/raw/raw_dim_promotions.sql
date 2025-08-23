-- Import the promotions table from Snowflake and replace null values

-- Start by filling existing null values and replace them by the expression 'Unknown value'
WITH promotions_with_null_values_filled AS 
(
    SELECT  
            -- Call the macro input_unknown_value_for_null that replaces null values by 'Unknown value' on all the string columns
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
),

-- Remove duplicates from the table
promotions_with_null_values_filled_and_no_duplicates AS 
(
    SELECT 
            DISTINCT *
    FROM 
            promotions_with_null_values_filled
)

SELECT 
        ----- IDs --------
        CAST(promo_id AS VARCHAR) AS promo_id,
        CAST(distributor_id AS VARCHAR) AS distributor_id,
        ----- Dates --------
        {{ correct_date_format('start_date') }} AS start_date, -- Manage the different dates formats
        {{ correct_date_format('end_date') }} AS end_date, -- Manage the different dates formats
        ----- Products in promotion --------
        CAST(products AS VARCHAR) AS products,
        ----- Discount details --------
        CAST(discount_type AS VARCHAR) AS discount_type,  
        CAST(discount_value AS FLOAT) AS discount_value,
        CAST(description AS VARCHAR) AS description 
FROM 
    promotions_with_null_values_filled