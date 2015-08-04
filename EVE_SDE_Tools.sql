USE [ebs_DATADUMP]
GO

/****** Object:  UserDefinedFunction [dbo].[AdjustedPrices]    Script Date: 28/07/2014 18:02:12 ******/
DROP FUNCTION [dbo].[invAdjustedPrices]
GO

/****** Object:  UserDefinedFunction [dbo].[EveCentralPrices]    Script Date: 28/07/2014 18:02:24 ******/
DROP FUNCTION [dbo].[mapPrices]
GO

/****** Object:  UserDefinedFunction [dbo].[SystemCostIndex]    Script Date: 28/07/2014 18:05:49 ******/
DROP FUNCTION [dbo].[mapCostIndex]
GO

/****** Object:  SqlAssembly [EVE_SDE_tools]    Script Date: 28/07/2014 18:01:16 ******/
DROP ASSEMBLY [EVE_SDE_tools]
GO

/****** Object:  SqlAssembly [Newtonsoft.Json]    Script Date: 29/07/2014 18:59:54 ******/
DROP ASSEMBLY [Newtonsoft.Json]
GO

/****** Object:  SqlAssembly [System.Runtime.Serialization]    Script Date: 29/07/2014 18:54:41 ******/
DROP ASSEMBLY [System.Runtime.Serialization]
GO

/****** Object:  SqlAssembly [System.Runtime.Serialization]    Script Date: 29/07/2014 18:54:41 ******/
ALTER DATABASE ebs_DATADUMP SET TRUSTWORTHY ON;

CREATE ASSEMBLY [System.Runtime.Serialization]
FROM 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Runtime.Serialization.dll'
WITH PERMISSION_SET = UNSAFE
GO

/****** Object:  SqlAssembly [Newtonsoft.Json]    Script Date: 29/07/2014 18:59:54 ******/
CREATE ASSEMBLY [Newtonsoft.Json]
FROM 'D:\Documents\Visual Studio 2013\Projects\EVE SDE tools\EVE SDE tools\bin\Release\Newtonsoft.Json.dll'
WITH PERMISSION_SET = UNSAFE
GO

/****** Object:  SqlAssembly [EVE_SDE_tools]    Script Date: 28/07/2014 18:01:16 ******/
CREATE ASSEMBLY [EVE_SDE_tools]
FROM 'D:\Documents\Visual Studio 2013\Projects\EVE SDE tools\EVE SDE tools\bin\Release\EVE_SDE_tools.dll'
WITH PERMISSION_SET = EXTERNAL_ACCESS

GO

/****** Object:  UserDefinedFunction [dbo].[AdjustedPrices]    Script Date: 28/07/2014 18:02:12 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [dbo].[invAdjustedPrices]()
RETURNS  TABLE (
	[itemId] [int] NULL,
	[adjustedPrice] [money] NULL,
	[averagePrice] [money] NULL,
	[itemName] [nvarchar](100) NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [EVE_SDE_tools].[UserDefinedFunctions].[AdjustedPrices]
GO

CREATE FUNCTION [dbo].[mapPrices]()
RETURNS  TABLE (
	[itemId] [int] NULL,
	[volume] [bigint] NULL,
	[buy] [money] NULL,
	[sell] [money] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [EVE_SDE_tools].[UserDefinedFunctions].[EveCentralPrices]
GO

CREATE FUNCTION [dbo].[mapCostIndex](@systemId [int], @systemName [nvarchar](4000), @activityId [int])
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [EVE_SDE_tools].[UserDefinedFunctions].[SystemCostIndex]
GO
