
create view gold.final2
as 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://olistdatastorageacc.dfs.core.windows.net/olistdataa/silver/',
        FORMAT = 'PARQUET'
    ) AS result2

    where order_status = 'delivered'
      select * from gold.final2