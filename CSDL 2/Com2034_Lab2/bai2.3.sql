declare  @Thongke table (MaPH int, LTB float, SoLuong int);

insert into @Thongke select PHG,AVG(luong),COUNT(manv)from NHANVIEN

group by PHG

select b.*,a.tenpb from PHONGBAN a inner join @Thongke b on a.mapb =b.MaPH;

