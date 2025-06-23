IF NOT EXISTS (
    SELECT * FROM sys.database_scoped_credentials WHERE name = 'rvncreds'
)
CREATE DATABASE SCOPED CREDENTIAL rvncreds
WITH IDENTITY = 'Managed Identity';

IF NOT EXISTS (
    SELECT * FROM sys.external_data_sources WHERE name = 'raw_ext_source'
)
CREATE EXTERNAL DATA SOURCE raw_ext_source
WITH (
    LOCATION = 'https://rvnstorage123.blob.core.windows.net/raw/',
    CREDENTIAL = rvncreds
);

IF NOT EXISTS (
    SELECT * FROM sys.external_file_formats WHERE name = 'parquet_format'
)
CREATE EXTERNAL FILE FORMAT parquet_format
WITH (
    FORMAT_TYPE = PARQUET
);

IF OBJECT_ID('dbo.vw_cleaned_employee_data', 'V') IS NOT NULL  
    DROP VIEW dbo.vw_cleaned_employee_data;

CREATE VIEW vw_cleaned_employee_data AS
SELECT
    id,
    name,
    salary
FROM OPENROWSET(
    BULK 'clean_output_parquet/',
    DATA_SOURCE = 'raw_ext_source',
    FORMAT = 'PARQUET'
) WITH (
    id INT,
    name VARCHAR(100),
    salary INT
) AS data;
SELECT * FROM vw_cleaned_employee_data


