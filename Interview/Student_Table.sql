USE [School]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2021/6/29 下午 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](10) NOT NULL,
	[Score] [int] NOT NULL,
	[Ranking] [nvarchar](10) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (1, N'張一', N'國文', 78, NULL)
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (2, N'張一', N'英文', 95, N'第一')
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (3, N'張一', N'數學', 70, NULL)
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (4, N'王二', N'國文', 91, NULL)
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (5, N'王二', N'英文', 90, NULL)
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (6, N'王二', N'數學', 89, N'第一')
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (7, N'李三', N'國文', 93, N'第一')
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (8, N'李三', N'英文', 77, NULL)
INSERT [dbo].[Student] ([Id], [Name], [Subject], [Score], [Ranking]) VALUES (9, N'李三', N'數學', 81, NULL)
GO
