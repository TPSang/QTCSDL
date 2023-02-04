--Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương
--trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"
select HONV,TENLOT,TENNV, ROUND(LUONG,2) as 'luong' from NHANVIEN where  luong> ( 
select  ROUND(avg(luong),2)from NHANVIEN
where	PHG in (select MAPHG from PHONGBAN where  TENPHG =N'Nghiên cứu'));