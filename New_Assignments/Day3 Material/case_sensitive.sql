USE "namastesql"
GO
ALTER DATABASE "namastesql" SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
ALTER DATABASE "namastesql" COLLATE Latin1_General_CS_AS;

USE "namastesql"
ALTER DATABASE "namastesql" SET MULTI_USER
GO



