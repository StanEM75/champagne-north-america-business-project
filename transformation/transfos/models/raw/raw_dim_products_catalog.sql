-- Import the products_catalog table from Snowflake and replace null values

-- Start by filling existing null values and replace them by the expression 'Unknown value'
WITH products_catalog_with_null_values_filled AS 
(
SELECT  
    -- Call the macro input_unknown_value_for_null that replaces null values by 'Unknown value' on all the columns
    {{ input_unknown_value_for_null([
        'sku',
        'category',
        'brand',
        'cuvee'
    ]) }}, 
    -- A float column can't be modified with the macro input_unknown_value_for_null so a manual processing can be done
    COALESCE(upc, 0) AS upc,
    COALESCE(bottle_size_ml, 0) AS bottle_size_ml,
    COALESCE(list_price_usd, 0) AS list_price_usd,
    COALESCE(list_price_cad, 0) AS list_price_cad,
    -- A date column can't be modified with the macro input_unknown_value_for_null
    launch_date
FROM 
    {{ source('raw', 'products_catalog') }}
)

SELECT 
    sku,
    upc AS universal_product_code,
    brand,
    category,
    cuvee, 
    bottle_size_ml,
    list_price_usd,
    list_price_cad,
    launch_date
FROM 
    products_catalog_with_null_values_filled