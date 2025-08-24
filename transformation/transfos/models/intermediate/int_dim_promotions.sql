-- Transform the promotions table
SELECT 
        promo_id,
        start_date,
        end_date,
        distributor_id,
        products,
        discount_type,
        discount_value,
        description
FROM 
        {{ ref('raw_dim_promotions') }}