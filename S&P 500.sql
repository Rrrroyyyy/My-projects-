--Cleaning Data in SQL Queries

select * from dbo.['SP 500 ESG Risk Ratings$']

--POPULATE ADDRESS DATA 

select * from dbo.['SP 500 ESG Risk Ratings$']
where Address is null;

--BREAKING OUT ADDRESSES INTO INDIVIDUAL COLUMNS(Address, City, State)

SELECT address from dbo.['SP 500 ESG Risk Ratings$']

select 
REVERSE(PARSENAME(REPLACE(REVERSE(address), ',','.'), 1)) as Street 
,REVERSE(PARSENAME(REPLACE(REVERSE(address), ',','.'), 2)) as "State, PIN code, Website"
from dbo.['SP 500 ESG Risk Ratings$']


--NUMBER OF SECTORS

select count(distinct sector)
from dbo.['SP 500 ESG Risk Ratings$'];

--NUMBER OF TOTAL COMPANIES IN THE SECTOR

select sector, COUNT(distinct name) as "total number of companies"
from dbo.['SP 500 ESG Risk Ratings$']
Group by sector;

--COMPANIES WHOSE ENVIRONMENT RISK SCORE IS MORE THAN 10 nd belongs TO TECHNOLOGY SECTOR

select * from dbo.['SP 500 ESG Risk Ratings$'] 
where Sector = 'Technology' 
And [Environment Risk Score] > 10 


SELECT TOP 1 [Governance Risk Score]
FROM (
SELECT DISTINCT TOP 3 [Governance Risk Score]
FROM ['SP 500 ESG Risk Ratings$']
ORDER BY [Governance Risk Score]  DESC
) AS temp
ORDER BY [Governance Risk Score]

--highest esg risk percentile

SELECT * FROM (
  SELECT name, [ESG Risk Percentile] , DENSE_RANK() OVER (ORDER BY [ESG Risk Percentile] DESC) AS r
  FROM ['SP 500 ESG Risk Ratings$']
) AS subquery
WHERE r = 3;

--Highest social risk score

Select top 1 Name, [Social Risk Score]
from (select distinct top 3 Name, [Social Risk Score] from ['SP 500 ESG Risk Ratings$'] order by [Social Risk Score] desc) as risk
order by [Social Risk Score];

Select top 1 [Social Risk Score], name
from (select distinct top 3 [Social Risk Score], name from ['SP 500 ESG Risk Ratings$'] order by [Social Risk Score] desc) as risk
order by [Social Risk Score];






