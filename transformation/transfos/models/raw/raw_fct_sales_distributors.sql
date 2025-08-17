-- Import the sales_distributors table from Snowflake and replace null values as well as modify the types

-- Start by filling existing null values and replace them by the expression 'Unknown value'
WITH sales_with_null_values_filled AS 
(
SELECT  
    -- A date column can't be modified with the macro input_unknown_value_for_null
    date, 
    -- A float column can't be modified with the macro input_unknown_value_for_null so a manual processing can be done
    COALESCE(bottle_size_ml, 0) AS bottle_size_in_ml_for_the_bottle_sold,
    COALESCE(units, 0) AS units_sold,
    COALESCE(unit_price, 0) AS unit_price,
    COALESCE(discount_applied, 0) AS discount_applied_during_the_sale,
    -- Call the macro input_unknown_value_for_null that replaces null values by 'Unknown value' on all the columns
    {{ input_unknown_value_for_null([
        'country',
        'state_province',
        'distributor_id',
        'channel',
        'retailer_id',
        'sku',
        'product_name',
        'currency',
        'promo_id',
        'order_id',
        'invoice_id'
    ]) }}
FROM 
    {{ source('raw', 'sales') }}
)

SELECT 
----- Date --------
    CAST(date AS Date) AS transaction_date,
----- Order dimensions --------
    CAST(order_id AS VARCHAR) AS transaction_id,
----- Geographic dimensions --------
    CAST(country AS VARCHAR) AS transaction_country,
    CAST(state_province AS VARCHAR) AS transaction_state_province,
----- Distribution dimensions --------
    CAST(distributor_id AS VARCHAR) AS distributor_id,
    CAST(retailer_id AS VARCHAR) AS retailer_id,
    CAST(channel AS VARCHAR) AS transaction_channel,
----- Product dimensions --------
    CAST(sku AS VARCHAR) AS sku,
    CAST(product_name AS VARCHAR) AS name_of_the_product_sold,
    CAST(bottle_size_in_ml_for_the_bottle_sold AS NUMBER) AS bottle_size_in_ml_for_the_bottle_sold,
----- Payment dimensions --------
    CAST(unit_price AS NUMBER) AS unit_price_of_the_product_sold,
    CAST(currency AS VARCHAR) AS currency_of_the_transaction,
    CAST(units_sold AS NUMBER) AS units_of_the_product_sold_in_the_transaction,
    CAST(invoice_id AS VARCHAR) AS transaction_invoice_id,
----- Promotion dimensions --------
    CAST(promo_id AS VARCHAR) AS promo_id,
    CAST(discount_applied_during_the_sale AS NUMBER) AS discount_applied_during_the_sale
FROM 
    sales_with_null_values_filled