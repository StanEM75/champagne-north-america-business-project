-- Select the most impactful events per countries

-- Calculate the average impact score by event first
WITH most_impactful_events AS (
    SELECT 
            country,
            event_name,
            AVG(impact_score) AS avg_impact_score_for_the_event
    FROM 
            {{ ref('int_dim_external_events') }}
    GROUP BY 
            country,
            event_name 
    -- Get the highest scores first, printing the most impactful events at the top
)

SELECT 
-- Remove duplicates with DISTINCT because the conversion of the date column to a column containing only the month may leads to duplicates
        DISTINCT
        events_details.country,
        -- Get the usual month of the event to identify patterns
        TO_CHAR(events_details.date, 'Mon') as event_usual_month,
        events_details.event_type,
        events_details.event_name,
        events_calculation.avg_impact_score_for_the_event
FROM 
        {{ ref('int_dim_external_events') }} events_details
NATURAL JOIN 
        most_impactful_events events_calculation
WHERE 
        -- Some null values for months may create duplicates or partial information
        event_usual_month IS NOT NULL
ORDER BY 
        events_details.country,
        events_calculation.avg_impact_score_for_the_event DESC