
CREATE TABLE [dbo].[Billing](
	[billingid] [int] NULL,
	[billingdateandtime] [datetime] NULL,
	[centreid] [int] NULL,
	[patientid] [int] NULL,
	[ipadmissionno] [int] NULL,
	[patienttype] [varchar](20) NULL,
	[channel] [varchar](20) NULL,
	[referraldoctorid] [int] NULL,
	[consultingdoctorid] [int] NULL,
	[departmentid] [int] NULL,
	[serviceid] [int] NULL,
	[packageprofileid] [int] NULL,
	[netamount] [numeric](18, 0) NULL,
	[grossamount] [numeric](18, 0) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Centre](
	[centreid] [int] NULL,
	[centrenName] [varchar](20) NULL,
	[centertype] [varchar](20) NULL,
	[centeractive] [bit] NULL,
	[location] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DEPARTMENTs](
	[departmentid] [int] NULL,
	[departmentname] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DoctorDetail](
	[doctorid] [int] NULL,
	[doctorname] [varchar](20) NULL,
	[departmentid] [int] NULL,
	[departmentname] [varchar](20) NULL,
	[speciality] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[IpAdmission](
	[patientid] [int] NULL,
	[dateofadmission] [datetime] NULL,
	[ipadmissionno] [int] NULL,
	[centreid] [int] NULL,
	[channel] [varchar](20) NULL,
	[referraldoctorid] [int] NULL,
	[consultingdoctorid] [int] NULL,
	[departmentid] [int] NULL,
	[roomno] [varchar](20) NULL,
	[bedno] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[IpDischarge](
	[patientid] [int] NULL,
	[ipadmissionno] [int] NULL,
	[centreid] [int] NULL,
	[dateofdischarge] [date] NULL,
	[dischargestatus] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Item](
	[itemid] [int] NULL,
	[itemname] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LabReport](
	[billingid] [int] NULL,
	[orderid] [int] NULL,
	[patientid] [int] NULL,
	[ipadmissionno] [int] NULL,
	[testname] [varchar](20) NULL,
	[parametername] [varchar](20) NULL,
	[resultvalue] [varchar](20) NULL,
	[unit] [varchar](20) NULL,
	[resultdatetime] [datetime] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PateintDemographics](
	[patientid] [int] NULL,
	[Name] [varchar](20) NULL,
	[dateofregistration] [datetime] NULL,
	[dateofbirth] [date] NULL,
	[gender] [varchar](20) NULL,
	[mobile] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SERVICE](
	[serviceid] [int] NULL,
	[servicename] [varchar](20) NULL
) ON [PRIMARY]
GO
