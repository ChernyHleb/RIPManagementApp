create database RIPManagementApp_DB

use [RIPManagementApp_DB]

CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1, 1) NOT NULL,
	[Name] [nvarchar] NOT NULL,
	[ContractStatus] [int] NOT NULL,

	CONSTRAINT PK_Company_Id PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT UK_Company_Name UNIQUE([Name])
)

CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1, 1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Name] [nvarchar] NOT NULL,
	[Login] [nvarchar] NOT NULL,
	[Password] [nvarchar] NOT NULL,

	CONSTRAINT PK_User_Id PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT FK_User_CompanyId FOREIGN KEY ([CompanyId])
		REFERENCES [dbo].[Company]([Id]),
	CONSTRAINT UK_User_Login UNIQUE ([Login])
)