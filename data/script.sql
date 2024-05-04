USE [Warehouse]
GO
/****** Object:  Table [dbo].[Admin_Account]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Admin_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classify]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classify](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_Classify] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[PhoneNumber] [varchar](50) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[SalePoint] [float] NULL,
	[PurchaseCount] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[DateTime] [datetime] NULL,
	[CompanyId] [int] NULL,
	[TotalValueOrders] [float] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Role] [nvarchar](64) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Personnal_Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Origin] [nvarchar](255) NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ClassifyId] [int] NOT NULL,
	[ProducerId] [int] NOT NULL,
	[Size] [nvarchar](max) NULL,
	[Material] [nvarchar](max) NULL,
	[ConnectionTypes] [nvarchar](max) NULL,
	[Color] [nvarchar](max) NULL,
	[Designs] [nvarchar](max) NULL,
	[Describe] [nvarchar](max) NULL,
	[DateTime] [datetime] NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse_Export]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse_Export](
	[Code] [varchar](255) NOT NULL,
	[TotalProduct] [int] NULL,
	[DateTime] [datetime] NULL,
	[TotalValue] [float] NULL,
	[CompanyId] [int] NULL,
	[WarehouseId] [int] NULL,
 CONSTRAINT [PK_Warehouse_Export] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse_Import]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse_Import](
	[Code] [varchar](255) NOT NULL,
	[TotalProduct] [int] NULL,
	[DateTime] [datetime] NULL,
	[CompanyId] [int] NULL,
	[WarehouseId] [int] NULL,
 CONSTRAINT [PK_Warehouse_Import] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse_Info]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse_Info](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Nation] [nvarchar](50) NULL,
	[Area] [nvarchar](255) NULL,
	[StaffId] [int] NULL,
	[Address] [nvarchar](255) NULL,
	[CompanyId] [int] NOT NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_Warehouse_Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WH_Data]    Script Date: 03/05/2024 23:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WH_Data](
	[IdWarehouse] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[CodeProduct] [varchar](255) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Admin_Account]
GO
ALTER TABLE [dbo].[Classify]  WITH CHECK ADD  CONSTRAINT [FK_Classify_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Classify] CHECK CONSTRAINT [FK_Classify_Admin_Account]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Admin_Account]
GO
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD  CONSTRAINT [FK_Personnel_Info_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [FK_Personnel_Info_Admin_Account]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Admin_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Admin_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Classify] FOREIGN KEY([ClassifyId])
REFERENCES [dbo].[Classify] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Classify]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Warehouse_Export]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Export_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Warehouse_Export] CHECK CONSTRAINT [FK_Warehouse_Export_Admin_Account]
GO
ALTER TABLE [dbo].[Warehouse_Export]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Export_Warehouse_Info] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse_Info] ([Id])
GO
ALTER TABLE [dbo].[Warehouse_Export] CHECK CONSTRAINT [FK_Warehouse_Export_Warehouse_Info]
GO
ALTER TABLE [dbo].[Warehouse_Import]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Import_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Warehouse_Import] CHECK CONSTRAINT [FK_Warehouse_Import_Admin_Account]
GO
ALTER TABLE [dbo].[Warehouse_Import]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Import_Warehouse_Info] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse_Info] ([Id])
GO
ALTER TABLE [dbo].[Warehouse_Import] CHECK CONSTRAINT [FK_Warehouse_Import_Warehouse_Info]
GO
ALTER TABLE [dbo].[Warehouse_Info]  WITH CHECK ADD  CONSTRAINT [FK_companyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[Warehouse_Info] CHECK CONSTRAINT [FK_companyId]
GO
ALTER TABLE [dbo].[Warehouse_Info]  WITH CHECK ADD  CONSTRAINT [FK_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Personnel] ([Id])
GO
ALTER TABLE [dbo].[Warehouse_Info] CHECK CONSTRAINT [FK_StaffId]
GO
ALTER TABLE [dbo].[WH_Data]  WITH CHECK ADD  CONSTRAINT [FK_WH_Data_Admin_Account] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Admin_Account] ([Id])
GO
ALTER TABLE [dbo].[WH_Data] CHECK CONSTRAINT [FK_WH_Data_Admin_Account]
GO
ALTER TABLE [dbo].[WH_Data]  WITH CHECK ADD  CONSTRAINT [FK_WH_Data_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[WH_Data] CHECK CONSTRAINT [FK_WH_Data_Product]
GO
ALTER TABLE [dbo].[WH_Data]  WITH CHECK ADD  CONSTRAINT [FK_WH_Data_Warehouse_Info] FOREIGN KEY([IdWarehouse])
REFERENCES [dbo].[Warehouse_Info] ([Id])
GO
ALTER TABLE [dbo].[WH_Data] CHECK CONSTRAINT [FK_WH_Data_Warehouse_Info]
GO
