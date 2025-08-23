-- Transform the products table
SELECT 
        sku,
        universal_product_code,
        -- category, -- The category is useless as the only value is 'Champagne', the product proposed by the brand we help
        cuvee,
        --brand, -- The brand column is useless as the only value is 'Maison Étoile', the brand we help
        bottle_size_ml,
        list_price_usd,
        list_price_cad,
        launch_date
FROM 
        {{ ref('raw_dim_products_catalog') }}
ORDER BY 
        launch_date DESC, -- We want the catalog to be ranked from the most recent product launched to the oldest
        bottle_size_ml ASC, -- Then we apply a ranking based on the bottle size from the smallest to the largest
        list_price_usd DESC, -- In case there's still equality, rank by US price, because the USA are the first market
        list_price_cad DESC -- Then rank by Canadian price