USE [master]
GO
/****** Object:  Database [LibraryOnline]    Script Date: 14/07/2020 4:30:31 PM ******/
CREATE DATABASE [LibraryOnline]
GO
ALTER DATABASE [LibraryOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryOnline] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryOnline] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryOnline', N'ON'
GO
ALTER DATABASE [LibraryOnline] SET QUERY_STORE = OFF
GO
USE [LibraryOnline]
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 14/07/2020 4:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBook](
	[bookID] [varchar](50) NOT NULL,
	[bookName] [varchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[description] [varchar](250) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblBook] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 14/07/2020 4:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderID] [varchar](50) NOT NULL,
	[bookID] [varchar](50) NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 14/07/2020 4:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[getDate] [date] NULL,
	[returnDate] [date] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 14/07/2020 4:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[phoneNumber] [varchar](50) NULL,
	[roleID] [varchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBook] ([bookID], [bookName], [price], [quantity], [description], [status]) VALUES (N'A10', N'avasa', 10000, 1003, N'bbbb', 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [price], [quantity], [description], [status]) VALUES (N'A1001', N'sach cu', 10000, 100, N'asada', NULL)
INSERT [dbo].[tblBook] ([bookID], [bookName], [price], [quantity], [description], [status]) VALUES (N'A11', N'aaaa', 10000, 11, N'0aa', 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [price], [quantity], [description], [status]) VALUES (N'A55', N'demo45', 45000, 100, N'asdasd', NULL)
INSERT [dbo].[tblBook] ([bookID], [bookName], [price], [quantity], [description], [status]) VALUES (N'A88', N'sach moia', 13000, 22, N'sadasd', NULL)
INSERT [dbo].[tblOrders] ([orderID], [userID], [getDate], [returnDate], [total]) VALUES (N'119297', N'user1', CAST(N'2020-07-14' AS Date), CAST(N'2020-07-21' AS Date), 55000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [getDate], [returnDate], [total]) VALUES (N'310930', N'user1', CAST(N'2020-07-14' AS Date), CAST(N'2020-07-21' AS Date), 58000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [getDate], [returnDate], [total]) VALUES (N'365781', N'user1', CAST(N'2020-07-14' AS Date), CAST(N'2020-07-21' AS Date), 13000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [getDate], [returnDate], [total]) VALUES (N'443332', N'user1', CAST(N'2020-07-14' AS Date), CAST(N'2020-07-21' AS Date), 26000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [getDate], [returnDate], [total]) VALUES (N'639035', N'user1', CAST(N'2020-07-14' AS Date), CAST(N'2020-07-21' AS Date), 10000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [getDate], [returnDate], [total]) VALUES (N'829787', N'user1', CAST(N'2020-07-14' AS Date), CAST(N'2020-07-21' AS Date), 58000)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phoneNumber], [roleID]) VALUES (N'admin', N'Nguyen Admin', N'1', N'0123456789', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phoneNumber], [roleID]) VALUES (N'user1', N'Pham A', N'1', N'0132456789', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phoneNumber], [roleID]) VALUES (N'user2', N'Tran C', N'1', N'0321456987', N'US')
USE [master]
GO
ALTER DATABASE [LibraryOnline] SET  READ_WRITE 
GO
