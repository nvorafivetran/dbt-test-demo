

  create or replace view `dbt-technical-training`.`njv_dbt_transformation`.`stg_salesforce__opportunity_tmp`
  OPTIONS()
  as select *
from `dbt-technical-training`.`njv_salesforce_sandbox`.`opportunity`
;

