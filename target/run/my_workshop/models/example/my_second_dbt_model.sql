

  create or replace view `dbt-technical-training`.`njv_dbt_transformation`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `dbt-technical-training`.`njv_dbt_transformation`.`my_first_dbt_model`
where id = 1;

