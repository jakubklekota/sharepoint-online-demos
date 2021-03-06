USE [master]
GO
/****** Object:  Database [UsersInLocation]    Script Date: 04/22/20 07:34:50 PM ******/
CREATE DATABASE [UsersInLocation]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UsersInLocation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UsersInLocation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UsersInLocation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UsersInLocation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UsersInLocation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UsersInLocation] SET ARITHABORT OFF 
GO
ALTER DATABASE [UsersInLocation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UsersInLocation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UsersInLocation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UsersInLocation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UsersInLocation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UsersInLocation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UsersInLocation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UsersInLocation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UsersInLocation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UsersInLocation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UsersInLocation] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [UsersInLocation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UsersInLocation] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UsersInLocation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UsersInLocation] SET  MULTI_USER 
GO
ALTER DATABASE [UsersInLocation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UsersInLocation] SET ENCRYPTION ON
GO
ALTER DATABASE [UsersInLocation] SET QUERY_STORE = ON
GO
ALTER DATABASE [UsersInLocation] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [UsersInLocation]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DW_COMPATIBILITY_LEVEL = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET EXEC_QUERY_STATS_FOR_SCALAR_FUNCTIONS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PAUSED_RESUMABLE_INDEX_ABORT_DURATION_MINUTES = 1440;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [UsersInLocation]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 04/22/20 07:34:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOnUtc] [datetime2](7) NOT NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/22/20 07:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](1000) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOnUtc] [datetime2](7) NOT NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLocation_Relation]    Script Date: 04/22/20 07:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLocation_Relation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUser] [bigint] NOT NULL,
	[IdLocation] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOnUtc] [datetime2](7) NOT NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
 CONSTRAINT [PK_UserLocation_Relation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Afghanistan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Albania', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Algeria', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'American Samoa', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Andorra', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Angola', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Anguilla UPDATE 2', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), CAST(N'2020-04-21T20:25:27.4500241' AS DateTime2))
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Antarctica', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, N'Antigua And Barbuda', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Argentina', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Armenia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (12, N'Aruba', 0, 1, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), CAST(N'2020-04-21T20:16:10.7357409' AS DateTime2))
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (13, N'Australia', 0, 1, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), CAST(N'2020-04-21T20:19:31.9408779' AS DateTime2))
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (14, N'Austria', 0, 1, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), CAST(N'2020-04-21T20:20:19.4546542' AS DateTime2))
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (15, N'Azerbaijan', 0, 1, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), CAST(N'2020-04-21T20:20:26.2931189' AS DateTime2))
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (16, N'Bahamas The', 0, 1, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), CAST(N'2020-04-21T20:20:31.9758433' AS DateTime2))
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (17, N'Bahrain', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (18, N'Bangladesh', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (19, N'Barbados', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (20, N'Belarus', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (21, N'Belgium', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (22, N'Belize', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (23, N'Benin', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (24, N'Bermuda', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (25, N'Bhutan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (26, N'Bolivia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (27, N'Bosnia and Herzegovina', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (28, N'Botswana', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (29, N'Bouvet Island', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (30, N'Brazil', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (31, N'British Indian Ocean Territory', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (32, N'Brunei', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (33, N'Bulgaria', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (34, N'Burkina Faso', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (35, N'Burundi', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (36, N'Cambodia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (37, N'Cameroon', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (38, N'Canada', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (39, N'Cape Verde', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (40, N'Cayman Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (41, N'Central African Republic', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (42, N'Chad', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (43, N'Chile', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (44, N'China', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (45, N'Christmas Island', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (46, N'Cocos (Keeling) Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (47, N'Colombia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (48, N'Comoros', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (49, N'Republic Of The Congo', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (50, N'Democratic Republic Of The Congo', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (51, N'Cook Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (52, N'Costa Rica', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (53, N'Cote D''Ivoire (Ivory Coast)', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (54, N'Croatia (Hrvatska)', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (55, N'Cuba', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (56, N'Cyprus', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (57, N'Czech Republic', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (58, N'Denmark', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (59, N'Djibouti', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (60, N'Dominica', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (61, N'Dominican Republic', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (62, N'East Timor', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (63, N'Ecuador', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (64, N'Egypt', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (65, N'El Salvador', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (66, N'Equatorial Guinea', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (67, N'Eritrea', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (68, N'Estonia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (69, N'Ethiopia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (70, N'External Territories of Australia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (71, N'Falkland Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (72, N'Faroe Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (73, N'Fiji Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (74, N'Finland', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (75, N'France', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (76, N'French Guiana', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (77, N'French Polynesia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (78, N'French Southern Territories', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (79, N'Gabon', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (80, N'Gambia The', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (81, N'Georgia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (82, N'Germany', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (83, N'Ghana', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (84, N'Gibraltar', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (85, N'Greece', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (86, N'Greenland', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (87, N'Grenada', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (88, N'Guadeloupe', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (89, N'Guam', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (90, N'Guatemala', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (91, N'Guernsey and Alderney', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (92, N'Guinea', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (93, N'Guinea-Bissau', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (94, N'Guyana', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (95, N'Haiti', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (96, N'Heard and McDonald Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (97, N'Honduras', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (98, N'Hong Kong S.A.R.', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (99, N'Hungary', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
GO
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (100, N'Iceland', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (101, N'India', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (102, N'Indonesia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (103, N'Iran', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (104, N'Iraq', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (105, N'Ireland', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (106, N'Israel', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (107, N'Italy', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (108, N'Jamaica', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (109, N'Japan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (110, N'Jersey', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (111, N'Jordan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (112, N'Kazakhstan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (113, N'Kenya', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (114, N'Kiribati', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (115, N'Korea North', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (116, N'Korea South', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (117, N'Kuwait', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (118, N'Kyrgyzstan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (119, N'Laos', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (120, N'Latvia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (121, N'Lebanon', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (122, N'Lesotho', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (123, N'Liberia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (124, N'Libya', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (125, N'Liechtenstein', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (126, N'Lithuania', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (127, N'Luxembourg', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (128, N'Macau S.A.R.', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (129, N'Macedonia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (130, N'Madagascar', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (131, N'Malawi', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (132, N'Malaysia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (133, N'Maldives', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (134, N'Mali', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (135, N'Malta', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (136, N'Man (Isle of)', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (137, N'Marshall Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (138, N'Martinique', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (139, N'Mauritania', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (140, N'Mauritius', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (141, N'Mayotte', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (142, N'Mexico', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (143, N'Micronesia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (144, N'Moldova', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (145, N'Monaco', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (146, N'Mongolia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (147, N'Montserrat', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (148, N'Morocco', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (149, N'Mozambique', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (150, N'Myanmar', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (151, N'Namibia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (152, N'Nauru', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (153, N'Nepal', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (154, N'Netherlands Antilles', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (155, N'Netherlands The', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (156, N'New Caledonia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (157, N'New Zealand', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (158, N'Nicaragua', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (159, N'Niger', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (160, N'Nigeria', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (161, N'Niue', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (162, N'Norfolk Island', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (163, N'Northern Mariana Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (164, N'Norway', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (165, N'Oman', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (166, N'Pakistan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (167, N'Palau', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (168, N'Palestinian Territory Occupied', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (169, N'Panama', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (170, N'Papua new Guinea', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (171, N'Paraguay', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (172, N'Peru', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (173, N'Philippines', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (174, N'Pitcairn Island', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (175, N'Poland', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (176, N'Portugal', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (177, N'Puerto Rico', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (178, N'Qatar', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (179, N'Reunion', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (180, N'Romania', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (181, N'Russia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (182, N'Rwanda', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (183, N'Saint Helena', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (184, N'Saint Kitts And Nevis', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (185, N'Saint Lucia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (186, N'Saint Pierre and Miquelon', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (187, N'Saint Vincent And The Grenadines', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (188, N'Samoa', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (189, N'San Marino', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (190, N'Sao Tome and Principe', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (191, N'Saudi Arabia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (192, N'Senegal', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (193, N'Serbia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (194, N'Seychelles', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (195, N'Sierra Leone', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (196, N'Singapore', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (197, N'Slovakia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (198, N'Slovenia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (199, N'Smaller Territories of the UK', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
GO
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (200, N'Solomon Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (201, N'Somalia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (202, N'South Africa', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (203, N'South Georgia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (204, N'South Sudan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (205, N'Spain', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (206, N'Sri Lanka', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (207, N'Sudan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (208, N'Suriname', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (209, N'Svalbard And Jan Mayen Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (210, N'Swaziland', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (211, N'Sweden', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (212, N'Switzerland', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (213, N'Syria', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (214, N'Taiwan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (215, N'Tajikistan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (216, N'Tanzania', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (217, N'Thailand', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (218, N'Togo', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (219, N'Tokelau', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (220, N'Tonga', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (221, N'Trinidad And Tobago', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (222, N'Tunisia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (223, N'Turkey', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (224, N'Turkmenistan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (225, N'Turks And Caicos Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (226, N'Tuvalu', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (227, N'Uganda', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (228, N'Ukraine', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (229, N'United Arab Emirates', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (230, N'United Kingdom', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (231, N'United States', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (232, N'United States Minor Outlying Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (233, N'Uruguay', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (234, N'Uzbekistan', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (235, N'Vanuatu', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (236, N'Vatican City State (Holy See)', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (237, N'Venezuela', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (238, N'Vietnam', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (239, N'Virgin Islands (British)', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (240, N'Virgin Islands (US)', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (241, N'Wallis And Futuna Islands', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (242, N'Western Sahara', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (243, N'Yemen', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (244, N'Yugoslavia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (245, N'Zambia', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (246, N'Zimbabwe', 1, 0, CAST(N'2020-04-19T11:18:44.3800000' AS DateTime2), NULL)
INSERT [dbo].[Location] ([Id], [Name], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (247, N'Gdynia', 1, 0, CAST(N'2020-04-21T19:49:15.1911897' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Natalie', N'Evan', N'(135) 465-8764', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Zoe', N'Santiago', N'(256) 822-0742', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Nova', N'Jonathan', N'(225) 000-1175', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Leah', N'Jaxon', N'(298) 373-5068', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Kuba', N'Klekota', N'+48 501 120 878', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), CAST(N'2020-04-22T16:40:55.3923936' AS DateTime2))
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Sadie', N'Angel', N'(300) 575-5742', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Aaliyah', N'Theodore', N'(142) 944-5753', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Ruby', N'Elijah', N'(166) 144-5120', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, N'Ivy', N'Nicholas', N'(263) 659-9490', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Mila', N'Xavier', N'(116) 620-7789', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Elena', N'Aiden', N'(136) 509-8960', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (12, N'Isla', N'Jacob', N'(293) 858-7130', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (13, N'Luna', N'Michael', N'(206) 330-1461', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (14, N'Valentina', N'Jacob', N'(208) 471-2652', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (15, N'Quinn', N'Everett', N'(124) 479-0888', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (16, N'Charlotte', N'Owen', N'(244) 242-2912', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (17, N'Elizabeth', N'Adrian', N'(243) 510-3793', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (18, N'Sophia', N'Lincoln', N'(197) 161-0171', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (19, N'Grace', N'Cooper', N'(157) 518-6411', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (20, N'Aurora', N'Jose', N'(103) 583-9032', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (21, N'Natalie', N'Jeremiah', N'(183) 011-9437', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (22, N'Everly', N'Everett', N'(269) 146-0195', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (23, N'Ruby', N'Daniel', N'(252) 743-8760', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (24, N'Brielle', N'Sebastian', N'(243) 568-4452', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (25, N'Julia', N'Ian', N'(168) 993-1325', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (26, N'Grace', N'John', N'(233) 683-4925', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (27, N'Natalie', N'Anthony', N'(101) 165-8425', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (28, N'Hailey', N'Jace', N'(290) 299-8930', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (29, N'Gabriella', N'Bryson', N'(150) 424-6471', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (30, N'Samantha', N'Greyson', N'(215) 952-1654', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (31, N'Eva', N'Leonardo', N'(208) 515-1627', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (32, N'Alice', N'Eli', N'(214) 539-8715', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (33, N'Kinsley', N'Dominic', N'(153) 208-8802', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (34, N'Gianna', N'Aaron', N'(255) 229-7015', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (35, N'Sarah', N'Leonardo', N'(295) 292-6101', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (36, N'Josephine', N'Jayden', N'(256) 090-3790', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (37, N'Brooklyn', N'Joshua', N'(196) 437-5698', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (38, N'Serenity', N'Connor', N'(288) 290-8168', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (39, N'Aria', N'Leo', N'(285) 188-3033', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (40, N'Lillian', N'Henry', N'(239) 155-9565', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (41, N'Josephine', N'Jayden', N'(149) 352-0075', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (42, N'Isabella', N'Anthony', N'(292) 487-6159', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (43, N'Abigail', N'Christian', N'(161) 851-6611', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (44, N'Valentina', N'Logan', N'(163) 542-9657', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (45, N'Sofia', N'Jacob', N'(164) 731-7832', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (46, N'Madison', N'Asher', N'(150) 012-9941', 0, 1, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), CAST(N'2020-04-22T16:42:32.6275193' AS DateTime2))
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (47, N'Willow', N'Dominic', N'(249) 589-2483', 0, 1, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), CAST(N'2020-04-22T16:42:39.4729512' AS DateTime2))
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (48, N'Madison', N'Miles', N'(151) 951-0275', 0, 1, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), CAST(N'2020-04-22T16:42:45.5261297' AS DateTime2))
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (49, N'Lillian', N'Joseph', N'(142) 947-9006', 0, 1, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), CAST(N'2020-04-22T16:42:46.1940741' AS DateTime2))
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (50, N'Kinsley', N'Carter', N'(291) 888-4628', 0, 1, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), CAST(N'2020-04-22T16:42:46.7905592' AS DateTime2))
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (51, N'Ella', N'Ryan', N'(239) 711-2522', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (52, N'Lily', N'Ezekiel', N'(304) 313-8296', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (53, N'Bella', N'Landon', N'(275) 522-6957', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (54, N'Kaylee', N'Adam', N'(178) 804-9725', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (55, N'Alexa', N'Sawyer', N'(274) 913-0422', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (56, N'Anna', N'Daniel', N'(220) 319-8344', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (57, N'Ellie', N'Miles', N'(226) 681-0288', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (58, N'Ellie', N'Austin', N'(297) 374-1297', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (59, N'Kaylee', N'Aaron', N'(221) 982-7863', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (60, N'Violet', N'Jace', N'(149) 578-7548', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (61, N'Ella', N'Theodore', N'(124) 408-9813', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (62, N'Brooklyn', N'Owen', N'(144) 180-0466', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (63, N'Leah', N'Carter', N'(248) 051-7210', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (64, N'Skylar', N'Matthew', N'(100) 428-9683', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (65, N'Luna', N'Theodore', N'(240) 224-3384', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (66, N'Isla', N'Aiden', N'(268) 091-4818', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (67, N'Mia', N'Hudson', N'(159) 240-5528', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (68, N'Lucy', N'Santiago', N'(207) 467-0714', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (69, N'Kaylee', N'Sawyer', N'(230) 960-3145', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (70, N'Emily', N'Jacob', N'(128) 260-5325', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (71, N'Gabriella', N'Connor', N'(285) 095-9891', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (72, N'Ivy', N'Adam', N'(206) 207-0904', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (73, N'Adeline', N'Connor', N'(117) 962-0790', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (74, N'Samantha', N'Jayden', N'(196) 027-9891', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (75, N'Ava', N'Brayden', N'(192) 396-6021', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (76, N'Kennedy', N'Jason', N'(284) 927-9050', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (77, N'Ariana', N'Samuel', N'(312) 464-0020', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (78, N'Lillian', N'Parker', N'(199) 544-8715', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (79, N'Serenity', N'Oliver', N'(120) 852-5356', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (80, N'Ruby', N'Landon', N'(231) 025-0669', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (81, N'Gianna', N'Adrian', N'(158) 720-7555', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (82, N'Alice', N'Hunter', N'(119) 544-1966', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (83, N'Eliana', N'Elijah', N'(141) 387-0864', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (84, N'Violet', N'Adam', N'(142) 094-7535', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (85, N'Ruby', N'Kayden', N'(160) 556-5896', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (86, N'Piper', N'Joseph', N'(286) 033-5908', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (87, N'Amelia', N'Angel', N'(311) 240-6595', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (88, N'Olivia', N'Andrew', N'(218) 674-0568', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (89, N'Madison', N'Asher', N'(255) 253-5765', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (90, N'Aubrey', N'Austin', N'(237) 754-9347', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (91, N'Mila', N'Aiden', N'(266) 580-5120', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (92, N'Sophia', N'Bryson', N'(108) 158-2655', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (93, N'Lucy', N'Dylan', N'(252) 668-3897', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (94, N'Ivy', N'Elias', N'(175) 210-3904', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (95, N'Cora', N'Cooper', N'(229) 415-4305', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (96, N'Eleanor', N'Aiden', N'(184) 581-8252', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (97, N'Julia', N'Parker', N'(312) 137-2559', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (98, N'Harper', N'Ian', N'(147) 341-9060', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (99, N'Scarlett', N'Austin', N'(110) 037-5288', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
GO
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (100, N'Olivia', N'Hunter', N'(126) 160-7896', 1, 0, CAST(N'2020-04-19T11:54:42.8600000' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (101, N'Jakub', N'Klekota', N'+ 48 501 120 878', 1, 0, CAST(N'2020-04-20T20:09:33.5047561' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (102, N'Jakub', N'Klekota', N'+ 48 501 120 878', 1, 0, CAST(N'2020-04-20T21:52:04.2497751' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (103, N'Jakub', N'Klekota', N'+ 48 501 120 878', 1, 0, CAST(N'2020-04-22T16:01:39.3382487' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Phone], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (104, N'Kuba', N'Klekota', N'+ 48 501 120 878', 1, 0, CAST(N'2020-04-22T16:15:22.9867352' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserLocation_Relation] ON 

INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, 103, 175, 1, 0, CAST(N'2020-04-22T16:01:49.9674290' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, 100, 175, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, 99, 175, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, 98, 175, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, 97, 170, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, 95, 170, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, 94, 170, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, 93, 170, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, 92, 170, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
INSERT [dbo].[UserLocation_Relation] ([Id], [IdUser], [IdLocation], [IsActive], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, 91, 170, 1, 0, CAST(N'2020-04-22T16:15:32.1564430' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[UserLocation_Relation] OFF
/****** Object:  Index [IX_LocationName_Index]    Script Date: 04/22/20 07:34:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_LocationName_Index] ON [dbo].[Location]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserLastName]    Script Date: 04/22/20 07:34:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserLastName] ON [dbo].[User]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPhone]    Script Date: 04/22/20 07:34:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPhone] ON [dbo].[User]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLocation_Relation]  WITH CHECK ADD  CONSTRAINT [FK_UserLocation_Relation_Location] FOREIGN KEY([IdLocation])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[UserLocation_Relation] CHECK CONSTRAINT [FK_UserLocation_Relation_Location]
GO
ALTER TABLE [dbo].[UserLocation_Relation]  WITH CHECK ADD  CONSTRAINT [FK_UserLocation_Relation_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserLocation_Relation] CHECK CONSTRAINT [FK_UserLocation_Relation_User]
GO
USE [master]
GO
ALTER DATABASE [UsersInLocation] SET  READ_WRITE 
GO
