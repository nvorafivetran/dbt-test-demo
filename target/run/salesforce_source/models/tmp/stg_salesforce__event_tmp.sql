

  create or replace view `dbt-technical-training`.`njv_dbt_transformation`.`stg_salesforce__event_tmp`
  OPTIONS()
  as --To disable this model, set the below variable within your dbt_project.yml file to False.


select * 
from `dbt-technical-training`.`njv_salesforce_sandbox`.`event`
;

