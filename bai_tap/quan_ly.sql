use bai_tap_big;
create table vi_tri(
id_vi_tri int unique,
ten_vi_tri varchar(45),
primary key(id_vi_tri)
);
create table trinh_do(
id_trinh_do int unique,
trinh_do varchar(45),
primary key(id_trinh_do)
);
create table bo_phan(
id_bo_phan int unique,
ten_bo_phan varchar(45),
primary key (id_bo_phan)
);
create table nhan_vien(
id_nhan_vien int unique,
ho_ten varchar(45),
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
ngay_sinh date,
so_cmtnd varchar(45),
sdt varchar(11),
email varchar(45),
dia_chi varchar(45),
primary key(id_nhan_vien),
foreign key (id_vi_tri) references vi_tri(id_vi_tri),
foreign key(id_trinh_do) references trinh_do(id_trinh_do),
foreign key(id_bo_phan) references bo_phan(id_bo_phan)
);

create table loai_khach(
id_loai_khach int unique,
ten_loaikhach varchar(45),
primary key (id_loai_khach)
);

create table khach_hang(
id_khach_hang int unique,
id_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
so_cmtnd varchar(45),
sdt varchar(11),
email varchar(45),
dia_chi varchar(45),
primary key (id_khach_hang),
foreign key(id_loai_khach) references loai_khach(id_loai_khach)
);

create table kieu_thue(
id_kieu_thue int unique,
ten_kieu_thue varchar(45),
gia int,
primary key (id_kieu_thue)
);

create table loai_dich_vu(
id_loai_dich_vu int unique,
ten_loai_dich_vu varchar(45),
primary key (id_loai_dich_vu)
);

create table dich_vu(
id_dich_vu int unique,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da int,
chi_phi_thue int,
id_kieu_thue int,
id_loai_dich_vu int,
trang_thai varchar(45),
primary key (id_dich_vu),
foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue),
foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);

create table hop_dong(
id_hop_dong int unique,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
tong_tien int,
primary key (id_hop_dong),
foreign key(id_nhan_vien) references nhan_vien(id_nhan_vien),
foreign key (id_khach_hang) references khach_hang(id_khach_hang),
foreign key (id_dich_vu) references dich_vu(id_dich_vu)
);

create table dich_vu_di_kem(
id_dich_vu_di_kem int unique,
ten_dich_vu_di_kem varchar(45),
gia int,
don_vi varchar(5),
trang_thai_kha_dung varchar(45),
primary key (id_dich_vu_di_kem)
);

create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int unique,
id_hop_dong int,
id_dich_vu_di_kem int,
soluong int,
primary key (id_hop_dong_chi_tiet),
foreign key (id_hop_dong) references hop_dong(id_hop_dong),
foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);

INSERT INTO vi_tri (id_vi_tri, ten_vi_tri) VALUES
(1, 'Lễ tân'),
(2, 'Phục vụ'),
(3, 'Chuyên viên'),
(4, 'Giám sát'),
(5, 'Quản lý'),
(6, 'Giám đốc');

INSERT INTO trinh_do (id_trinh_do, trinh_do) VALUES
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Sau đại học');

INSERT INTO bo_phan (id_bo_phan, ten_bo_phan) VALUES
(1, 'Sale – Marketing'),
(2, 'Hành chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');

INSERT INTO nhan_vien (id_nhan_vien, ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmtnd, sdt, email, dia_chi) VALUES
(1, 'Nguyen Van A', 1, 3, 1, '1990-01-15', '123456789', '0987654321', 'a.nguyen@furama.com', 'Quang Tri'),
(2, 'Tran Thi B', 2, 2, 3, '1992-02-20', '223456789', '0987654322', 'b.tran@furama.com', 'Hue'),
(3, 'Le Van C', 3, 4, 4, '1988-03-30', '323456789', '0987654323', 'c.le@furama.com', 'Ha Noi'),
(4, 'Pham Thi D', 4, 3, 2, '1985-04-25', '423456789', '0987654324', 'd.pham@furama.com', 'Da Nang'),
(5, 'Nguyen Van E', 5, 4, 4, '1987-05-10', '523456789', '0987654325', 'e.nguyen@furama.com', 'Da Nang'),
(6, 'Tran Thi F', 6, 3, 1, '1991-06-15', '623456789', '0987654326', 'f.tran@furama.com', 'TP Ho Chi Minh'),
(7, 'Le Van G', 1, 2, 3, '1993-07-20', '723456789', '0987654327', 'g.le@furama.com', 'Da Nang'),
(8, 'Pham Thi H', 2, 4, 2, '1989-08-25', '823456789', '0987654328', 'h.pham@furama.com', 'Quang Tri');

