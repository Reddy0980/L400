EXECUTE AS USER = 'asa.sql.highperf'

IF OBJECT_ID(N'[wwi_perf].[Sale_Partition02]', N'U') IS NOT NULL   
DROP TABLE [wwi_perf].[Sale_Partition02] 

CREATE TABLE [wwi_perf].[Sale_Partition02]
WITH
(
	DISTRIBUTION = HASH ( [CustomerId] ),
	CLUSTERED COLUMNSTORE INDEX,
	PARTITION
	(
		[TransactionDateId] RANGE RIGHT FOR VALUES (
            --20100101, 20100401, 20100701, 20101001, 
            --20110101, 20110401, 20110701, 20111001, 
            --20120101, 20120401, 20120701, 20121001, 
            --20130101, 20130401, 20130701, 20131001, 
            --20140101, 20140401, 20140701, 20141001, 
            --20150101, 20150401, 20150701, 20151001, 
            --20160101, 20160401, 20160701, 20161001, 
            --20170101, 20170401, 20170701, 20171001, 
            --20180101, 20180401, 20180701, 20181001, 
            20190101, 20190401, 20190701, 20191001)
	)
)
AS
SELECT
	*
FROM	
	[wwi_perf].[Sale_Heap]
OPTION  (LABEL  = 'CTAS : Sale_Partition02')