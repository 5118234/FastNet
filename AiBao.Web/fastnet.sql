USE [master]
GO
/****** Object:  Database [FastNet]    Script Date: 2019/4/2 17:32:34 ******/
CREATE DATABASE [FastNet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FastNet', FILENAME = N'D:\Database\FastNet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FastNet_log', FILENAME = N'D:\Database\FastNet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FastNet] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FastNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FastNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FastNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FastNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FastNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FastNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [FastNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FastNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FastNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FastNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FastNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FastNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FastNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FastNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FastNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FastNet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FastNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FastNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FastNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FastNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FastNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FastNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FastNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FastNet] SET RECOVERY FULL 
GO
ALTER DATABASE [FastNet] SET  MULTI_USER 
GO
ALTER DATABASE [FastNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FastNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FastNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FastNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FastNet] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FastNet', N'ON'
GO
ALTER DATABASE [FastNet] SET QUERY_STORE = OFF
GO
USE [FastNet]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FastNet]
GO
/****** Object:  Table [dbo].[Bucket]    Script Date: 2019/4/2 17:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bucket](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[IsCompress] [bit] NOT NULL,
 CONSTRAINT [PK_Bucket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BucketCut]    Script Date: 2019/4/2 17:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BucketCut](
	[Id] [uniqueidentifier] NOT NULL,
	[BucketId] [uniqueidentifier] NOT NULL,
	[Value] [nvarchar](150) NOT NULL,
	[Creator] [uniqueidentifier] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_BucketCut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BucketImage]    Script Date: 2019/4/2 17:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BucketImage](
	[Id] [uniqueidentifier] NOT NULL,
	[BucketId] [uniqueidentifier] NOT NULL,
	[FileName] [nvarchar](150) NOT NULL,
	[VisitUrl] [nvarchar](256) NOT NULL,
	[IOPath] [nvarchar](500) NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[SHA1] [nvarchar](256) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[ExtName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_BucketImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_ActivityLog]    Script Date: 2019/4/2 17:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_ActivityLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Method] [nvarchar](50) NULL,
	[EntityName] [nvarchar](100) NULL,
	[PrimaryKey] [nvarchar](64) NULL,
	[CreationTime] [datetime] NOT NULL,
	[Creator] [uniqueidentifier] NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[Comment] [nvarchar](150) NULL,
 CONSTRAINT [PK_Sys_ActivityLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_ActivityLogComment]    Script Date: 2019/4/2 17:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_ActivityLogComment](
	[EntityName] [nvarchar](100) NOT NULL,
	[Comment] [nvarchar](150) NULL,
 CONSTRAINT [PK_Sys_ActivityLogComment] PRIMARY KEY CLUSTERED 
(
	[EntityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Category]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Category](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsMenu] [char](1) NOT NULL,
	[UID] [nvarchar](128) NOT NULL,
	[Code] [nvarchar](128) NULL,
	[FatherCode] [nvarchar](128) NULL,
	[RouteTemplate] [nvarchar](128) NULL,
	[RouteName] [nvarchar](128) NULL,
	[IconClass] [nvarchar](50) NULL,
	[Sort] [int] NOT NULL,
	[Target] [nvarchar](2) NULL,
	[Controller] [nvarchar](128) NULL,
	[Action] [nvarchar](128) NULL,
 CONSTRAINT [PK_Sys_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Sys_Category] UNIQUE NONCLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_NLog]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_NLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](50) NOT NULL,
	[Logged] [datetime] NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Logger] [nvarchar](max) NULL,
	[Callsite] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_NLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Permission]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Permission](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Sys_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Role]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Creator] [uniqueidentifier] NULL,
	[CreationTime] [datetime] NOT NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Sys_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Setting]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Setting](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Value] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_Sys_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_User]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_User](
	[Id] [uniqueidentifier] NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Password] [nvarchar](512) NULL,
	[Salt] [nvarchar](256) NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[LastIpAddress] [nvarchar](50) NULL,
	[LastActivityTime] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NULL,
	[Creator] [uniqueidentifier] NULL,
	[Email] [nvarchar](256) NULL,
	[MobilePhone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sys_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_UserJwt]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserJwt](
	[Jti] [nvarchar](64) NOT NULL,
	[RefreshToken] [nvarchar](64) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Expiration] [datetime] NOT NULL,
	[Platform] [int] NOT NULL,
 CONSTRAINT [PK_SysUserJWTToken] PRIMARY KEY CLUSTERED 
(
	[Jti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_UserLogin]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserLogin](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IpAddress] [nvarchar](50) NULL,
	[LoginTime] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Sys_UserLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_UserR]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserR](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[R] [nvarchar](64) NOT NULL,
	[Platform] [int] NOT NULL,
 CONSTRAINT [PK_Sys_UserR] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_UserRole]    Script Date: 2019/4/2 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserRole](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Sys_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BucketImage_SHA1]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_BucketImage_SHA1] ON [dbo].[BucketImage]
(
	[SHA1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BucketImage_VisitUrl]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_BucketImage_VisitUrl] ON [dbo].[BucketImage]
(
	[VisitUrl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_ActivityLog_CreationTime]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_ActivityLog_CreationTime] ON [dbo].[Sys_ActivityLog]
(
	[CreationTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sys_Setting_Name]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_Setting_Name] ON [dbo].[Sys_Setting]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sys_User_Account]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_User_Account] ON [dbo].[Sys_User]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_User_CreationTime]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_User_CreationTime] ON [dbo].[Sys_User]
(
	[CreationTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sys_User_Name]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_User_Name] ON [dbo].[Sys_User]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_UserJwt_Expiration]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_UserJwt_Expiration] ON [dbo].[Sys_UserJwt]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sys_UserLogin_LoginTime]    Script Date: 2019/4/2 17:32:35 ******/
CREATE NONCLUSTERED INDEX [IX_Sys_UserLogin_LoginTime] ON [dbo].[Sys_UserLogin]
(
	[LoginTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

INSERT [dbo].[Sys_User] ([Id], [Account], [Name], [Password], [Salt], [IsAdmin], [CreationTime], [LastIpAddress], [LastActivityTime], [IsDeleted], [DeletedTime], [Creator], [Email], [MobilePhone]) VALUES (N'c0a217f3-06ba-4784-95c3-aa170fd5ac78', N'admin', N'无名', N'552beee29b889340971260696c17877c', N'W3b5VElyh3qX3U07GYaDH/ZpkAqzKNvjBNGoZdgtPFc=', 1, CAST(N'2019-03-21T15:23:18.150' AS DateTime), N'127.0.0.1', NULL, 0, NULL, NULL, NULL, N'13812345671')
GO
ALTER TABLE [dbo].[Sys_Category] ADD  CONSTRAINT [DF_Sys_Category_Order_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Sys_User] ADD  CONSTRAINT [DF_Sys_User_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Sys_User] ADD  CONSTRAINT [DF_Sys_User_CreationTime]  DEFAULT (getdate()) FOR [CreationTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'w_xx,h_xx配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BucketCut', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片剪彩配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BucketCut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片存储' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BucketImage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日志记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ActivityLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志表务业说明表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_ActivityLogComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_NLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_Role', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登陆jwttoken' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserJwt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆随机数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserR'
GO
USE [master]
GO
ALTER DATABASE [FastNet] SET  READ_WRITE 
GO
