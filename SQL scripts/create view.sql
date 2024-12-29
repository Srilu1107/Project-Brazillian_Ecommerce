create schema gold

create view gold.final
as 
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://olistdatastorageacc.dfs.core.windows.net/olistdataa/silver/',
        FORMAT = 'PARQUET'
    ) AS result1

    select * from gold.final