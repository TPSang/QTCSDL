
declare @Thongke table (Phg int, LTB float);
insert into @Thongke
select PHG,AVG(luong) as LTB from NHANVIEN group by PHG;
select TENNV,LUONG,'Tinh Trang' =IIF(luong >b.LTB,'Khong tang luong','Tang Luong')
from NHANVIEN a inner join @Thongke b on a.PHG = b.Phg;


