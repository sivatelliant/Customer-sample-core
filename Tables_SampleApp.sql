--drop table Customer
--drop table Supplier
--drop table Product
--drop table [Order]

IF NOT EXISTS
			  (
				  SELECT
						 *
				  FROM
					  sys.objects
				  WHERE object_id = OBJECT_ID(N'[dbo].[Customer]')
						AND type IN(N'U')
			  )
BEGIN

	CREATE TABLE [dbo].[Customer]
(
	[UserId] UNIQUEIDENTIFIER DEFAULT NEWId(),          
    [Username] varchar(30) NOT NULL,          
    [Email] varchar(20) NOT NULL,  
    [FirstName] varchar(20) NOT NULL,   
    [LastName] varchar(20) NULL,  
    [CreatedOn] DateTime  NULL,     
	[IsActive] bit
		PRIMARY KEY CLUSTERED([UserId] ASC)
		WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
	ON [PRIMARY];

	ALTER TABLE [dbo].[Customer]
	ADD
				DEFAULT(GETDATE()) FOR [CreatedOn];

	ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [IsActive];
END;
---------------------------------------------INSERT------------------------------
--INSERT INTO Customer 
--			(Username,Email,FirstName,LastName,CreatedOn,IsActive)
--	values('test1','test1@yopmail.com','test','one',GETDATE(),1)

--INSERT INTO Customer 
--			(Username,Email,FirstName,LastName,CreatedOn,IsActive)
--	values('test2','test2@yopmail.com','test','two',GETDATE(),1)

--select * from Customer
----------------------------------------table 2
IF NOT EXISTS
			  (
				  SELECT
						 *
				  FROM
					  sys.objects
				  WHERE object_id = OBJECT_ID(N'[dbo].[Supplier]')
						AND type IN(N'U')
			  )
BEGIN
	CREATE TABLE [dbo].[Supplier]
(      
    [SupplierId] UNIQUEIDENTIFIER DEFAULT NEWId(),          
    [SupplierName] varchar(50) NOT NULL,
    [CreatedOn] DateTime  NULL,
	[IsActive] BIT
		PRIMARY KEY CLUSTERED([SupplierId] ASC)
		WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
	ON [PRIMARY];

	ALTER TABLE [dbo].[Supplier]
	ADD
				DEFAULT(GETDATE()) FOR [CreatedOn];
	
	ALTER TABLE [dbo].[Supplier] ADD  DEFAULT ((1)) FOR [IsActive];
END;
---------------------------------------------INSERT------------------------------
--INSERT INTO [Supplier] 
--			(SupplierName,CreatedOn,IsActive)
--	values('supp1',GETDATE(),1)

--INSERT INTO [Supplier] 
--			(SupplierName,CreatedOn,IsActive)
--	values('supp2',GETDATE(),1)

--select * from [Supplier]
----------------------------------------table 3
IF NOT EXISTS
			  (
				  SELECT
						 *
				  FROM
					  sys.objects
				  WHERE object_id = OBJECT_ID(N'[dbo].[Product]')
						AND type IN(N'U')
			  )
BEGIN

	CREATE TABLE [dbo].[Product]
(      
    [ProductId] UNIQUEIDENTIFIER DEFAULT NEWId(),          
    [ProductName] varchar(50) NOT NULL,   
    [UnitPrice] DECIMAL(18, 5) NULL,
    [SupplierId] UNIQUEIDENTIFIER NOT NULL,  
    [CreatedOn] DateTime  NULL,
	[IsActive] BIT
		PRIMARY KEY CLUSTERED([ProductId] ASC)
		WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
	ON [PRIMARY];

	ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierId])
	REFERENCES [dbo].[Supplier] ([SupplierId])

	ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]

	ALTER TABLE [dbo].[Product]
	ADD
				DEFAULT(GETDATE()) FOR [CreatedOn];
	
	ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [IsActive];
END;
-----------------------------------------------INSERT------------------------------
--INSERT INTO [Product] 
--			(ProductName,UnitPrice,SupplierId,CreatedOn,IsActive)
--	values('prod1',3,'B5F12A6E-29D9-4884-BA2D-08B455F09935',GETDATE(),1)

--INSERT INTO [Product] 
--			(ProductName,UnitPrice,SupplierId,CreatedOn,IsActive)
--	values('prod2',5,'0E15904C-246F-4E1D-A1CE-CA037608B673',GETDATE(),1)

--select * from [Product]

---------------------------------------table 4
IF NOT EXISTS
			  (
				  SELECT
						 *
				  FROM
					  sys.objects
				  WHERE object_id = OBJECT_ID(N'[dbo].[Order]')
						AND type IN(N'U')
			  )
BEGIN

	CREATE TABLE [dbo].[Order]
(
	[OrderId] UNIQUEIDENTIFIER DEFAULT NEWId(),          
    [ProductId] UNIQUEIDENTIFIER NOT NULL,          
    [OrderStatus] INT  NULL,  
    [OrderType] INT  NULL,   
    [OrderBy] UNIQUEIDENTIFIER NOT NULL,  
    [OrderedOn] DateTime  NULL,  
	[ShippedOn] DateTime  NULL,
	[IsActive] BIT
		PRIMARY KEY CLUSTERED([OrderId] ASC)
		WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
	ON [PRIMARY];

	ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([OrderBy])
	REFERENCES [dbo].[Customer] ([UserId])

	ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]

	ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductId])
	REFERENCES [dbo].[Product] ([ProductId])

	ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]

	ALTER TABLE [dbo].[Order]
	ADD
				DEFAULT(GETDATE()) FOR [OrderedOn];
	ALTER TABLE [dbo].[Order]
	ADD
				DEFAULT(GETDATE()) FOR [ShippedOn];

	ALTER TABLE [dbo].[Order] ADD  DEFAULT ((1)) FOR [IsActive];
END;
---------------------------------------------INSERT------------------------------
--INSERT INTO [Order] 
--			(ProductId,OrderStatus,OrderType,OrderBy,OrderedOn,ShippedOn,IsActive)
--	values('891C782F-4459-4AAA-8499-4CEB4180D4C0',1,1,'97219906-3D69-4492-A66A-484A092E5A43',GETDATE(),GETDATE(),1)

--INSERT INTO [Order] 
--			(ProductId,OrderStatus,OrderType,OrderBy,IsActive)
--	values('EA418B83-CC51-4271-975F-D0F14AD7CF29',1,1,'D039D5E8-0E1E-4705-BE19-8434AB0AB059',1)

--select * from [Order]
