{{ config(
    materialized = 'view', target_name = 'hdp_measures_model'
) }}

Select 
reporting_year,	age_band,	assigned_sex_at_birth,	covered_california_region,
geo_type,	geo_value,	payer_type,	measure_id,	measure_numerator,	measure_denominator,
measure_scaling_factor, suppression_ind, Load_date
From {{source('RETAIL_MARKET','s_hdp_measures')}}