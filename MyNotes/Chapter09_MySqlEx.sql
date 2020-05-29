create database db_spark;
show databases;

use db_spark;

create table IF NOT EXISTS summary_2010(
	DEST_COUNTRY_NAME VARCHAR(255),
    ORIGIN_COUNTRY_NAME VARCHAR(255),
    COUNT INT
);

select * from summary_2010;

DROP TABLE summary_2010;
