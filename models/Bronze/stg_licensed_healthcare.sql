Select 
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
current_timestamp as load_date
From {{ source('RETAIL_MARKET', 's_licensed_healthcare') }}
Qualify row_number() over (partition by OSHPD_ID, license_num order by load_date desc) = 1