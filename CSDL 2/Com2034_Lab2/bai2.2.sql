select  * from NHANVIEN;

declare @agv float, @map int;

select @agv = AVG (luong) from NHANVIEN

select @map = mapb from PHONGBAN where  tenpb =N'Nghiên Cứu';

select HONV,TENLOT,TEN from NHANVIEN  where  PHG =@map and LUONG >@agv;