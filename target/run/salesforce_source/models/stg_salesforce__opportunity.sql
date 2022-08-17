

  create or replace table `dbt-technical-training`.`njv_dbt_transformation`.`stg_salesforce__opportunity`
  
  
  OPTIONS()
  as (
    with base as (

    select *
    from `dbt-technical-training`.`njv_dbt_transformation`.`stg_salesforce__opportunity_tmp`
), 

fields as (

    select

        
    
    
    _fivetran_synced
    
 as 
    
    _fivetran_synced
    
, 
    
    
    account_id
    
 as 
    
    account_id
    
, 
    
    
    amount
    
 as 
    
    amount
    
, 
    
    
    campaign_id
    
 as 
    
    campaign_id
    
, 
    
    
    close_date
    
 as 
    
    close_date
    
, 
    
    
    created_date
    
 as 
    
    created_date
    
, 
    
    
    description
    
 as 
    
    description
    
, 
    
    
    expected_revenue
    
 as 
    
    expected_revenue
    
, 
    
    
    fiscal
    
 as 
    
    fiscal
    
, 
    
    
    fiscal_quarter
    
 as 
    
    fiscal_quarter
    
, 
    
    
    fiscal_year
    
 as 
    
    fiscal_year
    
, 
    
    
    forecast_category
    
 as 
    
    forecast_category
    
, 
    
    
    forecast_category_name
    
 as 
    
    forecast_category_name
    
, 
    
    
    has_open_activity
    
 as 
    
    has_open_activity
    
, 
    
    
    has_opportunity_line_item
    
 as 
    
    has_opportunity_line_item
    
, 
    
    
    has_overdue_task
    
 as 
    
    has_overdue_task
    
, 
    
    
    id
    
 as 
    
    id
    
, 
    
    
    is_closed
    
 as 
    
    is_closed
    
, 
    
    
    is_deleted
    
 as 
    
    is_deleted
    
, 
    
    
    is_won
    
 as 
    
    is_won
    
, 
    
    
    last_activity_date
    
 as 
    
    last_activity_date
    
, 
    
    
    last_referenced_date
    
 as 
    
    last_referenced_date
    
, 
    
    
    last_viewed_date
    
 as 
    
    last_viewed_date
    
, 
    
    
    lead_source
    
 as 
    
    lead_source
    
, 
    
    
    name
    
 as 
    
    name
    
, 
    cast(null as 
    string
) as 
    
    next_step
    
 , 
    
    
    owner_id
    
 as 
    
    owner_id
    
, 
    
    
    probability
    
 as 
    
    probability
    
, 
    
    
    record_type_id
    
 as 
    
    record_type_id
    
, 
    
    
    stage_name
    
 as 
    
    stage_name
    
, 
    
    
    synced_quote_id
    
 as 
    
    synced_quote_id
    
, 
    
    
    type
    
 as 
    
    type
    




        --The below script allows for pass through columns.
        

    from base
), 

final as (
    
    select 
        cast(_fivetran_synced as 
    timestamp
) as _fivetran_synced,
        account_id,
        cast(amount as 
    numeric
) as amount,
        campaign_id,
        cast(close_date as 
    timestamp
) as close_date,
        cast(created_date as 
    timestamp
) as created_date,
        description as opportunity_description,
        cast(expected_revenue as 
    numeric
) as expected_revenue,
        fiscal,
        fiscal_quarter,
        fiscal_year,
        forecast_category,
        forecast_category_name,
        has_open_activity,
        has_opportunity_line_item,
        has_overdue_task,
        id as opportunity_id,
        is_closed,
        is_deleted,
        is_won,
        cast(last_activity_date as 
    timestamp
) as last_activity_date,
        cast(last_referenced_date as 
    timestamp
) as last_referenced_date,
        cast(last_viewed_date as 
    timestamp
) as last_viewed_date,
        lead_source,
        name as opportunity_name,
        next_step,
        owner_id,
        probability,
        record_type_id,
        stage_name,
        synced_quote_id,
        type

        --The below script allows for pass through columns.
        

    from fields
), 

calculated as (
        
    select 
        *,
        created_date >= timestamp_trunc(
        cast(
    current_timestamp
 as timestamp),
        month
    ) as is_created_this_month,
        created_date >= timestamp_trunc(
        cast(
    current_timestamp
 as timestamp),
        quarter
    ) as is_created_this_quarter,
        datetime_diff(
        cast(created_date as datetime),
        cast(
    current_timestamp
 as datetime),
        day
    ) as days_since_created,
        datetime_diff(
        cast(created_date as datetime),
        cast(close_date as datetime),
        day
    ) as days_to_close,
        timestamp_trunc(
        cast(close_date as timestamp),
        month
    ) = timestamp_trunc(
        cast(
    current_timestamp
 as timestamp),
        month
    ) as is_closed_this_month,
        timestamp_trunc(
        cast(close_date as timestamp),
        quarter
    ) = timestamp_trunc(
        cast(
    current_timestamp
 as timestamp),
        quarter
    ) as is_closed_this_quarter
    from final
)

select * 
from calculated
where not coalesce(is_deleted, false)
  );
  