use bai_tap;
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

select * from nhan_vien where (ho_ten like '%H' or ho_ten like '%T' or ho_ten like '%K') and length(ho_ten) <= 15;

select * from khach_hang where timestampdiff(year,ngay_sinh,curdate()) between 18 and 50
	and (dia_chi = 'Da Nang' or dia_chi = 'Quang Tri');

select k.id_khach_hang, k.ho_ten, count(hd.id_hop_dong) as bookings_count
from khach_hang k
join loai_khach lk on k.id_loai_khach = lk.id_loai_khach
left join hop_dong hd on k.id_khach_hang = hd.id_khach_hang
where lk.ten_loaikhach = 'Diamond'
group by k.id_khach_hang
order by bookings_count asc;

select k.id_khach_hang, k.ho_ten, lk.ten_loaikhach, hd.id_hop_dong, d.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,(d.chi_phi_thue + hdc.soluong * dvk.gia) as tong_tien
from khach_hang k
join loai_khach lk on k.id_loai_khach = lk.id_loai_khach
left join hop_dong hd on k.id_khach_hang = hd.id_khach_hang
left join dich_vu d on hd.id_dich_vu = d.id_dich_vu
left join hop_dong_chi_tiet hdc on hd.id_hop_dong = hdc.id_hop_dong
left join dich_vu_di_kem dvk on hdc.id_dich_vu_di_kem = dvk.id_dich_vu_di_kem
order by k.id_khach_hang;