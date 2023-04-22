----------------------------------------------------------------SPS FOR CUSTOMER TABLE CURD OPERATIONS---------------------

IF OBJECT_ID('dbo.spAddCustomer', 'PROCEDURE') IS NOT NULL
BEGIN
	DROP PROCEDURE
		dbo.spAddCustomer;
END;
GO
CREATE PROCEDURE dbo.spAddCustomer          
(   
--declare         
    @UserName VARCHAR(30), 
	@FirstName VARCHAR(20),
    @LastName VARCHAR(20),          
    @Email VARCHAR(20),          
    @CreatedOn DATETIME  
)          
AS  
BEGIN           
    Insert into Customer (FirstName,LastName,Email,UserName,CreatedOn,IsActive)           
    Values (@FirstName,@LastName,@Email,@UserName,@CreatedOn,1)           
END;  

--------------------------------------------------------------------------------
IF OBJECT_ID('dbo.spUpdateCustomer', 'PROCEDURE') IS NOT NULL
BEGIN
	DROP PROCEDURE
		dbo.spUpdateCustomer;
END;
GO
CREATE PROCEDURE dbo.spUpdateCustomer            
(            
    @UserId uniqueidentifier ,          
    @UserName VARCHAR(30), 
	@FirstName VARCHAR(20),
    @LastName VARCHAR(20),          
    @Email VARCHAR(20),          
    @CreatedOn DATETIME,  
    @IsActive BIT          
)            
AS  
BEGIN           
   Update Customer
   SET
			Username = @UserName,
			Email = @Email,
			FirstName = @FirstName,
			LastName = @LastName,
			CreatedOn = @CreatedOn,
			IsActive = @IsActive
   where UserId = @UserId            
END;  
--------------------------------------------------------------------
IF OBJECT_ID('dbo.spDeleteCustomer', 'PROCEDURE') IS NOT NULL
BEGIN
	DROP PROCEDURE
		dbo.spDeleteCustomer;
END;
GO
CREATE PROCEDURE spDeleteCustomer           
(            
   @UserId uniqueidentifier            
)            
AS  
BEGIN           
   DELETE FROM Customer where UserId = @UserId            
End;  
------------------------------------------------------------------------------
IF OBJECT_ID('dbo.spGetAllCustomer', 'PROCEDURE') IS NOT NULL
BEGIN
	DROP PROCEDURE
		dbo.spGetAllCustomer;
END;
GO
CREATE PROCEDURE spGetAllCustomer        
AS  
BEGIN        
    SELECT UserId,
			Username,
			Email,
			FirstName,
			LastName,
			CreatedOn,
			IsActive 
		FROM Customer  ORDER BY UserId DESC;
End;  
------------------------------------------------------------------------------
IF OBJECT_ID('dbo.spGetActiveOrder', 'PROCEDURE') IS NOT NULL
BEGIN
	DROP PROCEDURE
		dbo.spGetActiveOrder;
END;
GO
CREATE PROCEDURE spGetActiveOrder        
AS  
BEGIN        
    SELECT UserId,
			Username,
			Email,
			FirstName,
			LastName,
			CreatedOn,
			CR.IsActive 
		FROM Customer  CR
		INNER JOIN Orders RR ON CR.UserId = RR.OrderBy
		where RR.ISACTIVE = 1;
End; 
-----------------------------------------------------------------------------