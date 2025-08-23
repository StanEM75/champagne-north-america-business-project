-- Import the deduplicate function from the dbt_utils package, which was created to remove duplicates
{{ dbt_utils.deduplicate(
    relation=ref('my_source_table'),
    partition_by=dbt_utils.star(ref('my_source_table')),
    order_by='1'
) }}