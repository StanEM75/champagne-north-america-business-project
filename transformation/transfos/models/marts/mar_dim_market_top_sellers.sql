-- Select the categories and brands that represents the highest volumes of sales per countries

SELECT 
    region,
    category,
    top_brand,
    SUM(estimated_units_sold) AS total_sales
FROM 
    {{ ref('int_dim_market_top_sellers') }}
GROUP BY 
    GROUPING SETS 
    (
        (region, category), -- Get the most successful category by region
        (region, top_brand), -- Get the most successful brand by region
        (category, top_brand) -- Get the most brand brand by category
    )
ORDER BY 
    total_sales DESC