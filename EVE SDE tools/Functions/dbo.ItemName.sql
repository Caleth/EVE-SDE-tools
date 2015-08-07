
/****** Object:  UserDefinedFunction [dbo].[ItemName]    Script Date: 29/07/2014 00:46:41 ******/
CREATE FUNCTION [dbo].[ItemName]
(
	@TypeID int
)
RETURNS NVARCHAR(100)
AS
BEGIN
	DECLARE @Result NVARCHAR(100)
	SELECT @Result = typeName FROM invTypes WHERE typeID = @TypeID
	RETURN @Result
END