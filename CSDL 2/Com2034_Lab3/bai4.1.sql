
--Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
select * from NHANVIEN where DATENAME(year,ngsinh)>=1960 and DATENAME(year,ngsinh)<=1965

--Cho biết tuổi của các nhân viên tính đến thời điểm hiện tại.
select a.*,DATEDIFF(year,ngsinh,getdate()) +1 as Age from NHANVIEN a;

--Dựa vào dữ liệu NGSINH, cho biết nhân viên sinh vào thứ mấy.
select a.*,DATENAME(weekday,ngsinh) from NHANVIEN a;
