-- Transform the sales table
SELECT 
        transaction_date,
        transaction_id,
        -- transaction_country, -- We already have the information through the int_dim_retailers table linked to this table by retailer_id
        -- transaction_state_province, -- We already have the information through the int_dim_retailers table linked to this table by retailer_id
        distributor_id,
        retailer_id,
        transaction_channel,
        sku,
        -- name_of_the_product_sold, -- We already have the information through the int_dim_products table linked to this table by sku
        -- bottle_size_in_ml_for_the_bottle_sold, -- We already have the information through the int_dim_products table linked to this table by sku
        unit_price_of_the_product_sold,
        currency_of_the_transaction
FROM 
        {{ ref('raw_fct_sales') }}