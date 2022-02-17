-- create tables with most of the datatypes
create table var(a char(10), b nchar(9), c nvarchar(8), d varchar(7), e text, f ntext, g varbinary(10), h binary(9), i image, j xml)
go

create table dates(a date, b time(5), c datetime, d datetime2(5), e smalldatetime, f sql_variant)
go

create table nums(a int, b smallint, c tinyint, d bigint, e bit, f float, g real, h numeric(5,3), i money, j smallmoney)
go

-- testing sp_columns_100
EXEC [sys].sp_columns_100 'var', 'dbo', NULL, NULL, @ODBCVer = 3, @fUsePattern = 1
go

EXEC [sys].sp_columns_100 'dates', 'dbo', NULL, NULL, @ODBCVer = 3, @fUsePattern = 1
go

EXEC [sys].sp_columns_100 'nums', 'dbo', NULL, NULL, @ODBCVer = 3, @fUsePattern = 1
go

-- Testing with UDTS
create type char_t from char(10)
go

create type nchar_t from char(9)
go

create type varchar_t from nvarchar(8)
go

create type nvarchar_t from nvarchar(8)
go

create type text_t from text
go

create type ntext_t from ntext
go

create type varbinary_t from varbinary(10)
go

create type binary_t from binary(8)
go

create type image_t from image
go

create table vart (a char_t, b nchar_t, c nvarchar_t, d varchar_t, e text_t, f ntext_t, g varbinary_t, h binary_t, i image_t)
go

EXEC [sys].sp_columns_100 'vart', 'dbo', NULL, NULL, @ODBCVer = 3, @fUsePattern = 1
go

-- Testing cross db references
Create database sp_cols
go

Use sp_cols
go

EXEC [sys].sp_columns_100 'vart', 'dbo', NULL, NULL, @ODBCVer = 3, @fUsePattern = 1
go

create table nums(a int, b smallint, c tinyint, d bigint, e bit, f float, g real, h numeric(5,3), i money, j smallmoney)
go

EXEC [sys].sp_columns_100 'vart', 'dbo', NULL, NULL, @ODBCVer = 3, @fUsePattern = 1
go

drop table nums
go

Use master
go

-- Cleanup
drop table var;
drop table dates;
drop table nums;
drop table vart;
drop type char_t;
drop type nchar_t;
drop type varchar_t;
drop type nvarchar_t;
drop type text_t;
drop type ntext_t;
drop type varbinary_t;
drop type binary_t;
drop database sp_cols;
go