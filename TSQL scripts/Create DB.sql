create database RIPManagementApp_DB

use [RIPManagementApp_DB]

CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1, 1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[ContractStatus] [int] NOT NULL,
	-- 0 - Ещё не заключен
	-- 1 - Заключен
	-- 2 - Расторгнут

	CONSTRAINT PK_Company_Id PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT UK_Company_Name UNIQUE([Name])
)

CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1, 1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Login] [nvarchar](64) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,

	CONSTRAINT PK_User_Id PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT FK_User_CompanyId FOREIGN KEY ([CompanyId])
		REFERENCES [dbo].[Company]([Id]),
	CONSTRAINT UK_User_Login UNIQUE ([Login])
)