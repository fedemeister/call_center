USE [master]
GO
/****** Object:  Database [call_center_sqlserver1]    Script Date: 28/12/2019 20:17:57 ******/
CREATE DATABASE [call_center_sqlserver1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'call_center_sqlserver1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\call_center_sqlserver1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'call_center_sqlserver1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\call_center_sqlserver1_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [call_center_sqlserver1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [call_center_sqlserver1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [call_center_sqlserver1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET ARITHABORT OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [call_center_sqlserver1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [call_center_sqlserver1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [call_center_sqlserver1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [call_center_sqlserver1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET RECOVERY FULL 
GO
ALTER DATABASE [call_center_sqlserver1] SET  MULTI_USER 
GO
ALTER DATABASE [call_center_sqlserver1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [call_center_sqlserver1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [call_center_sqlserver1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [call_center_sqlserver1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [call_center_sqlserver1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'call_center_sqlserver1', N'ON'
GO
ALTER DATABASE [call_center_sqlserver1] SET QUERY_STORE = OFF
GO
USE [call_center_sqlserver1]
GO
/****** Object:  Table [dbo].[answer_a_call]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer_a_call](
	[call_id] [int] NOT NULL,
	[cli_id] [int] NOT NULL,
	[dept_id] [varchar](15) NOT NULL,
	[tele_id] [int] NOT NULL,
	[salary] [float] NOT NULL,
	[date] [int] NOT NULL,
	[call_satisfaction_grade] [int] NOT NULL,
	[call_response_time] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calls]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calls](
	[call_id] [int] NOT NULL,
	[call_satisfaction_grade] [int] NOT NULL,
	[call_response_time] [varchar](10) NOT NULL,
 CONSTRAINT [PK_calls] PRIMARY KEY CLUSTERED 
(
	[call_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[cli_id] [int] NOT NULL,
	[cli_PESEL] [bigint] NOT NULL,
	[cli_name] [varchar](60) NOT NULL,
	[cli_region] [varchar](25) NOT NULL,
	[cli_city] [varchar](25) NOT NULL,
	[cli_postal_code] [varchar](6) NOT NULL,
	[cli_street] [varchar](50) NOT NULL,
	[cli_contact_num] [varchar](16) NOT NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[date]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[date](
	[date_id] [int] NOT NULL,
	[quarter] [varchar](1) NOT NULL,
	[year] [smallint] NOT NULL,
	[month] [varchar](15) NOT NULL,
	[day] [date] NOT NULL,
 CONSTRAINT [PK_date] PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[dept_id] [varchar](15) NOT NULL,
	[dept_name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[having_a_ip]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[having_a_ip](
	[telephone_number] [varchar](16) NOT NULL,
	[cli_id] [int] NOT NULL,
	[i_id] [int] NOT NULL,
	[i_contract_date] [int] NOT NULL,
	[i_permanence_date] [int] NOT NULL,
	[i_price] [float] NOT NULL,
	[i_minutes] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[having_a_mp]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[having_a_mp](
	[telephone_number] [varchar](16) NOT NULL,
	[mb_id] [int] NOT NULL,
	[cli_id] [int] NOT NULL,
	[mb_contract_date] [int] NOT NULL,
	[mb_permanence_date] [int] NOT NULL,
	[mb_price] [float] NOT NULL,
	[mb_minutes] [varchar](10) NOT NULL,
	[mb_internet] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[internet_plans]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[internet_plans](
	[i_id] [int] NOT NULL,
	[i_name] [varchar](20) NOT NULL,
	[i_bandwitdh] [varchar](10) NOT NULL,
	[i_expiration_date] [int] NOT NULL,
	[i_launch_date] [int] NOT NULL,
 CONSTRAINT [PK_int_plans] PRIMARY KEY CLUSTERED 
(
	[i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mobile_plans]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobile_plans](
	[mb_id] [int] NOT NULL,
	[mb_name] [varchar](20) NOT NULL,
	[mb_expiration_date] [int] NOT NULL,
	[mb_launch_date] [int] NOT NULL,
 CONSTRAINT [PK_mobile_plans] PRIMARY KEY CLUSTERED 
(
	[mb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telephone_operator]    Script Date: 28/12/2019 20:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telephone_operator](
	[tele_id] [int] NOT NULL,
	[tele_PESEL] [bigint] NOT NULL,
	[tele_name] [varchar](60) NOT NULL,
	[tele_salary] [smallint] NOT NULL,
	[valid] [tinyint] NOT NULL,
 CONSTRAINT [PK_telephone_operator] PRIMARY KEY CLUSTERED 
(
	[tele_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_answer_a_call]    Script Date: 28/12/2019 20:17:57 ******/
CREATE NONCLUSTERED INDEX [IX_answer_a_call] ON [dbo].[answer_a_call]
(
	[call_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[answer_a_call]  WITH CHECK ADD  CONSTRAINT [FK_calls_answer_a_call] FOREIGN KEY([call_id])
REFERENCES [dbo].[calls] ([call_id])
GO
ALTER TABLE [dbo].[answer_a_call] CHECK CONSTRAINT [FK_calls_answer_a_call]
GO
ALTER TABLE [dbo].[answer_a_call]  WITH CHECK ADD  CONSTRAINT [FK_client_answer_a_call] FOREIGN KEY([cli_id])
REFERENCES [dbo].[client] ([cli_id])
GO
ALTER TABLE [dbo].[answer_a_call] CHECK CONSTRAINT [FK_client_answer_a_call]
GO
ALTER TABLE [dbo].[answer_a_call]  WITH CHECK ADD  CONSTRAINT [FK_date_answer_a_call] FOREIGN KEY([date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[answer_a_call] CHECK CONSTRAINT [FK_date_answer_a_call]
GO
ALTER TABLE [dbo].[answer_a_call]  WITH CHECK ADD  CONSTRAINT [FK_departments_answer_a_call] FOREIGN KEY([dept_id])
REFERENCES [dbo].[departments] ([dept_id])
GO
ALTER TABLE [dbo].[answer_a_call] CHECK CONSTRAINT [FK_departments_answer_a_call]
GO
ALTER TABLE [dbo].[answer_a_call]  WITH CHECK ADD  CONSTRAINT [FK_telephone_operator_answer_a_call] FOREIGN KEY([tele_id])
REFERENCES [dbo].[telephone_operator] ([tele_id])
GO
ALTER TABLE [dbo].[answer_a_call] CHECK CONSTRAINT [FK_telephone_operator_answer_a_call]
GO
ALTER TABLE [dbo].[having_a_ip]  WITH CHECK ADD  CONSTRAINT [FK_client_having_a_ip] FOREIGN KEY([cli_id])
REFERENCES [dbo].[client] ([cli_id])
GO
ALTER TABLE [dbo].[having_a_ip] CHECK CONSTRAINT [FK_client_having_a_ip]
GO
ALTER TABLE [dbo].[having_a_ip]  WITH CHECK ADD  CONSTRAINT [FK_date_id_i_contract_date] FOREIGN KEY([i_contract_date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[having_a_ip] CHECK CONSTRAINT [FK_date_id_i_contract_date]
GO
ALTER TABLE [dbo].[having_a_ip]  WITH CHECK ADD  CONSTRAINT [FK_date_id_i_permanence_date] FOREIGN KEY([i_permanence_date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[having_a_ip] CHECK CONSTRAINT [FK_date_id_i_permanence_date]
GO
ALTER TABLE [dbo].[having_a_ip]  WITH CHECK ADD  CONSTRAINT [FK_internet_plans_having_a_ip] FOREIGN KEY([i_id])
REFERENCES [dbo].[internet_plans] ([i_id])
GO
ALTER TABLE [dbo].[having_a_ip] CHECK CONSTRAINT [FK_internet_plans_having_a_ip]
GO
ALTER TABLE [dbo].[having_a_mp]  WITH CHECK ADD  CONSTRAINT [FK_client_having_a_mp] FOREIGN KEY([cli_id])
REFERENCES [dbo].[client] ([cli_id])
GO
ALTER TABLE [dbo].[having_a_mp] CHECK CONSTRAINT [FK_client_having_a_mp]
GO
ALTER TABLE [dbo].[having_a_mp]  WITH CHECK ADD  CONSTRAINT [FK_date_id_mb_contract_date] FOREIGN KEY([mb_contract_date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[having_a_mp] CHECK CONSTRAINT [FK_date_id_mb_contract_date]
GO
ALTER TABLE [dbo].[having_a_mp]  WITH CHECK ADD  CONSTRAINT [FK_date_id_mb_permanence_date] FOREIGN KEY([mb_permanence_date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[having_a_mp] CHECK CONSTRAINT [FK_date_id_mb_permanence_date]
GO
ALTER TABLE [dbo].[having_a_mp]  WITH CHECK ADD  CONSTRAINT [FK_mobile_plans_having_a_mp] FOREIGN KEY([mb_id])
REFERENCES [dbo].[mobile_plans] ([mb_id])
GO
ALTER TABLE [dbo].[having_a_mp] CHECK CONSTRAINT [FK_mobile_plans_having_a_mp]
GO
ALTER TABLE [dbo].[internet_plans]  WITH CHECK ADD  CONSTRAINT [FK_date_id_i_expiration_date] FOREIGN KEY([i_expiration_date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[internet_plans] CHECK CONSTRAINT [FK_date_id_i_expiration_date]
GO
ALTER TABLE [dbo].[internet_plans]  WITH CHECK ADD  CONSTRAINT [FK_date_id_i_launch_date] FOREIGN KEY([i_launch_date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[internet_plans] CHECK CONSTRAINT [FK_date_id_i_launch_date]
GO
ALTER TABLE [dbo].[mobile_plans]  WITH CHECK ADD  CONSTRAINT [FK_date_id_mb_expiration_date] FOREIGN KEY([mb_expiration_date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[mobile_plans] CHECK CONSTRAINT [FK_date_id_mb_expiration_date]
GO
ALTER TABLE [dbo].[mobile_plans]  WITH CHECK ADD  CONSTRAINT [FK_date_id_mb_launch_date] FOREIGN KEY([mb_launch_date])
REFERENCES [dbo].[date] ([date_id])
GO
ALTER TABLE [dbo].[mobile_plans] CHECK CONSTRAINT [FK_date_id_mb_launch_date]
GO
USE [master]
GO
ALTER DATABASE [call_center_sqlserver1] SET  READ_WRITE 
GO
