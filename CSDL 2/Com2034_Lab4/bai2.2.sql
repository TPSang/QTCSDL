declare  @max  int ,@num  int;
select @max =Max(cast(manv as int)) from NHANVIEN;

set @num =1;

while @num<= @max 
begin
if @num = 4
 begin
 set @num=@num+1;
 continue;
 end

if  @num %2=0
 select HONV, TENLOT,TENNV,MANV from NHANVIEN where  cast(manv as int )=@num ;

 set @num = @num +1;
end;
