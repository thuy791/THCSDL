# Câu 1
select c.MACT, c.so, c.HOTEN, c.VITRI, c.NGAYSINH, c.DIACHI
from QLBongDa.cauthu c;

select *
from QLBongDa.cauthu c
where c.SO = 7
  and c.VITRI = 'Tiền vệ';

select hlv.TENHLV, hlv.NGAYSINH, hlv.DIACHI, hlv.DIENTHOAI
from QLBongDa.huanluyenvien hlv;

select cauthu.*
from QLBongDa.cauthu,
     QLBongDa.caulacbo
where cauthu.MACLB = caulacbo.MACLB
  and caulacbo.TENCLB = 'Becamex Bình Dương';

select ct.MACT, ct.NGAYSINH, ct.DIACHI, ct.VITRI, ct.HOTEN
from QLBongDa.cauthu ct,
     QLBongDa.quocgia qg,
     QLBongDa.caulacbo clb
where ct.MACLB = clb.MACLB
  and clb.TENCLB = 'SHB Đà Nẵng'
  and ct.MAQG = qg.MAQG
  and qg.TENQG = 'Bra-xin';

select ct.*
from QLBongDa.cauthu ct,
     QLBongDa.caulacbo clb,
     QLBongDa.sanvd svd
where ct.MACLB = clb.MACLB
  and clb.MASAN = svd.MASAN
  and svd.TENSAN = 'Long An';

select td.MATRAN, td.NGAYTD, td.KETQUA, svd.TENSAN as TENSAN, clb1.TENCLB as TENCLB1, clb2.TENCLB as TENCLB2
from QLBongDa.trandau td
         join QLBongDa.caulacbo clb1 on td.MACLB1 = clb1.MACLB
         join QLBongDa.caulacbo clb2 on td.MACLB2 = clb2.MACLB
         join QLBongDa.sanvd svd on td.MASAN = svd.MASAN
where td.VONG = 2
  and td.NAM = 2009;

select hlv.MAHLV, hlv.TENHLV, hlv.NGAYSINH, hlv.DIACHI, hlv_clb.VAITRO, clb.TENCLB
from QLBongDa.huanluyenvien hlv,
     QLBongDa.hlv_clb,
     QLBongDa.caulacbo clb,
     QLBongDa.quocgia qg
where hlv.MAHLV = hlv_clb.MAHLV
  and hlv_clb.MACLB = clb.MACLB
  and hlv.MAQG = qg.MAQG
  and qg.TENQG = 'Việt Nam';

select distinct max(bangxh.DIEM) as DIEMCAONHAT, bangxh.MACLB, c.TENCLB
from QLBongDa.bangxh
         join QLBongDa.caulacbo c on c.MACLB = bangxh.MACLB
group by bangxh.MACLB
order by max(bangxh.DIEM) desc
limit 3;

select hlv.MAHLV, hlv.TENHLV, hlv.NGAYSINH, hlv.DIACHI, hlv_clb.VAITRO
from QLBongDa.huanluyenvien hlv,
     QLBongDa.hlv_clb,
     QLBongDa.caulacbo clb,
     QLBongDa.tinh
where hlv.MAHLV = hlv_clb.MAHLV
  and hlv_clb.MACLB = clb.MACLB
  and clb.MATINH = tinh.MATINH
  and tinh.TENTINH = 'Bình Dương';

# Câu 2
select tenclb as 'Tên clb', count(mact) as 'Số lượng cẩu thủ'
from QLBongDa.caulacbo clb,
     QLBongDa.cauthu ct
where clb.maclb = ct.maclb
group by tenclb;

select tenclb as 'Tên clb', count(mact) as 'Số lượng cẩu thủ'
from QLBongDa.caulacbo clb,
     QLBongDa.cauthu ct
where clb.maclb = ct.maclb
  and ct.maqg = 'vn'
group by tenclb;

select clb.maclb, clb.tenclb, svd.tensan, svd.diachi, count(ct.mact) as 'Số lượng cầu thủ ngoại'
from QLBongDa.caulacbo clb,
     QLBongDa.cauthu ct,
     QLBongDa.sanvd svd
where clb.masan = svd.masan
  and clb.maclb = ct.maclb
  and not ct.maqg = 'vn'
group by clb.maclb
having count(ct.mact) > 2;

select t.tentinh as 'Tỉnh', clb.tenclb as 'Tên clb', count(ct.mact) as 'Số lượng cầu thủ'
from QLBongDa.tinh t,
     QLBongDa.caulacbo clb,
     QLBongDa.cauthu ct
where clb.maclb = ct.maclb
  and clb.matinh = t.matinh
  and ct.vitri = 'tiền đạo'
group by tenclb;

select distinct tenclb, tentinh
from QLBongDa.caulacbo clb,
     QLBongDa.tinh t,
     QLBongDa.bangxh bxh
where clb.matinh = t.matinh
  and clb.maclb = bxh.maclb
  and bxh.nam = 2009
  and bxh.vong = 3
having max(bxh.diem);

# Câu 3
select hlv.tenhlv
	from QLBongDa.huanluyenvien hlv
	join QLBongDa.hlv_clb tg on hlv.mahlv = tg.mahlv
	where hlv.dienthoai is null and tg.vaitro is not null and tg.maclb is not null;

select hlv.*
	from QLBongDa.huanluyenvien hlv
	join QLBongDa.hlv_clb tg on hlv.mahlv = tg.mahlv
	where hlv.maqg = 'vn' and tg.vaitro is null and tg.maclb is null;

select distinct ct.*
	from QLBongDa.cauthu ct
	join QLBongDa.caulacbo clb on clb.maclb = ct.maclb
	join QLBongDa.bangxh bxh on bxh.maclb = ct.maclb
	where bxh.vong = 3 and bxh.nam = 2009 and bxh.hang > 6 or bxh.hang < 3;

select td.ngaytd, san.tensan, clb1.tenclb as tenclb1, clb2.tenclb as tenclb2, td.ketqua
	from QLBongDa.trandau td
	join QLBongDa.caulacbo clb1 on td.maclb1 = clb1.maclb
	join QLBongDa.caulacbo clb2 on td.maclb2 = clb2.maclb
	join QLBongDa.sanvd san on td.masan = san.masan
    join (select * from QLBongDa.bangxh where vong = 3 and nam = 2009 order by hang asc limit 1) as TG on TG.maclb = td.maclb1 or TG.maclb = td.maclb2;
