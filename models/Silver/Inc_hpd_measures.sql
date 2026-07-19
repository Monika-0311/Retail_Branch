{{ config(
    materialized = 'incremental',
    unique_key = 'measure_sqn', update_action = 'merge', incremental_strategy = 'append', partition_by = {'field': 'load_date', 'data_type': 'date'}
) }}

Select 
reporting_year,	age_band,	assigned_sex_at_birth,	covered_california_region,
geo_type,	geo_value,	payer_type,	measure_id,	measure_numerator,	measure_denominator,
measure_scaling_factor, suppression_ind, Load_date
From {{ ref('hdp_measures_2018_23') }}
Where load_date Is not null
{% if is_incremental() %}
  WHERE load_date > (SELECT MAX(load_date) FROM {{ this }})
{% endif %}