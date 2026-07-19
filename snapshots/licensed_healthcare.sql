{% snapshot cur_licensed_healthcare %}

{{ config(
    target_schema='snapshots',
    unique_key='OSHPD_ID',
    strategy='check',
    check_cols=['OSHPD_ID', 'LICENSE_NUM', 'load_date'],
    updated_at='load_date',
    invalidate_hard_deletes=true
) }}
Select
{{ dbt_utils.generate_surrogate_key(['OSHPD_ID', 'LICENSE_NUM', 'load_date']) }} As row_key,
OSHPD_ID,	
FACILITY_NAME,	
LICENSE_NUM,	
FACILITY_LEVEL_DESC,	
DBA_ADDRESS1,	
DBA_CITY,	
DBA_ZIP_CODE,	
COUNTY_CODE,	
COUNTY_NAME,	
ER_SERVICE_LEVEL_DESC,	
TOTAL_NUMBER_BEDS,	
FACILITY_STATUS_DESC,	
FACILITY_STATUS_DATE,	
LICENSE_TYPE_DESC,	
LICENSE_CATEGORY_DESC,	
LONGITUDE,	
LATITUDE,	
Cast(load_date as TIMESTAMP_NTZ) as load_date
From {{ ref('stg_licensed_healthcare') }}
{% endsnapshot %}