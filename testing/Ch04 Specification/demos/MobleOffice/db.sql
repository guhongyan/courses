IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'MobileOffice')
	DROP DATABASE [MobileOffice]
GO

CREATE DATABASE [MobileOffice]  ON (NAME = N'MobileOffice_Data', FILENAME = N'D:\OMO\MobileOffice_Data.MDF' , SIZE = 200, FILEGROWTH = 10%) LOG ON (NAME = N'MobileOffice_Log', FILENAME = N'D:\OMO\MobileOffice_Log.LDF' , SIZE = 100, FILEGROWTH = 10%)
 COLLATE Chinese_PRC_CI_AS
GO

exec sp_dboption N'MobileOffice', N'autoclose', N'false'
GO

exec sp_dboption N'MobileOffice', N'bulkcopy', N'false'
GO

exec sp_dboption N'MobileOffice', N'trunc. log', N'false'
GO

exec sp_dboption N'MobileOffice', N'torn page detection', N'true'
GO

exec sp_dboption N'MobileOffice', N'read only', N'false'
GO

exec sp_dboption N'MobileOffice', N'dbo use', N'false'
GO

exec sp_dboption N'MobileOffice', N'single', N'false'
GO

exec sp_dboption N'MobileOffice', N'autoshrink', N'false'
GO

exec sp_dboption N'MobileOffice', N'ANSI null default', N'false'
GO

exec sp_dboption N'MobileOffice', N'recursive triggers', N'false'
GO

exec sp_dboption N'MobileOffice', N'ANSI nulls', N'false'
GO

exec sp_dboption N'MobileOffice', N'concat null yields null', N'false'
GO

exec sp_dboption N'MobileOffice', N'cursor close on commit', N'false'
GO

exec sp_dboption N'MobileOffice', N'default to local cursor', N'false'
GO

exec sp_dboption N'MobileOffice', N'quoted identifier', N'false'
GO

exec sp_dboption N'MobileOffice', N'ANSI warnings', N'false'
GO

exec sp_dboption N'MobileOffice', N'auto create statistics', N'true'
GO

exec sp_dboption N'MobileOffice', N'auto update statistics', N'true'
GO

use [MobileOffice]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Contacts_ContactGroups]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT FK_Contacts_ContactGroups
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_User_Department]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Users] DROP CONSTRAINT FK_User_Department
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ContactGroups_User]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ContactGroups] DROP CONSTRAINT FK_ContactGroups_User
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Contacts_User]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT FK_Contacts_User
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_EmailNotify_User]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[EmailNotify] DROP CONSTRAINT FK_EmailNotify_User
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_EventSubscribe_User]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[EventSubscribe] DROP CONSTRAINT FK_EventSubscribe_User
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_PvtPhrase_User]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[PvtPhrase] DROP CONSTRAINT FK_PvtPhrase_User
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Schedule_User]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT FK_Schedule_User
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SendHistBackup_User]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SendHistBackup] DROP CONSTRAINT FK_SendHistBackup_User
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SendHistory_User]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SendHistory] DROP CONSTRAINT FK_SendHistory_User
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SendTable]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[SendTable]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Configuration]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Configuration]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ContactGroups]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ContactGroups]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Contacts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Contacts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Department]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EmailNotify]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EmailNotify]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EventSubscribe]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EventSubscribe]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HotWords]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HotWords]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MRUMobile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MRUMobile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PvtPhrase]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PvtPhrase]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Schedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Schedule]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SendHistBackup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SendHistBackup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SendHistory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SendHistory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SysPhrase]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SysPhrase]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Users]
GO

