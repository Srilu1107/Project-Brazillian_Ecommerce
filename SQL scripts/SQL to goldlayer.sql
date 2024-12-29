
---CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Vutukuru@1998'
---CREATE DATABASE SCOPED CREDENTIAL sriadmin WITH IDENTITY = 'managed identity';

---select * from sys.database_credentials

CREATE EXTERNAL FILE FORMAT extfileformat WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE goldlayer WITH (
    LOCATION = 'https://olistdatastorageacc.dfs.core.windows.net/olistdataa/gold',
    CREDENTIAL = sriadmin
);

CREATE EXTERNAL TABLE gold.finaltable WITH (
        LOCATION = 'Serving',
        DATA_SOURCE = goldlayer,
        FILE_FORMAT = extfileformat
) AS
SELECT * FROM gold.final2;

