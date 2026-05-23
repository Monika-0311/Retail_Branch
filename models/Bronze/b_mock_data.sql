Select 
Order_id,	
Product_Id,	
Product_Name,	
Product_Disc,	
Seller_Name,	
Customer_Name,	
Product_Price,	
Total
From {{ source('RETAIL_MARKET', 's_mock_data') }}
