{{ config(
    materialized = 'incremental',
    unique_key = 'id'
) }}

Select 
id,
first_name,
last_name,
email,
Location,
Department,
last_updated
From {{ ref('Employees') }}
Where last_updated Is not null 
{% if is_incremental() %}
    And last_updated > (Select Max(last_updated) From {{this}})
{% endif %} 



