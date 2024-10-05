--- Fuzzy Lookup 
--based on similarity that lookup called fuzzy lookup 

CREATE TABLE [dbo].[FuzzySource](
  [Cid] [varchar](50) NULL,
  [Country Name] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[FuzzySource] ([Cid], [Country Name]) VALUES (N'1', N'Australia')
GO
INSERT [dbo].[FuzzySource] ([Cid], [Country Name]) VALUES (N'2', N'Canada')
GO
INSERT [dbo].[FuzzySource] ([Cid], [Country Name]) VALUES (N'3', N'France')
GO
INSERT [dbo].[FuzzySource] ([Cid], [Country Name]) VALUES (N'4', N'Germany')
GO
INSERT [dbo].[FuzzySource] ([Cid], [Country Name]) VALUES (N'5', N'United Kingdom')
GO
INSERT [dbo].[FuzzySource] ([Cid], [Country Name]) VALUES (N'6', N'United States')
GO

CREATE TABLE [dbo].[FuzzyValues](
  [Cid] [varchar](50) NULL,
  [Country Name] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'1', N'Australia')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'2', N'Canada')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'3', N'France')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'4', N'Germany')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'5', N'United Kingdom')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'6', N'United States')

GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'1', N'Australi')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'2', N'Canad')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'3', N'Franc')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'4', N'German')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'5', N'United Kingdo')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'6', N'United State')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'1', N'Austral')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'2', N'Cana')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'3', N'Fran')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'4', N'Germa')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'5', N'United Kingd')
GO
INSERT [dbo].[FuzzyValues] ([Cid], [Country Name]) VALUES (N'6', N'United Stat')





SELECT *FROM FUZZYSOURCE
SELECT *FROM FUZZYVALUES

-- 3 types of similarity
--similar
--exact
--look like