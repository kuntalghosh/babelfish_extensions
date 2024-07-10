create view babel_4328_datetime2_v1 as select cast('2020' as datetime2)
go
create procedure babel_4328_datetime2_p1 as select cast('2020' as datetime2)
go
create function babel_4328_datetime2_f1()
returns datetime2 as
begin
return (select cast('2020' as datetime2));
end
go

create view babel_4328_datetime2_v2 as select cast('04-02-03' as datetime2)
go
create procedure babel_4328_datetime2_p2 as select cast('04-02-03' as datetime2)
go
create function babel_4328_datetime2_f2()
returns datetime2 as
begin
return (select cast('04-02-03' as datetime2));
end
go

create view babel_4328_datetime2_v3 as select cast('240129' as datetime2)
go
create procedure babel_4328_datetime2_p3 as select cast('240129' as datetime2)
go
create function babel_4328_datetime2_f3()
returns datetime2 as
begin
return (select cast('240129' as datetime2));
end
go

create view babel_4328_datetime2_v4 as select cast('3     .        12 .           2024' as datetime2)
go
create procedure babel_4328_datetime2_p4 as select cast('3     .        12 .           2024' as datetime2)
go
create function babel_4328_datetime2_f4()
returns datetime2 as
begin
return (select cast('3     .        12 .           2024' as datetime2));
end
go

create view babel_4328_datetime2_v5 as select cast('April 16, 2000' as datetime2)
go
create procedure babel_4328_datetime2_p5 as select cast('April 16, 2000' as datetime2)
go
create function babel_4328_datetime2_f5()
returns datetime2 as
begin
return (select cast('April 16, 2000' as datetime2));
end
go

create view babel_4328_datetime2_v6 as select cast('2022-10-30T03:00:00.123' as datetime2)
go
create procedure babel_4328_datetime2_p6 as select cast('2022-10-30T03:00:00.123' as datetime2)
go
create function babel_4328_datetime2_f6()
returns datetime2 as
begin
return (select cast('2022-10-30T03:00:00.123' as datetime2));
end
go
