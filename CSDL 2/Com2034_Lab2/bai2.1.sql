select * from NHANVIEN;

declare @max float;

select @max= max (luong)from NHANVIEN;

select *from NHANVIEN where LUONG = @max;

