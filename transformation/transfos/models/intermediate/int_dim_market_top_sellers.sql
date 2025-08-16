-- Transform the market_top_sellers table
SELECT 
    period,
    region,
    category,
    top_brand,
    estimated_units_sold 
FROM 
    {{ ref('raw_dim_market_top_sellers') }}
-- Exclude rows corresponding to unknown categories & brands and null units sold as it won't bring any information
WHERE 
    category != 'Unknown value' -- Exclude unknown categories
AND 
    top_brand != 'Unknown value' -- Exclude unknown brands
AND 
    estimated_units_sold > 0 -- Exclude sales equal to 0
-- Order by estimated_units_sold to get the categories and brands with the highest impact
ORDER BY 
    estimated_units_sold DESC