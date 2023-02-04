declare @Thongke table (Phg int, LTB float);
insert into @Thongke
select PHG,AVG(luong) as LTB from NHANVIEN group by PHG;
select TENNV,LUONG,'Chuc Vu' =IIF(luong >b.LTB,'Truong Phong','Nhan Vien')
from NHANVIEN a inner join @Thongke b on a.PHG = b.Phg;