USE [master]
GO
/****** Object:  Database [wholesale]    Script Date: 07.12.2021 10:53:55 ******/
CREATE DATABASE [wholesale]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wholesale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\wholesale.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'wholesale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\wholesale_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [wholesale] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wholesale].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wholesale] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wholesale] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wholesale] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wholesale] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wholesale] SET ARITHABORT OFF 
GO
ALTER DATABASE [wholesale] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wholesale] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wholesale] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wholesale] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wholesale] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wholesale] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wholesale] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wholesale] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wholesale] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wholesale] SET  DISABLE_BROKER 
GO
ALTER DATABASE [wholesale] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wholesale] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wholesale] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wholesale] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wholesale] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wholesale] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wholesale] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wholesale] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [wholesale] SET  MULTI_USER 
GO
ALTER DATABASE [wholesale] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wholesale] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wholesale] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wholesale] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [wholesale] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [wholesale] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [wholesale] SET QUERY_STORE = OFF
GO
USE [wholesale]
GO
/****** Object:  Table [dbo].[Athletes]    Script Date: 07.12.2021 10:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Athletes](
	[id_Athletes] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NULL,
	[age] [int] NULL,
 CONSTRAINT [PK_Athletes] PRIMARY KEY CLUSTERED 
(
	[id_Athletes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitOfMea]    Script Date: 07.12.2021 10:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitOfMea](
	[id_unit] [int] IDENTITY(1,1) NOT NULL,
	[unit] [nvarchar](50) NULL,
 CONSTRAINT [PK_UnitOfMea] PRIMARY KEY CLUSTERED 
(
	[id_unit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sport]    Script Date: 07.12.2021 10:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sport](
	[id_sport] [int] IDENTITY(1,1) NOT NULL,
	[record_date] [date] NOT NULL,
	[world_rec] [float] NULL,
	[Sport_name] [nvarchar](50) NULL,
	[fk_unit] [int] NULL,
	[fk_Athletes] [int] NULL,
 CONSTRAINT [PK_Sport] PRIMARY KEY CLUSTERED 
(
	[id_sport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VieWWhole]    Script Date: 07.12.2021 10:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VieWWhole]
AS
SELECT        dbo.Athletes.FIO, dbo.Athletes.age, dbo.Sport.record_date, dbo.Sport.world_rec, dbo.Sport.Sport_name, dbo.UnitOfMea.unit, dbo.Athletes.id_Athletes
FROM            dbo.UnitOfMea INNER JOIN
                         dbo.Sport ON dbo.UnitOfMea.id_unit = dbo.Sport.fk_unit INNER JOIN
                         dbo.Athletes ON dbo.Sport.fk_Athletes = dbo.Athletes.id_Athletes
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 07.12.2021 10:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[id_Athletes] [int] NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sport]  WITH CHECK ADD  CONSTRAINT [FK_Sport_Athletes] FOREIGN KEY([fk_Athletes])
REFERENCES [dbo].[Athletes] ([id_Athletes])
GO
ALTER TABLE [dbo].[Sport] CHECK CONSTRAINT [FK_Sport_Athletes]
GO
ALTER TABLE [dbo].[Sport]  WITH CHECK ADD  CONSTRAINT [FK_Sport_UnitOfMea] FOREIGN KEY([fk_unit])
REFERENCES [dbo].[UnitOfMea] ([id_unit])
GO
ALTER TABLE [dbo].[Sport] CHECK CONSTRAINT [FK_Sport_UnitOfMea]
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD  CONSTRAINT [FK_USERS_Athletes] FOREIGN KEY([id_Athletes])
REFERENCES [dbo].[Athletes] ([id_Athletes])
GO
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [FK_USERS_Athletes]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UnitOfMea"
            Begin Extent = 
               Top = 86
               Left = 640
               Bottom = 182
               Right = 810
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sport"
            Begin Extent = 
               Top = 66
               Left = 326
               Bottom = 196
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Athletes"
            Begin Extent = 
               Top = 127
               Left = 53
               Bottom = 240
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VieWWhole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VieWWhole'
GO
USE [master]
GO
ALTER DATABASE [wholesale] SET  READ_WRITE 
GO
