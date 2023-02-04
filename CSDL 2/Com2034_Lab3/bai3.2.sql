--Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất,
--hiển thị thêm một cột thay thế tên trưởng phòng bằng tên “Fpoly”

declare @ThongKe table (MaP int,MaNVTP int, TK int);

insert into @ThongKe
select phg,ma_nql,COUNT(manv) from NHANVIEN group by PHG, MA_NQL;

declare @Max int;
select @Max =max(tk) from @ThongKe;
select TENPHG,HONV+' '+TENLOT+''+TENNV,HONV+''+TENLOT+' Fpoly' from PHONGBAN a inner join(
select * from @ThongKe where  tk =@Max) b on a.MAPHG= b.MaP
inner join NHANVIEN c on c.MANV=b.MaNVTP;