INSERT INTO loai_khach (id_loai_khach, ten_loaikhach) VALUES
(1, 'Diamond'),
(2, 'Platinum'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');

INSERT INTO khach_hang (id_khach_hang, id_loai_khach, ho_ten, ngay_sinh, so_cmtnd, sdt, email, dia_chi) VALUES
(1, 1, 'Nguyen Van X', '1980-09-05', '123456123', '0987651234', 'x.nguyen@gmail.com', 'Ha Noi'),
(2, 2, 'Tran Thi Y', '1992-10-10', '223456123', '0987651235', 'y.tran@gmail.com', 'Hue'),
(3, 3, 'Le Van Z', '1995-11-15', '323456123', '0987651236', 'z.le@gmail.com', 'Da Nang'),
(4, 4, 'Pham Thi K', '1988-12-20', '423456123', '0987651237', 'k.pham@gmail.com', 'Sai Gon'),
(5, 5, 'Nguyen Van L', '1990-01-25', '523456123', '0987651238', 'l.nguyen@gmail.com', 'Hue'),
(6, 1, 'Tran Thi M', '1993-02-28', '623456123', '0987651239', 'm.tran@gmail.com', 'Da Nang'),
(7, 2, 'Le Van N', '1994-03-30', '723456123', '0987651240', 'n.le@gmail.com', 'Ha Noi');

INSERT INTO kieu_thue (id_kieu_thue, ten_kieu_thue, gia) VALUES
(1, 'Thuê theo năm', 10000000),
(2, 'Thuê theo tháng', 1000000),
(3, 'Thuê theo ngày', 500000),
(4, 'Thuê theo giờ', 50000);

INSERT INTO loai_dich_vu (id_loai_dich_vu, ten_loai_dich_vu) VALUES
(1, 'Villa'),
(2, 'House'),
(3, 'Room');

INSERT INTO dich_vu (id_dich_vu, ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai) VALUES
(1, 'Villa Ocean View', 200, 2, 6, 2000000, 3, 1, 'Available'),
(2, 'House Garden View', 120, 1, 4, 1500000, 2, 2, 'Available'),
(3, 'Room Deluxe', 60, 1, 2, 1000000, 1, 3, 'Available');

INSERT INTO dich_vu_di_kem (id_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung) VALUES
(1, 'Massage', 500000, 'Buổi', 'Available'),
(2, 'Karaoke', 300000, 'Giờ', 'Available'),
(3, 'Thức ăn', 200000, 'Phần', 'Available'),
(4, 'Nước uống', 50000, 'Ly', 'Available'),
(5, 'Thuê xe', 800000, 'Ngày', 'Available');

INSERT INTO hop_dong (id_hop_dong, id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien) VALUES
(1, 1, 1, 1, '2024-01-01', '2024-01-15', 5000000, 20000000),
(2, 2, 2, 2, '2024-02-01', '2024-02-10', 3000000, 12000000),
(3, 3, 3, 3, '2024-03-05', '2024-03-20', 7000000, 25000000),
(4, 4, 4, 2, '2024-04-10', '2024-04-30', 6000000, 22000000),
(5, 5, 5, 1, '2024-05-01', '2024-05-15', 4000000, 15000000);

INSERT INTO hop_dong_chi_tiet (id_hop_dong_chi_tiet, id_hop_dong, id_dich_vu_di_kem, soluong) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 5, 2);

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * from nhan_vien where (ho_ten like '%H' or ho_ten like '%T' or ho_ten like '%K') and length(ho_ten) <= 15;

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang where timestampdiff(year,ngay_sinh,curdate()) between 18 and 50
	and (dia_chi = 'Da Nang' or dia_chi = 'Quang Tri');

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select k.id_khach_hang, k.ho_ten, count(hd.id_hop_dong) as bookings_count
from khach_hang k
join loai_khach lk on k.id_loai_khach = lk.id_loai_khach
left join hop_dong hd on k.id_khach_hang = hd.id_khach_hang
where lk.ten_loaikhach = 'Diamond'
group by k.id_khach_hang
order by bookings_count asc;

-- 5.Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. 
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select k.id_khach_hang, k.ho_ten, lk.ten_loaikhach, hd.id_hop_dong, d.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,(d.chi_phi_thue + hdc.soluong * dvk.gia) as tong_tien
from khach_hang k
join loai_khach lk on k.id_loai_khach = lk.id_loai_khach
left join hop_dong hd on k.id_khach_hang = hd.id_khach_hang
left join dich_vu d on hd.id_dich_vu = d.id_dich_vu
left join hop_dong_chi_tiet hdc on hd.id_hop_dong = hdc.id_hop_dong
left join dich_vu_di_kem dvk on hdc.id_dich_vu_di_kem = dvk.id_dich_vu_di_kem
order by k.id_khach_hang;

-- 6.Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của 
-- tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
where dv.id_dich_vu not in(
			select distinct hd.id_dich_vu
            from hop_dong hd
            where hd.ngay_lam_hop_dong between '2019-01-01' and '2019-03-31'
);

-- 7.Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã 
-- từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
where dv.id_dich_vu in (
			select distinct hd.id_dich_vu
            from hop_dong hd
            where year(hd.ngay_lam_hop_dong) = 2018
	)
    and dv.id_dich_vu not in(
			select distinct hd.id_dich_vu
            from hop_dong hd
            where year(hd.ngay_lam_hop_dong) = 2019
);

-- 8.Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
select distinct ho_ten
from khach_hang;

select ho_ten
from khach_hang
group by ho_ten;

select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select 
	month(hd.ngay_lam_hop_dong) as thang,
    count(distinct hd.ngay_lam_hop_dong) as so_khach_hang
from hop_dong hd
where 
	year(hd.ngay_lam_hop_dong) = 2019
group by
	month(hd.ngay_lam_hop_dong)
order by thang;

-- 10.Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
select hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,
		sum(hdc.soluong) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdc on hd.id_hop_dong = hdc.id_hop_dong
group by
	hd.id_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc
order by
	hd.id_hop_dong;