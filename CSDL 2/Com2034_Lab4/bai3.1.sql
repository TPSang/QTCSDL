select * from PHONGBAN

begin  try 
	insert  into PHONGBAN(TENPHG,MAPHG,TRPHG,NG_NHANCHUC)
		values(N'Sản Xuất',7,'007','2021-06-01');
		print N'Dữ liệu thành công';
end try
begin catch 
	print N'Dữ liệu thất bại';
	end catch; 