CREATE TABLE [dbo].[Configuration] (
	[CFGName] [char] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Value] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ContactGroups] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Description] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Contacts] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[MobileNumber] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[GroupID] [int] NULL ,
	[UserID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Department] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Description] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EmailNotify] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[Ruler] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EventSubscribe] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[Subscription] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HotWords] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Word] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MRUMobile] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[MobileNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LastTime] [datetime] NOT NULL ,
	[Times] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PvtPhrase] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Phrase] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[UserID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Schedule] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[Title] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Schedule] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[NextTime] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SendHistBackup] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[IPAddr] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SendTime] [datetime] NOT NULL ,
	[Message] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[RecName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[RecMobileNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsIncludeHotWord] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SendHistory] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[IPAddr] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SendTime] [datetime] NOT NULL ,
	[Message] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[RecName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[RecMobileNumber] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsIncludeHotWord] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SysPhrase] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Phrase] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Users] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[LogonName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[Password] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[IPAddr] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[MobileNumber] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[DeptID] [int] NULL ,
	[Permission] [int] NULL ,
	[IsInGL] [bit] NULL ,
	[IsUseSysPhrase] [bit] NULL ,
	[Email] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[EmailRulerType] [bit] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ContactGroups] WITH NOCHECK ADD 
	CONSTRAINT [PK_ContactGroups] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Contacts] WITH NOCHECK ADD 
	CONSTRAINT [PK_Contacts] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Department] WITH NOCHECK ADD 
	CONSTRAINT [PK_Department] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EmailNotify] WITH NOCHECK ADD 
	CONSTRAINT [PK_EmailNotify] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EventSubscribe] WITH NOCHECK ADD 
	CONSTRAINT [PK_EventSubscribe] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[HotWords] WITH NOCHECK ADD 
	CONSTRAINT [PK_HotWords] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MRUMobile] WITH NOCHECK ADD 
	CONSTRAINT [PK_MRUMobile] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PvtPhrase] WITH NOCHECK ADD 
	CONSTRAINT [PK_PvtPhrase] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Schedule] WITH NOCHECK ADD 
	CONSTRAINT [PK_Schedule] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SendHistBackup] WITH NOCHECK ADD 
	CONSTRAINT [PK_SendHistBackup] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SendHistory] WITH NOCHECK ADD 
	CONSTRAINT [PK_SendHistory] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SysPhrase] WITH NOCHECK ADD 
	CONSTRAINT [PK_SysPhrase] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Users] WITH NOCHECK ADD 
	CONSTRAINT [PK_User] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MRUMobile] WITH NOCHECK ADD 
	CONSTRAINT [DF_MRUMobile_LastTime] DEFAULT (getdate()) FOR [LastTime],
	CONSTRAINT [DF_MRUMobile_Times] DEFAULT (1) FOR [Times]
GO

ALTER TABLE [dbo].[SendHistBackup] WITH NOCHECK ADD 
	CONSTRAINT [DF_SendHistBackup_SendTime] DEFAULT (getdate()) FOR [SendTime]
GO

ALTER TABLE [dbo].[SendHistory] WITH NOCHECK ADD 
	CONSTRAINT [DF_SendHistory_SendTime] DEFAULT (getdate()) FOR [SendTime]
GO

ALTER TABLE [dbo].[Users] WITH NOCHECK ADD 
	CONSTRAINT [DF_Users_EmailRulerType] DEFAULT (0) FOR [EmailRulerType]
GO

ALTER TABLE [dbo].[ContactGroups] ADD 
	CONSTRAINT [FK_ContactGroups_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [dbo].[Users] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Contacts] ADD 
	CONSTRAINT [FK_Contacts_ContactGroups] FOREIGN KEY 
	(
		[GroupID]
	) REFERENCES [dbo].[ContactGroups] (
		[ID]
	),
	CONSTRAINT [FK_Contacts_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [dbo].[Users] (
		[ID]
	)
GO

ALTER TABLE [dbo].[EmailNotify] ADD 
	CONSTRAINT [FK_EmailNotify_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [dbo].[Users] (
		[ID]
	)
GO

ALTER TABLE [dbo].[EventSubscribe] ADD 
	CONSTRAINT [FK_EventSubscribe_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [dbo].[Users] (
		[ID]
	)
GO

ALTER TABLE [dbo].[PvtPhrase] ADD 
	CONSTRAINT [FK_PvtPhrase_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [dbo].[Users] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Schedule] ADD 
	CONSTRAINT [FK_Schedule_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [dbo].[Users] (
		[ID]
	)
GO

ALTER TABLE [dbo].[SendHistBackup] ADD 
	CONSTRAINT [FK_SendHistBackup_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [dbo].[Users] (
		[ID]
	)
GO

ALTER TABLE [dbo].[SendHistory] ADD 
	CONSTRAINT [FK_SendHistory_User] FOREIGN KEY 
	(
		[UserID]
	) REFERENCES [dbo].[Users] (
		[ID]
	)
GO

ALTER TABLE [dbo].[Users] ADD 
	CONSTRAINT [FK_User_Department] FOREIGN KEY 
	(
		[DeptID]
	) REFERENCES [dbo].[Department] (
		[ID]
	)
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.SendTable
AS
SELECT *
FROM dbo.SendHistory
UNION
SELECT *
FROM dbo.SendHistBackup


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

