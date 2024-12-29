
SELECT
    *
FROM
    OPENROWSET(
        BULK 'https://olistdatastorageacc.dfs.core.windows.net/olistdataa/silver/',
        FORMAT = 'PARQUET'
    ) AS result1

----https://olistdatastorageacc.blob.core.windows.net/olistdataa/silver/

create view gold.final