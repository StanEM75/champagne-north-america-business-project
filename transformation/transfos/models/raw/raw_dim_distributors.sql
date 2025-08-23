SELECT 
        distributor_id,
        distributor_name,
        country
FROM 
        {{ source('raw', 'distributors') }}