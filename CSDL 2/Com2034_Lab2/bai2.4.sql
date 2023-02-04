select *from DEAN;

declare @Thongke table(MaPH int, SoLuong int);

insert into @Thongke select phg,COUNT (mada) from DEAN
group by phg;

select* from @Thongke;
 
select a.tenpb,b.MaPH, b.SoLuong from PHONGBAN a inner join @Thongke b on a.mapb = b.MaPH;
