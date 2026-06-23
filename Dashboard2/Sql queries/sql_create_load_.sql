
USE customer_behaviour

GO

IF OBJECT_ID('customer_info', 'U') IS NOT NULL
    DROP TABLE customer_info;
GO

CREATE TABLE customer_info (

Customer_ID int,	
Age int,
Gender NVARCHAR(50),
Item_Purchased NVARCHAR(50),
Category NVARCHAR(50),
Purchase_Amount int,
[Location] NVARCHAR(50),
[Size] NVARCHAR(50),
Color	NVARCHAR(50),
Season	NVARCHAR(50),
Review_Rating float(50),
Subscription_Status NVARCHAR(50),
Shipping_Type NVARCHAR(50),
Discount_Applied NVARCHAR(50),
Promo_Code_Used	NVARCHAR(50),
Previous_Purchases int,
Payment_Method NVARCHAR(50),
Frequency_of_Purchases NVARCHAR(50)

    
)
GO

BULK INSERT customer_info
		FROM 'C:\Users\purva\Downloads\customer_shopping_behavior.csv'
		WITH (
			FIRSTROW = 2,
		FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n', 
			TABLOCK
		);