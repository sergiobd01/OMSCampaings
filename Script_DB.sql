USE [aespica]
GO
/****** Object:  User [turesBalon]    Script Date: 12/11/2018 10:18:14 p. m. ******/
CREATE USER [turesBalon] FOR LOGIN [turesBalon] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [turesBalon]
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 12/11/2018 10:18:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[idCampaign] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[idStateCampaign] [bigint] NOT NULL,
	[urlImage] [varchar](max) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[idProduct] [bigint] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[idUser] [bigint] NULL,
	[modificationDate] [datetime] NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[idCampaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/11/2018 10:18:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[idCategory] [bigint] IDENTITY(1,1) NOT NULL,
	[nameCategory] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 12/11/2018 10:18:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCard](
	[idCard] [bigint] IDENTITY(1,1) NOT NULL,
	[idCustomer] [bigint] NOT NULL,
	[numberCard] [bigint] NOT NULL,
	[cardType] [varchar](20) NOT NULL,
	[expirationMonth] [int] NOT NULL,
	[expirationYear] [int] NOT NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[idCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[idCustomer] [bigint] IDENTITY(1,1) NOT NULL,
	[idCategory] [bigint] NULL,
	[email] [varchar](max) NULL,
	[userName] [varchar](max) NOT NULL,
	[pass] [varchar](max) NOT NULL,
	[idCard] [bigint] NULL,
	[first_name] [nvarchar](60) NULL,
	[last_name] [nvarchar](60) NULL,
	[phone_number] [varchar](25) NULL,
	[address] [varchar](50) NULL,
	[country] [nvarchar](60) NULL,
	[numberDoc] [varchar](60) NULL,
	[TypeDoc] [varchar](20) NULL,
	[city] [nvarchar](60) NULL,
	[idUser] [bigint] NULL,
	[modificationDate] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entertainment]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainment](
	[idEntertainment] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [money] NULL,
	[name] [varchar](max) NULL,
 CONSTRAINT [PK_Entertainment] PRIMARY KEY CLUSTERED 
(
	[idEntertainment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[idHotel] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [money] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[reservationCode] [varchar](max) NULL,
	[checkInDate] [datetime] NULL,
	[checkOutDate] [datetime] NULL,
	[urlService] [varchar](max) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[idOrderProduct] [bigint] IDENTITY(1,1) NOT NULL,
	[idProduct] [bigint] NOT NULL,
	[idOrder] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct_1] PRIMARY KEY CLUSTERED 
(
	[idOrderProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[idOrder] [bigint] IDENTITY(1,1) NOT NULL,
	[idStateOrder] [bigint] NOT NULL,
	[amount] [money] NOT NULL,
	[idCustomer] [bigint] NOT NULL,
	[numberCard] [bigint] NOT NULL,
	[creationDate] [datetime] NOT NULL,
	[modificationDate] [datetime] NULL,
	[country] [nvarchar](60) NULL,
	[city] [nvarchar](60) NULL,
	[IdUser] [bigint] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[idProduct] [bigint] IDENTITY(1,1) NOT NULL,
	[idTransport] [bigint] NULL,
	[idEntertainment] [bigint] NULL,
	[idHotel] [bigint] NULL,
	[name] [varchar](max) NOT NULL,
	[urlImage] [varchar](max) NOT NULL,
	[price] [money] NOT NULL,
	[discountRate] [decimal](5, 2) NULL,
	[code] [varchar](50) NULL,
	[source_city] [bigint] NULL,
	[target_city] [bigint] NULL,
	[spectacle_date] [datetime] NULL,
	[arrival_date] [datetime] NULL,
	[departure_date] [datetime] NULL,
	[description] [varchar](max) NULL,
	[IdUser] [bigint] NULL,
	[modificationDate] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateCampaign]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateCampaign](
	[idStateCampaign] [bigint] IDENTITY(1,1) NOT NULL,
	[nameState] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Estado_Campa_01] PRIMARY KEY CLUSTERED 
(
	[idStateCampaign] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateOrder]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateOrder](
	[idStateOrder] [bigint] IDENTITY(1,1) NOT NULL,
	[nameState] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Estado_Orden] PRIMARY KEY CLUSTERED 
(
	[idStateOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transport](
	[idTransport] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [money] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[flightCode] [varchar](max) NOT NULL,
	[departureDate] [datetime] NOT NULL,
	[arrivalDate] [datetime] NOT NULL,
	[urlService] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Transport] PRIMARY KEY CLUSTERED 
(
	[idTransport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/11/2018 10:18:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[idUser] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](max) NULL,
	[userName] [varchar](max) NOT NULL,
	[pass] [varchar](max) NOT NULL,
	[first_name] [nvarchar](60) NULL,
	[last_name] [nvarchar](60) NULL,
	[Rol] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Campaign] ON 

INSERT [dbo].[Campaign] ([idCampaign], [name], [idStateCampaign], [urlImage], [description], [idProduct], [startDate], [endDate], [idUser], [modificationDate]) VALUES (1, N'Campaña de lanzamiento vuelo Madrid + Barcelona vs Real Madrid + Hotel 21 de octubre de 2018 - 400 USD', 1, N'C7', N'Incluye tiquetes en avión Bogotá - Madrid, Madrid Bogotá, Iberia, Hotel Madisson Madrid, inluye tickets de entrada', 1, CAST(N'2018-10-01T00:00:00.000' AS DateTime), CAST(N'2018-10-19T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Campaign] ([idCampaign], [name], [idStateCampaign], [urlImage], [description], [idProduct], [startDate], [endDate], [idUser], [modificationDate]) VALUES (2, N'Villarreal vs Valladolid', 1, N'C6', N'Incluye tiquetes en avión Bogotá - Liverpool, Liverpool - Bogotá, United Airlines, Hotel Union Squared Liverpool, inluye tickets de entrada', 10, CAST(N'2018-10-19T00:00:00.000' AS DateTime), CAST(N'2018-10-30T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Campaign] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([idCategory], [nameCategory]) VALUES (1, N'Platino')
INSERT [dbo].[Category] ([idCategory], [nameCategory]) VALUES (2, N'Dorado')
INSERT [dbo].[Category] ([idCategory], [nameCategory]) VALUES (3, N'Plateado')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CreditCard] ON 

INSERT [dbo].[CreditCard] ([idCard], [idCustomer], [numberCard], [cardType], [expirationMonth], [expirationYear]) VALUES (1, 4, 22222222222, N'Master', 3, 2026)
INSERT [dbo].[CreditCard] ([idCard], [idCustomer], [numberCard], [cardType], [expirationMonth], [expirationYear]) VALUES (2, 2, 22222222222, N'Master', 3, 2026)
INSERT [dbo].[CreditCard] ([idCard], [idCustomer], [numberCard], [cardType], [expirationMonth], [expirationYear]) VALUES (4, 4, 4444, N'American', 1, 2016)
INSERT [dbo].[CreditCard] ([idCard], [idCustomer], [numberCard], [cardType], [expirationMonth], [expirationYear]) VALUES (5, 4, 4444, N'MasterCard', 1, 2015)
INSERT [dbo].[CreditCard] ([idCard], [idCustomer], [numberCard], [cardType], [expirationMonth], [expirationYear]) VALUES (6, 4, 2434, N'American', 1, 2015)
INSERT [dbo].[CreditCard] ([idCard], [idCustomer], [numberCard], [cardType], [expirationMonth], [expirationYear]) VALUES (7, 4, 3232, N'MasterCard', 1, 2015)
INSERT [dbo].[CreditCard] ([idCard], [idCustomer], [numberCard], [cardType], [expirationMonth], [expirationYear]) VALUES (8, 2, 1111, N'American', 2, 2015)
INSERT [dbo].[CreditCard] ([idCard], [idCustomer], [numberCard], [cardType], [expirationMonth], [expirationYear]) VALUES (9, 2, 4444, N'MasterCard', 2, 2016)
SET IDENTITY_INSERT [dbo].[CreditCard] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([idCustomer], [idCategory], [email], [userName], [pass], [idCard], [first_name], [last_name], [phone_number], [address], [country], [numberDoc], [TypeDoc], [city], [idUser], [modificationDate]) VALUES (2, 1, N'jhonlag@outlook.com', N'lagus123', N'$2a$10$.DTHZgqN9L6pPsil4Ukp0uHJ1v9PlMs.hw7cQg0F/jTRHZr1mqEtO', 9, N'Jhon', N'Laguna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([idCustomer], [idCategory], [email], [userName], [pass], [idCard], [first_name], [last_name], [phone_number], [address], [country], [numberDoc], [TypeDoc], [city], [idUser], [modificationDate]) VALUES (3, 1, N'eyner@gmail.com', N'eyner', N'$2a$10$loDZb/rIY8HE0QO2yPDZ0OMiI5u4f2WFNybbMuz.5J8BhqNcGPGkO', NULL, N'Eyner', N'Arias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([idCustomer], [idCategory], [email], [userName], [pass], [idCard], [first_name], [last_name], [phone_number], [address], [country], [numberDoc], [TypeDoc], [city], [idUser], [modificationDate]) VALUES (4, 1, N'rodolfo@gmail.com', N'rodolfo', N'$2a$10$3J1grzhbgb2dlOpOZMVUMuVbDYwiYpinZZdNGnsHpAzNGF4oC9DTa', 7, N'Rodolfo', N'Arteaga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([idCustomer], [idCategory], [email], [userName], [pass], [idCard], [first_name], [last_name], [phone_number], [address], [country], [numberDoc], [TypeDoc], [city], [idUser], [modificationDate]) VALUES (5, 1, N'Diana@hjs.com', N'Diana', N'$2a$10$zuxX0DcrrW.AYgNgKhGJtOJs5FCEkkpObyQK/HIvhNxI0qWkRaiMi', NULL, N'Diana', N'Martinez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([idCustomer], [idCategory], [email], [userName], [pass], [idCard], [first_name], [last_name], [phone_number], [address], [country], [numberDoc], [TypeDoc], [city], [idUser], [modificationDate]) VALUES (6, NULL, N'seriobd@gmail.com', N'sergiobd', N'123', NULL, N'Sergio', N'Bautista', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customer] ([idCustomer], [idCategory], [email], [userName], [pass], [idCard], [first_name], [last_name], [phone_number], [address], [country], [numberDoc], [TypeDoc], [city], [idUser], [modificationDate]) VALUES (7, 1, N'sergio@gmail.com', N'sergiob', N'$2a$10$neLywuBRlY8btYzUtGjCWetYCStvDfvr0CrsYLMiPFa0cLiN5K.Tq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Entertainment] ON 

INSERT [dbo].[Entertainment] ([idEntertainment], [price], [name]) VALUES (1, 150000.0000, N'deportes')
INSERT [dbo].[Entertainment] ([idEntertainment], [price], [name]) VALUES (2, 60000.0000, N'arte')
SET IDENTITY_INSERT [dbo].[Entertainment] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([idHotel], [price], [name], [reservationCode], [checkInDate], [checkOutDate], [urlService]) VALUES (1, 120000.0000, N'Hilton', N'HH123', CAST(N'2018-11-18T08:00:00.000' AS DateTime), CAST(N'2018-11-18T08:00:00.000' AS DateTime), N'http://localhost:8097/DannCarltonWebService')
INSERT [dbo].[Hotel] ([idHotel], [price], [name], [reservationCode], [checkInDate], [checkOutDate], [urlService]) VALUES (2, 95000.0000, N'Barcelona', N'HB123', CAST(N'2018-11-18T08:00:00.000' AS DateTime), CAST(N'2018-11-18T08:00:00.000' AS DateTime), N'http://localhost:8097/DannCarltonWebService')
INSERT [dbo].[Hotel] ([idHotel], [price], [name], [reservationCode], [checkInDate], [checkOutDate], [urlService]) VALUES (3, 320000.0000, N'Dann Carlton', N'DC123', CAST(N'2018-11-18T08:00:00.000' AS DateTime), CAST(N'2018-11-18T08:00:00.000' AS DateTime), N'http://localhost:8097/DannCarltonWebService')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (4, 2, 3, 6)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (8, 2, 7, 6)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (9, 2, 8, 2)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (10, 1, 8, 1)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (11, 2, 9, 1)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (12, 1, 9, 1)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (13, 2, 10, 1)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (14, 9, 10, 1)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (15, 2, 11, 1)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (16, 6, 11, 5)
INSERT [dbo].[OrderProduct] ([idOrderProduct], [idProduct], [idOrder], [quantity]) VALUES (17, 2, 11, 10)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (3, 3, 230000.0000, 2, 888888888, CAST(N'2018-09-30T11:07:03.620' AS DateTime), CAST(N'2018-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (4, 3, 9000000.0000, 4, 4444, CAST(N'2018-09-30T11:18:47.417' AS DateTime), CAST(N'2018-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (5, 3, 1315000.0000, 4, 4444, CAST(N'2018-09-30T11:21:51.783' AS DateTime), CAST(N'2018-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (6, 3, 230000.0000, 2, 888888888, CAST(N'2018-09-30T11:26:53.720' AS DateTime), CAST(N'2018-10-31T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (7, 3, 230000.0000, 2, 888888888, CAST(N'2018-10-05T11:27:06.217' AS DateTime), CAST(N'2018-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (8, 3, 1315000.0000, 4, 2434, CAST(N'2018-09-30T11:30:11.657' AS DateTime), CAST(N'2018-10-10T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (9, 3, 915000.0000, 4, 3232, CAST(N'2018-09-30T11:31:53.223' AS DateTime), CAST(N'2018-10-31T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (10, 3, 600000.0000, 2, 1111, CAST(N'2018-09-30T15:25:35.853' AS DateTime), CAST(N'2018-10-31T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Orders] ([idOrder], [idStateOrder], [amount], [idCustomer], [numberCard], [creationDate], [modificationDate], [country], [city], [IdUser]) VALUES (11, 3, 5400000.0000, 2, 4444, CAST(N'2018-09-30T16:37:16.127' AS DateTime), CAST(N'2018-10-31T00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (1, 1, 1, 1, N'Final copa del rey', N'1', 515000.0000, CAST(5.00 AS Decimal(5, 2)), N'P001', 1, 2, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-13T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: en primera fila en exclusiva', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (2, 2, 1, 2, N'semifinal copa libertadores', N'2', 400000.0000, CAST(4.00 AS Decimal(5, 2)), N'P002', 2, 2, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-12T13:23:44.000' AS DateTime), CAST(N'2018-09-15T13:23:44.000' AS DateTime), N'disfruta el partido en primera fila', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (3, 1, 1, 1, N'Derbi Sevillano, Betis - Sevilla', N'1', 300000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Derbi Sevillano, Betis - Sevilla', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (4, 1, 1, 1, N'Levante vs Alavés', N'2', 200000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Levante vs Alavés', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (5, 1, 1, 1, N'Alavés vs Betis', N'3', 200000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Alavés vs Betis', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (6, 1, 1, 1, N'Huesca vs Girona', N'4', 200000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Huesca vs Girona', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (7, 1, 1, 1, N'Levante vs Alavés', N'5', 200000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Levante vs Alavés', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (8, 1, 1, 1, N'Villarreal vs Valladolid', N'6', 200000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Villarreal vs Valladolid', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (9, 1, 1, 1, N'Real Madrid vs Atlético', N'7', 300000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Real Madrid vs Atlético', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (10, 1, 1, 1, N'Villarreal vs Valladolid', N'8', 250000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Villarreal vs Valladolid', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (11, 1, 1, 1, N'Barcelona vs Athletic', N'9', 250000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Barcelona vs Athletic', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (12, 1, 1, 1, N'Valencia vs Atlético', N'10', 220000.0000, CAST(20.00 AS Decimal(5, 2)), N'P003', 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Valencia vs Atlético', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (13, 1, 1, 1, N'Valladolid vs Barcelona', N'11', 250000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Valladolid vs Barcelona', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (14, 1, 1, 1, N'Leganés vs Real Sociedad', N'12', 200000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Leganés vs Real Sociedad', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (15, 1, 1, 1, N'Girona vs Real Madrid', N'13', 250000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Girona vs Real Madrid', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (16, 1, 1, 1, N'Real Madrid vs Leganés', N'14', 250000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Real Madrid vs Leganés', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (17, 1, 1, 1, N'Levante vs Valencia', N'15', 220000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Levante vs Valencia', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (18, 1, 1, 1, N'Atlético de Madrid vs Huesca', N'16', 210000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Atlético de Madrid vs Huesca', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (19, 1, 1, 1, N'Real Madrid vs Roma', N'17', 380000.0000, CAST(10.00 AS Decimal(5, 2)), NULL, 3, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Champions: Real Madrid vs Roma', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (20, 1, 1, 1, N'Real Madrid vs Getafe', N'18', 230000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Real Madrid vs Getafe', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (21, 1, 1, 1, N'Rayo vs Sevilla', N'19', 180000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Rayo vs Sevilla', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (22, 1, 1, 1, N'Sevilla vs Getafe', N'20', 190000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Sevilla vs Getafe', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (23, 1, 1, 1, N'Getafe vs Valladolid', N'21', 200000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Getafe vs Valladolid', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (24, 1, 1, 1, N'Atlético de Madrid vs Rayo', N'22', 210000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Atlético de Madrid vs Rayo', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (25, 1, 1, 1, N'Eibar vs Huesca', N'23', 170000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Eibar vs Huesca', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (26, 1, 1, 1, N'Valladolid vs Levante', N'24', 190000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Valladolid vs Levante', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (27, 1, 1, 1, N'Athletic vs Huesca', N'25', 210000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Athletic vs Huesca', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (28, 1, 1, 1, N'Valencia vs Celta', N'26', 210000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Valencia vs Celta', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (29, 1, 1, 1, N'Real Sociedad vs. Valencia', N'27', 200000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Real Sociedad vs. Valencia', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (30, 1, 1, 1, N'Athletic vs Leganés', N'28', 190000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Athletic vs Leganés', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (31, 1, 1, 1, N'Betis vs Athletic', N'29', 210000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Betis vs Athletic', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (32, 1, 1, 1, N'Barcelona vs PSV Eindhoven ', N'30', 380000.0000, CAST(10.00 AS Decimal(5, 2)), NULL, 3, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Champions: Barcelona vs PSV Eindhoven ', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (33, 1, 1, 1, N'As Monaco vs Atlético de Madrid', N'31', 370000.0000, CAST(10.00 AS Decimal(5, 2)), NULL, 3, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Champions: As Monaco vs Atlético de Madrid', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (34, 1, 1, 1, N'Francia vs Holanda', N'32', 400000.0000, CAST(30.00 AS Decimal(5, 2)), NULL, 6, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Francia vs Holanda', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (35, 1, 1, 1, N'Boca vs River', N'33', 200000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 5, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Argentina: Boca vs River', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (36, 1, 1, 1, N'Independiente vs River', N'34', 220000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 5, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Argentina: Independiente vs River', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (37, 1, 1, 1, N'Lanús vs Racing', N'35', 170000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 5, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Argentina: Lanús vs Racing', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (38, 1, 1, 1, N'Patronato vs Gimnasia LP', N'36', 140000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 5, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Argentina: Patronato vs Gimnasia LP', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (39, 1, 1, 1, N'Sevilla vs Getafe', N'37', 200000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Sevilla vs Getafe', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (40, 1, 1, 1, N'Atlético vs Brujas', N'38', 350000.0000, CAST(10.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Atlético vs Brujas', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (41, 1, 1, 1, N'San Lorenzo vs Atlético Tucumán', N'39', 150000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 5, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Argentina: San Lorenzo vs Atlético Tucumán', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (42, 1, 1, 1, N'Atlético Tucumán vs Tigre', N'40', 160000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 4, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Mexico: Atlético Tucumán vs Tigre', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (43, 1, 1, 1, N'Girona vs Betis', N'41', 200000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Girona vs Betis', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (44, 1, 1, 1, N'Barcelona vs Huesca', N'42', 250000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Barcelona vs Huesca', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (45, 1, 1, 1, N'Alavés vs Espanyol', N'43', 200000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Alavés vs Espanyol', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (46, 1, 1, 1, N'Manchester City vs Newcastle', N'44', 260000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 3, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Champions: Manchester City vs Newcastle', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (47, 1, 1, 1, N'Olympiacos vs Betis', N'45', 300000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 3, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Champions: Olympiacos vs Betis', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (48, 1, 1, 1, N'Rayo vs Espanyol', N'46', 200000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 1, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Santander: Rayo vs Espanyol', NULL, NULL)
INSERT [dbo].[Product] ([idProduct], [idTransport], [idEntertainment], [idHotel], [name], [urlImage], [price], [discountRate], [code], [source_city], [target_city], [spectacle_date], [arrival_date], [departure_date], [description], [IdUser], [modificationDate]) VALUES (49, 1, 1, 1, N'Santa Fe vs Tolima', N'39', 150000.0000, CAST(20.00 AS Decimal(5, 2)), NULL, 5, 1, CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), CAST(N'2018-09-11T13:23:44.000' AS DateTime), N'Liga Colombiana: San Lorenzo vs Atlético Tucumán', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[StateCampaign] ON 

INSERT [dbo].[StateCampaign] ([idStateCampaign], [nameState]) VALUES (1, N'Activa')
INSERT [dbo].[StateCampaign] ([idStateCampaign], [nameState]) VALUES (2, N'Inactiva')
INSERT [dbo].[StateCampaign] ([idStateCampaign], [nameState]) VALUES (3, N'Suspendida')
SET IDENTITY_INSERT [dbo].[StateCampaign] OFF
SET IDENTITY_INSERT [dbo].[StateOrder] ON 

INSERT [dbo].[StateOrder] ([idStateOrder], [nameState]) VALUES (1, N'En Validación')
INSERT [dbo].[StateOrder] ([idStateOrder], [nameState]) VALUES (2, N'En Reservación')
INSERT [dbo].[StateOrder] ([idStateOrder], [nameState]) VALUES (3, N'Cerrada')
INSERT [dbo].[StateOrder] ([idStateOrder], [nameState]) VALUES (4, N'Rechazada')
INSERT [dbo].[StateOrder] ([idStateOrder], [nameState]) VALUES (5, N'Cancelada')
SET IDENTITY_INSERT [dbo].[StateOrder] OFF
SET IDENTITY_INSERT [dbo].[Transport] ON 

INSERT [dbo].[Transport] ([idTransport], [price], [name], [flightCode], [departureDate], [arrivalDate], [urlService]) VALUES (1, 310000.0000, N'Avianca', N'AVI123', CAST(N'2018-11-18T08:00:00.000' AS DateTime), CAST(N'2018-11-18T08:00:00.000' AS DateTime), N'http://localhost:8096/ServicioWebAvianca')
INSERT [dbo].[Transport] ([idTransport], [price], [name], [flightCode], [departureDate], [arrivalDate], [urlService]) VALUES (2, 140000.0000, N'Airlines', N'AA123', CAST(N'2018-11-18T08:00:00.000' AS DateTime), CAST(N'2018-11-18T08:00:00.000' AS DateTime), N'http://localhost:8095/AAFlightsService')
INSERT [dbo].[Transport] ([idTransport], [price], [name], [flightCode], [departureDate], [arrivalDate], [urlService]) VALUES (3, 450000.0000, N'Dann Carlton 8754 05/12/2018 13:00 15/12/2018 15:00', N'asd', CAST(N'2018-11-18T08:00:00.000' AS DateTime), CAST(N'2018-11-18T08:00:00.000' AS DateTime), N'http://localhost:8097/DannCarltonWebService')
SET IDENTITY_INSERT [dbo].[Transport] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([idUser], [email], [userName], [pass], [first_name], [last_name], [Rol]) VALUES (1, NULL, N'sbautista', N'123456+', N'sergio', N'bautista', N'Administrador')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_Campaign_Product]
GO
ALTER TABLE [dbo].[Campaign]  WITH CHECK ADD  CONSTRAINT [FK_Campaign_StateCampaign] FOREIGN KEY([idStateCampaign])
REFERENCES [dbo].[StateCampaign] ([idStateCampaign])
GO
ALTER TABLE [dbo].[Campaign] CHECK CONSTRAINT [FK_Campaign_StateCampaign]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Category] FOREIGN KEY([idCategory])
REFERENCES [dbo].[Category] ([idCategory])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Category]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[Orders] ([idOrder])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Entertainment] FOREIGN KEY([idEntertainment])
REFERENCES [dbo].[Entertainment] ([idEntertainment])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Entertainment]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hotel] ([idHotel])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Hotel]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Transport] FOREIGN KEY([idTransport])
REFERENCES [dbo].[Transport] ([idTransport])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Transport]
GO
/****** Object:  StoredProcedure [dbo].[TopProducts]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[TopProducts]
	-- Add the parameters for the stored procedure here
	@DateBegin varchar(10),
	@DateEnd   varchar(10)
AS
BEGIN


SELECT        P.idProduct, P.name, P.description, P.idEntertainment, SUM(OP.quantity) AS cantidad
FROM          dbo.Orders AS O INNER JOIN
                         dbo.OrderProduct AS OP ON OP.idOrder = O.idOrder INNER JOIN
                         dbo.Product AS P ON OP.idProduct = P.idProduct
WHERE CONVERT(DATE, O.creationDate) BETWEEN @DateBegin AND @DateEnd
GROUP BY P.idProduct, P.name, P.description, P.idEntertainment
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Campaign]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Campaign]
	-- Add the parameters for the stored procedure here
	@PageNumber int,
	@PageSize int
AS
BEGIN

SELECT [idCampaign] ,[name]        ,[idStateCampaign]
      ,[urlImage]   ,[description] ,[idProduct]
      ,[startDate]  ,[endDate]     ,[idUser]
      ,[modificationDate]
  FROM [aespica].[dbo].[Campaign]
  ORDER BY [idCampaign]
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Customer]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Customer]
	-- Add the parameters for the stored procedure here
	@PageNumber int,
	@PageSize int
AS
BEGIN

SELECT [idCustomer] ,[idCategory] ,[email]
      ,[userName]   ,[pass]       ,[idCard]
      ,[first_name] ,[last_name]  ,[phone_number]
      ,[address]    ,[country]    ,[numberDoc]
      ,[TypeDoc]    ,[city]       ,[idUser]
      ,[modificationDate]
  FROM [aespica].[dbo].[Customer]
  ORDER BY [idCustomer]
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[USP_CustomerProduct]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_CustomerProduct]
	-- Add the parameters for the stored procedure here
	@IdProduct bigint,
	@PageNumber int,
	@PageSize int
AS
BEGIN


SELECT C.idCustomer, C.email,     C.first_name,
	   C.last_name,  P.idProduct, P.name	        
  FROM [aespica].[dbo].OrderProduct AS OP 
  INNER JOIN dbo.[Orders] AS O ON O.idOrder = OP.idOrder
  INNER JOIN dbo.[Customer] AS C ON C.idCustomer = O.idCustomer 
  INNER JOIN dbo.[Product] AS P ON P.idProduct = OP.idProduct
WHERE OP.idProduct = @IdProduct
ORDER BY idCustomer
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[USP_OrderProduct]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_OrderProduct]
	-- Add the parameters for the stored procedure here
	@IdProduct bigint,
	@PageNumber int,
	@PageSize int
AS
BEGIN


SELECT O.[idOrder]          ,O.[idStateOrder] ,O.[amount]
      ,O.[idCustomer]       ,O.[numberCard]   ,O.[creationDate]
      ,O.[modificationDate] ,O.[country]      ,O.[city]
      ,O.[IdUser]           
  FROM [aespica].[dbo].[Orders] AS O 
  INNER JOIN dbo.OrderProduct AS OP ON OP.idOrder = O.idOrder 
WHERE OP.idProduct = @IdProduct
ORDER BY [idOrder]
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Orders]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Orders]
	-- Add the parameters for the stored procedure here
	@PageNumber int,
	@PageSize int
AS
BEGIN

SELECT [idProduct]    ,[idTransport]    ,[idEntertainment]
      ,[idHotel]      ,[name]           ,[urlImage]
      ,[price]        ,[discountRate]   ,[code]
      ,[source_city]  ,[target_city]    ,[spectacle_date]
      ,[arrival_date] ,[departure_date] ,[description]
      ,[IdUser]       ,[EventDate]
  FROM [aespica].[dbo].[Product]
  ORDER BY idProduct
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Orders_Closed]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Orders_Closed]
	-- Add the parameters for the stored procedure here
AS
BEGIN


SET LANGUAGE Spanish


SET LANGUAGE Spanish
SELECT CONCAT( DATENAME(MONTH, [modificationDate]), ' - ',year([modificationDate])) As Periodo, 
		COUNT([idOrder]) AS Cantidad, SUM([amount]) AS Facturado
        FROM [aespica].[dbo].[Orders]
        WHERE [idStateOrder] = 3
        GROUP BY CONCAT( DATENAME(MONTH, [modificationDate]), ' - ',year([modificationDate])) 

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Product]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Product]
	-- Add the parameters for the stored procedure here
	@PageNumber int,
	@PageSize int
AS
BEGIN

SELECT [idProduct]    ,[idTransport]    ,[idEntertainment]
      ,[idHotel]      ,[name]           ,[urlImage]
      ,[price]        ,[discountRate]   ,[code]
      ,[source_city]  ,[target_city]    ,[spectacle_date]
      ,[arrival_date] ,[departure_date] ,[description]
      ,[IdUser]       ,[modificationDate]
  FROM [aespica].[dbo].[Product]
  ORDER BY idProduct
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Product_Descrip]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Product_Descrip]
	-- Add the parameters for the stored procedure here
	@Description VARCHAR(50),
	@PageNumber int,
	@PageSize int
AS
BEGIN

SELECT @Description = REPLACE(@Description,'*', '%')

SELECT [idProduct]    ,[idTransport]    ,[idEntertainment]
      ,[idHotel]      ,[name]           ,[urlImage]
      ,[price]        ,[discountRate]   ,[code]
      ,[source_city]  ,[target_city]    ,[spectacle_date]
      ,[arrival_date] ,[departure_date] ,[description]
      ,[IdUser]       ,[modificationDate]
  FROM [aespica].[dbo].[Product]
  WHERE [description] LIKE @Description
  ORDER BY idProduct
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Product_Name]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_Product_Name]
	-- Add the parameters for the stored procedure here
	@Name VARCHAR(50),
	@PageNumber int,
	@PageSize int
AS
BEGIN

SELECT @Name = REPLACE(@Name,'*', '%')

SELECT [idProduct]    ,[idTransport]    ,[idEntertainment]
      ,[idHotel]      ,[name]           ,[urlImage]
      ,[price]        ,[discountRate]   ,[code]
      ,[source_city]  ,[target_city]    ,[spectacle_date]
      ,[arrival_date] ,[departure_date] ,[description]
      ,[IdUser]       ,[modificationDate]
  FROM [aespica].[dbo].[Product]
  WHERE name LIKE @Name
  ORDER BY idProduct
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[USP_TopCustomer]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_TopCustomer]
	-- Add the parameters for the stored procedure here
	@DateBegin varchar(10),
	@DateEnd   varchar(10)
AS
BEGIN


SELECT  O.idCustomer, C.first_name, C.last_name, SUM(O.amount) Acumulado
  FROM [aespica].[dbo].[Orders] AS O
  INNER JOIN dbo.[Customer] AS C ON O.idCustomer = C.idCustomer 
WHERE O.idStateOrder = 3
AND  O.creationDate BETWEEN @DateBegin AND @DateEnd
GROUP BY O.idCustomer, C.first_name, C.last_name
ORDER BY Acumulado DESC


END
GO
/****** Object:  StoredProcedure [dbo].[USP_TopOrders_Open]    Script Date: 12/11/2018 10:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author, Sergio>
-- Create date: <Create Date, 2018/10/15>
-- Description:	<Description,COnsulta top Productos vendidos en un periodo de fechas>
-- =============================================
CREATE PROCEDURE [dbo].[USP_TopOrders_Open]
	-- Add the parameters for the stored procedure here
	@PageNumber int,
	@PageSize int
AS
BEGIN

SELECT [idOrder]          ,[idStateOrder] ,[amount]
      ,[idCustomer]       ,[numberCard]   ,[creationDate]
      ,[modificationDate] ,[country]      ,[city]
      ,[IdUser]
  FROM [aespica].[dbo].[Orders]
  WHERE [idStateOrder] IN (1,2)
  ORDER BY [creationDate]
  OFFSET (@PageNumber -1)* @PageSize ROWS
  FETCH NEXT @PageSize ROWS ONLY

END
GO
