
Select 
id,
first_name,
last_name,
email,
Location,
Department,
current_timestamp as last_updated
from {{ source('RETAIL_MARKET','s_Employees') }}
