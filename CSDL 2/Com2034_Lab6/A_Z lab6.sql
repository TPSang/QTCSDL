--bài 1:
--Ràng buộc khi thêm mới nhân viên thì mức lương phải lớn hơn 15000, nếu vi phạm thì xuất thông báo “luong phải >15000’
create trigger trg_CheckSalary15000
on Nhanvien
for insert,update
as
if(select luong from inserted)<15000
begin 
			print N'Lương < 15000'
			rollback transaction
		end
-- Ràng buộc khi thêm mới nhân viên thì độ tuổi phải nằm trong khoảng 18 <= tuổi <=65.
create trigger trg_CheckValiAge
on nhanvien
for insert 
as 
declare @age int;
select @age= DATEDIFF(YEAR,ngsinh,GETDATE())+1 from inserted;
if @age<18 or @age>65
		begin
			print N'Tuổi không hợp lệ 18<= Tuổi <=65'
			rollback transaction
		end
-- Ràng buộc khi cập nhật nhân viên thì không được cập nhật những nhân viên ở TP HCM
create trigger trg_update_NhanVien on NhanVien
for Update
as
	if(select dchi from inserted) like '%tp HCM%'
		begin 
			print ' Dia chi cap nhat khong hop le'
			rollback transaction
		end 
--bài 2:
--Hiển thị tổng số lượng nhân viên nữ, tổng số lượng nhân viên nam mỗi khi có hành động thêm mới nhân viên.
create trigger trg_insert_NhanVien2a on NhanVien
after insert
as 
	begin 
		select count (case when upper (phai)=N'Nam' then 1 end) Nam,
		count (case when upper(phai)=N'Nữ' then 1 end ) Nữ
		from nhanvien
end
-- Hiển thị tổng số lượng nhân viên nữ, tổng số lượng nhân viên nam mỗi khi có hành động cập nhật phần giới tính nhân viên
create trigger trg_update_NhanVien2 on NhanVien
for Update
as
	if(select phai from inserted) like N'%Nam'
		begin 
			print ' Dia chi cap nhat khong hop le'
			rollback transaction
		end 
--Hiển thị tổng số lượng đề án mà mỗi nhân viên đã làm khi có hành động xóa trên bảng DEAN
create trigger trg_insert_DeAn on dean
after delete
as 
	begin 
		select MA_NVIEN, count(maDA) as 'So luong du an' from phancong
		group by MA_NVIEN
	end
-- bài 3:
--Xóa các thân nhân trong bảng thân nhân có liên quan khi thực hiện hành động xóa nhân viên trong bảng nhân viên.
create trigger trg_delate_thanNhan_NV on nhanvien
instead of delete
as
	begin
		delete from thannhan where MA_NVIEN in(select manv from deleted)
	    delete from nhanvien where MA_NVIEN in(select manv from deleted)
	end

-- Khi thêm một nhân viên mới thì tự động phân công cho nhân viên làm đề án có MADA là 1.
create trigger trg_insert_NhanVien3 on nhanvien
after insert 
as
	begin
		insert into phancong values((select manv from inserted),1,1,30)
	end

