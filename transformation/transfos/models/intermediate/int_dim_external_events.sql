-- Transform the external_events table
SELECT 
        date,
        country,
        region,
        event_type,
        event_name,
        impact_score 
-- Don't select source as it doesn't bring so much information
FROM 
        {{ ref('raw_dim_external_events') }}
-- Exclude rows corresponding to unknown events and null impact scores as it won't bring any information
WHERE 
        event_name != 'Unknown value' -- Exclude unknown events
AND 
        impact_score > 0 -- Exclude impact scores equal to 0
-- Order by impact_score to get the events with the highest impact
ORDER BY 
        impact_score DESC