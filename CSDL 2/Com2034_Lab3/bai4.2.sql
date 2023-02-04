--Cho biết số lượng nhân viên, tên trưởng phòng, ngày nhận chức trưởng phòng và ngày
--nhận chức trưởng phòng hiển thi theo định dạng dd-mm-yy (ví dụ 25-04-2019)
select a.TRPHG,
c.HONV+' '+c.TENLOT+' '+c.TENNV,
CONVERT(varchar, a.NG_NHANCHUC,105), b.sl -1
from PHONGBAN a inner join
(select PHG,COUNT(manv) as SL from  NHANVIEN group by PHG) b on a.MAPHG=b.PHG
inner join NHANVIEN c on a.TRPHG=MANV;